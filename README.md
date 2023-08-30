# k8s-autocert
Automatic cert through letsencrypt for k8s deployment to use with Kong Ingress and TLS termination
Leverages exposed variables to ascertain email for Let's Encrypt  - $admin_email 
Also needs var $clusterfqdn which should equal your full fqdn used by Ingress
Pod should also present kubeconfig from secret

This script creates a secret in k8s to be used as a cert.  The secret is named sitecert

