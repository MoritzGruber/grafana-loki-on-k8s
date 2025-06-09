
kubectl create ns monitoring

# if no default storage class is set, set some as default
# kubectl patch storageclass csi-cinder-high-speed -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

# kube-state-metrics
helm upgrade --install kube-state-metrics prometheus-community/kube-state-metrics -n monitoring

# cAdvisor
helm repo add ckotzbauer https://ckotzbauer.github.io/helm-charts
helm upgrade --install cadvisor ckotzbauer/cadvisor -n monitoring

kubectl annotate service -n monitoring cadvisor prometheus.io/scrape=true prometheus.io/port=8080
kubectl annotate service -n monitoring kube-state-metrics prometheus.io/scrape=true prometheus.io/port=8080

kubectl apply -k ./deployment
