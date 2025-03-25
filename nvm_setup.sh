#!/bin/bash

echo "Downloading the NVM install script"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

echo "Installed NVM and now adding completion"

cat <<'EOF'>> /home/${USER}/.zprofile

# NVM init
[[ -d "$XDG_CONFIG_HOME/nvm" ]] && NVM_DIR="${XDG_CONFIG_HOME}/nvm" && \
[[ -s "${NVM_DIR}/nvm.sh" ]] && . "${NVM_DIR}/nvm.sh" && \
[[ -s "${NVM_DIR}/bash_completion" ]] && . "${NVM_DIR}/bash_completion"
EOF
