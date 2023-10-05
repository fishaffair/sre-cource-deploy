IP() { kubectl --kubeconfig ./student*.yaml get ingress | tail -n 1 | awk '{print $4}' ; }

while [ "$(IP)" == "80" ]
do
        echo "Waiting for ingress..."
        sleep 10
done

echo "Ingress IP: $(IP)"

printf '\n'

echo "API Live-Check:"

curl -H 'Host:app.test' 'http://'$(IP)'/healthz/live/'

printf '\n'

echo "API Ready-Check:"

curl -H 'Host:app.test' 'http://'$(IP)'/healthz/ready'

printf '\n'

echo "API Response:"

curl -X 'GET' -H 'Host:app.test' 'http://'$(IP)'/Cities/1' -H 'accept: text/plain'

printf '\n'

curl -X 'GET' -H 'Host:app.test' 'http://'$(IP)'/Forecast/1' -H 'accept: text/plain'

printf '\n'