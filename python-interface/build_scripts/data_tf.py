import dask.bag as db
import dask.dataframe as dd

import json
from pathlib import Path
from typing import Dict
import argparse


def get_datapaths(build_dir: Path) -> Dict[str, Path]:
    datapath = build_dir / "data"

    return {f.name.lower(): f for f in datapath.glob("*/") if f.is_dir()}


def load_json(json_file: Path):
    with json_file.open() as f:
        return json.load(f)


def flatten(record):
    # TODO Find a better way to flatten the authors without loss
    if "author" in record["root"]["authors"]:
        record["root"]["authors"] = ';'.join([
            author["name"] for author in record["root"]["authors"]["author"]
        ])
    else:
        record["root"]["authors"] = ""

    return record["root"]


def get_bag(build_dir: Path, base_dtype: str = "json") -> db.Bag:
    """possible to do any text pre-processing here"""
    dtype_path = get_datapaths(build_dir).get(base_dtype)
    return (
        db.from_sequence(dtype_path.glob(f"*.{base_dtype}")).map(load_json).map(flatten)
    )


def bag_to_df(bag: db.Bag, index_key: str = "pid") -> dd.DataFrame:
    return get_bag(build_dir).to_dataframe().set_index(index_key)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="make parquet from json")
    parser.add_argument(
        "-o",
        "--overwrite",
        default=False,
        action="store_true",
        help="overwrite (possible) existing parquet?",
    )
    args = parser.parse_args()

    parq_file = Path(__file__).parents[1] / "cord19_cdcs" / "cord19_cdcs.parquet"
    if args.overwrite or not parq_file.exists():

        build_dir = Path(__file__).resolve().parents[2] / "build"
        bag = get_bag(build_dir)
        df = bag_to_df(bag)

        df.to_parquet(parq_file, storage_options={"has_nulls": True}, engine="pyarrow")
    # print(bag.to_dataframe().isna().sum().compute())
    print("done!")
