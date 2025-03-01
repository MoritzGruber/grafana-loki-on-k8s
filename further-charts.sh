
# kube-state-metrics
helm install kube-state-metrics prometheus-community/kube-state-metrics -n monitoring

# cAdvisor
helm repo add ckotzbauer https://ckotzbauer.github.io/helm-charts
helm install cadvisor ckotzbauer/cadvisor -n monitoring