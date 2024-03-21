# Alert Manager

In order for the alerting component to work, a Kubernetes secret called "slack-hook-url" needs to be created. The content of the secret needs to be the Slack Hook API url.

For more information see

1. [](https://kubernetes.io/docs/secrets/)
2. [](https://api.slack.com/incoming-webhooks)

command to create kubernetes slack webhook  secret

> kubectl create secret generic slack-webhook-secret --from-literal=slack-url=YOUR_SLACK_WEBHOOK_URL
