
kubectl create ns monitoring
# kube-state-metrics
helm upgrade --install kube-state-metrics prometheus-community/kube-state-metrics -n monitoring

# cAdvisor
helm repo add ckotzbauer https://ckotzbauer.github.io/helm-charts
helm upgrade --install cadvisor ckotzbauer/cadvisor -n monitoring

kubectl annotate service -n monitoring cadvisor prometheus.io/scrape=true prometheus.io/port=8080
kubectl annotate service -n monitoring kube-state-metrics prometheus.io/scrape=true prometheus.io/port=8080

kubectl apply -k ./deployment
