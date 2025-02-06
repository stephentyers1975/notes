# Application failures
* check front end ip/port with curl
* check service configuration and endpoint discovery with kubectl describe
* compare selctors between pod/deployment and services match
* check pod status/restarts
* check detailed pod information using kubectl describe command
* check pod logs using kubectl logs command
* use kubectl logs command with -f watch option or look at --previous pod version log
  * kubectl logs web -f
  * kubectl logs web -f --previous
* check all pod and service tiers in this manner