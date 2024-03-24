# Using Jenkins to deploy the Architecture for the app.

## Do not forget to edit the vpc id portion of the script

use this command to push the output values into a file

terraform output  > vpc_id.txt

## Unlock Jenkins

use >sudo cat /var/lib/jenkins/secrets/initialAdminPassword< to reveal the Jenkins unlock key.

### Add credentials and download plugins

Add Github and Aws credentials, download >docker, docker commons, docker api, doker-build-step
