import dask.bag as db
import dask.dataframe as dd
from xmlschema import XMLSchema
import json
from pathlib import Path
from typing import Dict
import argparse
from toolz.curried import update_in, partial, flip, pipe


def get_datapaths(build_dir: Path) -> Dict[str, Path]:
    datapath = build_dir / "data"

    return {f.name.lower(): f for f in datapath.glob("*/") if f.is_dir()}


def get_schema(build_dir: Path) -> XMLSchema:
    dp = get_datapaths(build_dir)
    schemapath = str(next(dp["xml"].glob("**/*.xsd")))
    return XMLSchema(schemapath)


def load_xml(schema: XMLSchema, p: Path) -> Dict:
    assert schema.is_valid(str(p)), f"invalid xml detected! {p}"
    return schema.to_dict(str(p))


# def load_json(json_file: Path):
#     with json_file.open() as f:
#         return json.load(f)


# def flatten(record):
#     # TODO Find a better way to flatten the authors without loss
#     if "author" in record["root"]["authors"]:
#         record["root"]["authors"] = [
#             author["name"] for author in record["root"]["authors"]["author"]
#         ]
#     else:
#         record["root"]["authors"] = []

#     return record["root"]


def flatten_authors(authdict: Dict):
    if authdict == None:
        return []
    else:
        return [auth.get("name") for auth in authdict.get("author", [])]


def split_keywords(kwstr: str):
    if kwstr == None:
        return kwstr
    else:
        return kwstr.split("\n")


def get_bag(build_dir: Path, base_dtype: str = "xml") -> db.Bag:
    """possible to do any text pre-processing here"""

    dtype_path = get_datapaths(build_dir).get(base_dtype)
    schema = get_schema(build_dir)
    filepaths = dtype_path.glob(f"**/*.{base_dtype}")

    _update_authors = flip(update_in(func=flatten_authors), ("authors",))

    _update_keywords = lambda d: pipe(
        d,
        *[
            update_in(func=split_keywords, keys=[kw])
            for kw in (col for col in d.keys() if col.endswith("_keywords"))
        ],
    )

    return (
        db.from_sequence(filepaths)
        .map(partial(load_xml, schema))
        .map(_update_authors)
        .map(_update_keywords)
    )


def bag_to_df(bag: db.Bag, index_key: str = "g_id") -> dd.DataFrame:
    return bag.to_dataframe()  # .set_index(index_key)  # TODO wait for official id


if __name__ == "__main__":
    import multiprocessing.popen_spawn_posix
    from dask.distributed import Client, progress

    client = Client()

    parser = argparse.ArgumentParser(description="build data products from CDCS XML")
    parser.add_argument(
        "-o",
        "--overwrite",
        default=False,
        action="store_true",
        help="overwrite (possible) existing data products?",
    )
    args = parser.parse_args()
    build_dir = Path(__file__).resolve().parents[2] / "build"
    parq_file = Path(__file__).parents[1] / "cord19_cdcs" / "cord19_cdcs.parquet"
    bag = get_bag(build_dir)
    df = bag_to_df(bag)

    if args.overwrite or not parq_file.exists():
        print("Writing a parquet for python interface...")
        df.to_parquet(parq_file, storage_options={"has_nulls": True}, engine="pyarrow")
        print("wrote parquet!")
    if args.overwrite or not (build_dir / "JSON").exists():
        print("Writing compressed json...")
        bag.map(json.dumps).to_textfiles(str(build_dir) + "/JSON/cdcs-export_*.json.gz")
        print("wrote json!")
    if args.overwrite or not (build_dir / "CSV").exists():
        print("Writing CSV files...")
        df.to_csv(str(build_dir) + "/CSV/cdcs-export-*.csv")
        print("wrote csv!")
    # print(bag.to_dataframe().isna().sum().compute())
    print("done!")
