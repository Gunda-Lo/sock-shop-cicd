# Configuring Ingress for Kubernetes cluster

## Ingress is required so that the app can be accessible on the internet

To make use of the Infress resource you need an Ingress controller, I chose the > Nginx Ingress controller
The installation guide can be found here [](https://kubernetes.github.io/ingress-nginx/deploy/#aws) and the ingress resource documentation can be found here [](https://kubernetes.io/docs/concepts/services-networking/ingress/)

Using helm, the command to install nginx ingress controller is > helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace

## Accessing your application via https

To secure web traffic to your app, you use https, doing that requires SSL?TLS configuration

### Steps

Install a cert manager
> kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.4/cert-manager.yaml

Create your certificate issuer resource, certificate resource, and your ingress resource
Apply the resources.

Obtain the cluster IP addres by using the command
> kubectl get services -n <namespace> <ingress-controller-service-name> -o jsonpath='{.status.loadBalancer.ingress[0].ip}'

Configure your DNS record to point to the IP address obtained above.