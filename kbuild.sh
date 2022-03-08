function kbuild { kustomize build $1 > $1.yaml }

export -f kbuild
