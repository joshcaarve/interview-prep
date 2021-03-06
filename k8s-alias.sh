alias k="kubectl"
alias kgp="kubectl get pods"
alias kgd="kubectl get deployments"
alias kgs="kubectl get svc"
alias kgi="kubectl get ingress"
alias kgnp="kubectl get networkpolicies"
alias kgc="kubectl get configmap"
alias kgep="kubectl get endpoints"
alias kgj="kubectl get jobs"
alias kgcj="kubectl get cronjob"
alias kgns="kubectl get ns"
alias kgpa="kubectl get pods --all-namespaces"


alias busybox="kubectl run -i --tty busybox --image=busybox --restart=Never"
alias busydel="kubectl delete pod busybox"

alias api="k get pods -o name | cut -d "/" -f2 | grep api"
