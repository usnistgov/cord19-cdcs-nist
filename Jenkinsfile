pipeline {
    parameters {
        string(name: 'node_label', defaultValue: "master")
        string(name: 'data_url', defaultValue: "https://my-covid-data.org/dataset.tar.gz")
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
                        tar -xvzf ./data.tar.gz --strip-components=1
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
                        cp *.zip -t ../../dist/
                    """
                }
            }
        }
        stage('Install dependencies') {
            steps {
                dir ('python-interface') {
                    sh '''
                        python3 -m pip install poetry
                        python3 -m poetry install
                    '''
                }
            }
        }
        stage('Build') {
            steps {
                dir ('python-interface') {
                    sh '''
                        python3 -m poetry run task data-tf -o
                        python3 -m poetry build

                        cp ./dist/*.tar.gz ../dist/
                    '''
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
