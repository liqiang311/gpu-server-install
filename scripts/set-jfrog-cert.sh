set -e
if grep MIIF8zCCA9ugAwIBAgIJANAUiBELFnAwMA0GCSqGSIb3DQEBCwUAMIGPMQswCQYD /etc/ssl/certs/ca-certificates.crt >/dev/null 2>&1; then
    echo -e "\033[32m jrog-cert already set \033[0m"
    exit 0
fi
echo "-----BEGIN CERTIFICATE-----
MIIF8zCCA9ugAwIBAgIJANAUiBELFnAwMA0GCSqGSIb3DQEBCwUAMIGPMQswCQYD
VQQGEwJjbjEQMA4GA1UECAwHamlhbmdzdTEQMA4GA1UEBwwHbmFuamluZzEMMAoG
A1UECgwDenRlMQswCQYDVQQLDAJpdDEbMBkGA1UEAwwSKi5hcnRuai56dGUuY29t
....
-----END CERTIFICATE-----
" >> /etc/ssl/certs/ca-certificates.crt

service docker restart