pipeline {
    parameters {
        string(name: 'node_label', defaultValue: "master")
        string(name: 'data_url', defaultValue: "https://my-covid-data.org/dataset.tar.gz")
        string(name: 'access_token', defaultValue: "my_access_token")
        string(name: 'tag', defaultValue: "release_tag")
        string(name: 'name', defaultValue: "release_name")
    }

    agent { node {label params.node_label} }
    stages {
        stage('Download') {
            steps {
                dir ('build') {
                    sh """
                        # Create necessary directories
                        mkdir -p ./data ../dist/

                        # Download archive and untar
                        wget --no-check-certificate -q \
                            ${params.data_url} -O data.tar.gz
                    """
                }
            }
        }
        stage("Prepare data") {
            steps {
                dir ('build') {
                    sh """
                        # Unzip directory
                        tar -xvzf ./data.tar.gz --strip-components=1

                        # Unzip JSON files for build
                        unzip -q -o JSON.zip -d ./data

                        # Move zip to dist folder
                        cp *.zip -t ../dist/
                    """
                }
            }
        }
        stage('Install dependencies') {
            steps {
                dir ('python-interface') {
                    sh """
                        python3 -m pip install poetry
                        python3 -m poetry install
                    """
                }
            }
        }
        stage('Build') {
            steps {
                dir ('python-interface') {
                    sh """
                        python3 -m poetry run task data-tf -o
                        python3 -m poetry build

                        cp ./dist/*.tar.gz ../dist/
                    """
                }
            }
        }
        stage('Release') {
            steps {
                dir ('dist') {
                    sh """
                        github_repo=pdessauw/cord19-cdcs-nist
                        release_url=https://api.github.com/repos/${github_repo}/releases
                        assets_url=https://uploads.github.com/repos/${github_repo}/releases

                        # Create the Github release
                        release=$(curl -XPOST -H "Authorization:token ${token}" \
                            --data "{\"tag_name\": \"${tag}\",
                                \"target_commitish\": \"master\",
                                \"name\": \"${name}\",
                                \"draft\": false, \"prerelease\": true}" ${release_url})

                        release_id=$(echo "$release" | sed -n -e 's/"id":\ \([0-9]\+\),/\1/p' | \
                                      head -n 1 | sed 's/[[:blank:]]//g')

                        # Upload asset for the release
                        for filename in $(ls)
                        do
                            curl -XPOST -H "Authorization:token ${token}" \
                                -H "Content-Type:application/octet-stream" \
                                --data-binary @${filename} \
                                ${assets_url}/${release_id}/assets?name=${filename}
                        done
                    """
                }
            }
        }
    }
    post {
        always {
            echo "Cleaning up..."
            deleteDir()
        }
    }
}
