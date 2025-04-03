#!/bin/bash

if [ ! $UID -eq 0 ]; then
    echo "Run script as admin"
    exit 1
else
    cd /tmp/
    echo "Downloading kubectl from k8s"
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

    echo "Downloading SHA sum to validate binary"
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
fi

echo "Checking sum:"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
STATUS="$(cat kubectl.sha256)  kubectl" | sha256sum --check
if [[ $STATUS == *"kubectl: OK"* ]]; then
     sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
else
    echo "Terminating operation"
    exit 1
fi

