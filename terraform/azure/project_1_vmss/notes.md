# add nsg rules
# add auto scale rules for vmss

* every resource should have tag "modified on" which should have the value of current timestamp
based on format YYYY-MM-DD
* Autoscaling rules cpy < 10 = scale in
* Autoscaling rules cpy > 80 = scale out
* NSG should only allow incoming traffic from loadbalancer to backend pool(vmss)
* set env variable for everything
* use locals whenever possible to make code managable
* use dynamic block for NSG
* use map for vm size based on the env name