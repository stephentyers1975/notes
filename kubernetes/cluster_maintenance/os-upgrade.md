# OS upgrade

## drain node of workloads to gracefully terminate workloads, makes node unschedulable so node maintenance an be done
`kubectl drain node_name`
### ignore Daemonsets
`kubectl drain node01 --ignore-daemonsets`
## cordon node marks node as unschedulable but does not gracefully terminate pods like the drain command
`kubectl cordon node_name`
## uncordon node to make pod schedulable after being brought back up. pods that were moved off node prior  will not automatically come back to node
`kubectl uncordon node_name`

