pipeline {
    parameters {
        string(name: 'node_label', defaultValue: "master")
        string(name: 'data_url', defaultValue: "https://my-covid-data.org/dataset.tar.gz")
        string(name: 'access_token', defaultValue: "github-access-token")
        string(name: 'tag', defaultValue: "release_tag")
        string(name: 'name', defaultValue: "release_name")
        string(name: 'branch', defaultValue: "master")
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
                sh """
                    git tag -f ${params.tag}
                """

                dir ('build') {
                    sh """
                        # Unzip directory
                        tar -xvzf ./data.tar.gz --strip-components=1

                        # Unzip XML files for build
                        unzip -q -o XML.zip -d ./data

                        # Move zip to dist folder
                        cp *.zip -t ../dist/
                    """

                    def xsd_files = sh(
                        script: 'find . -name "*.xsd"', returnStdout: true
                    ).split()

                    for (int i = 0; i < xsd_files.size(); i++) {
                        def xsd_file = xsd_files[i]
                        sh """
                            cp $xsd_file ./data/XML
                        """
                    }
                }
            }
        }
        stage("Prepare environment") {
            steps {
                sh """
                    python3 -m venv /tmp/venv-${BUILD_TAG}
                    . /tmp/venv-${BUILD_TAG}/bin/activate
                    pip install -U pip
                    pip install -r ./requirements.txt
                """
            }
        }
        stage('Install dependencies') {
            steps {
                dir ('python-interface') {
                    sh """
                        . /tmp/venv-${BUILD_TAG}/bin/activate
                        poetry install
                    """
                }
            }
        }
        stage('Build') {
            steps {
                dir ('python-interface') {
                    sh """
                        . /tmp/venv-${BUILD_TAG}/bin/activate
                        poetry run task data-tf -o
                        poetry build

                        cp ./dist/*.tar.gz ../dist/
                    """
                }
            }
        }
        stage('Release') {
            steps {
                dir ('dist') {
                    withCredentials([
                        string(credentialsId: "${params.access_token}", variable: 'TOKEN')
                    ]) {
                        script {
                            def repository = sh(
                                script: """
                                    git remote get-url origin | cut -d':' -f2 | sed -r "s;.git;;g"
                                """, returnStdout: true
                            ).trim()

                            def release_url = "https://api.github.com/repos/${repository}/releases"
                            def assets_url = "https://uploads.github.com/repos/${repository}/releases"

                            def release = sh(script: """
                                # Create the Github release
                                curl -XPOST -H "Authorization:token $TOKEN" \
                                    --data '{
                                        "tag_name": "${params.tag}",
                                        "target_commitish": "master",
                                        "name": "${params.name}",
                                        "draft": false, "prerelease": true
                                    }' $release_url
                            """, returnStdout: true)

                            def release_id = sh(script: """
                                echo "$release" | grep "id: " | head -n1 | \
                                    cut -d':' -f2 | sed -r "s;[^0-9];;g"
                            """, returnStdout: true).trim()

                            def files = sh(
                                script: 'ls', returnStdout: true
                            ).split()

                            for (int i = 0; i < files.size(); i++) {
                                def filename = files[i]
                                sh """
                                    curl -XPOST -H "Authorization:token $TOKEN" \
                                        -H "Content-Type:application/octet-stream" \
                                        --data-binary @$filename \
                                        $assets_url/$release_id/assets?name=$filename
                                """
                            }
                        }
                    }
                }
            }
        }
    }
    post {
        always {
            sh """
                rm -rf /tmp/venv-${BUILD_TAG}/
            """
            echo "Cleaning up..."
            deleteDir()
        }
    }
}
