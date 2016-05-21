#!/bin/bash

VM=hris
DOCKER_MACHINE_LOC=/usr/local/bin/docker-machine
VBOXMANAGE=/Applications/VirtualBox.app/Contents/MacOS/VBoxManage
STORAGE_PATH=/Volumes/workspace/.docker/hris
DOCKER_MACHINE=/usr/local/bin/docker-machine

BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

unset DYLD_LIBRARY_PATH
unset LD_LIBRARY_PATH

clear

if [ ! -f "${DOCKER_MACHINE_LOC}" ] || [ ! -f "${VBOXMANAGE}" ]; then
  cat <<EOF
    Either VirtualBox or Docker Machine are not installed. Please re-run the Toolbox Installer and try again.
EOF
  exit 1
fi

"${VBOXMANAGE}" list vms | grep \""${VM}"\" &> /dev/null
VM_EXISTS_CODE=$?

if [ $VM_EXISTS_CODE -eq 1 ]; then
  "${DOCKER_MACHINE}" -s ${STORAGE_PATH} -D rm -f "${VM}" &> /dev/null
  rm -rf "${STORAGE_PATH}"/machines/"${VM}"
  "${DOCKER_MACHINE}" -s ${STORAGE_PATH} -D create -d virtualbox --virtualbox-memory 2048 \
    --virtualbox-disk-size 204800 "${VM}"
fi

VM_STATUS="$(${DOCKER_MACHINE} -s ${STORAGE_PATH} status ${VM} 2>&1)"
if [ "${VM_STATUS}" != "Running" ]; then
  "${DOCKER_MACHINE}" -s ${STORAGE_PATH} start "${VM}"
  yes | "${DOCKER_MACHINE}" -s ${STORAGE_PATH} regenerate-certs "${VM}"
fi

eval "$(${DOCKER_MACHINE} -s ${STORAGE_PATH} env --shell=bash ${VM})"

clear
cat << EOF


                        ##         .
                  ## ## ##        ==
               ## ## ## ## ##    ===
           /"""""""""""""""""\___/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
           \______ o           __/
             \    \         __/
              \____\_______/

=============== CORE =====================
EOF
echo -e "${BLUE}docker${NC} is configured to use the ${GREEN}${VM}${NC} \
  machine with IP ${GREEN}$(${DOCKER_MACHINE} -s ${STORAGE_PATH} ip ${VM})${NC}"
echo "For help getting started, check out the docs at https://docs.docker.com"
echo

USER_SHELL="$(dscl /Search -read /Users/${USER} UserShell | awk '{print $2}' | head -n 1)"
if [[ "${USER_SHELL}" == *"/bash"* ]] || [[ "${USER_SHELL}" == *"/zsh"* ]] || \
  [[ "${USER_SHELL}" == *"/sh"* ]]; then
  "${USER_SHELL}" --login
else
  "${USER_SHELL}"
fi
alias docker-machine='docker-machine -s "${STORAGE_PATH}"'
