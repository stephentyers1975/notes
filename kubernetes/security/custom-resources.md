# custom resource
```
apiVersion: flights.com/v1
kind: FlightTicket
metadata:
  name: my-flight-ticket
spec:
  from: Mumbai
  to: London
  number: 2

```
# Custom resource definition
```
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourcedefinition
metadata:
  name: flighttickets.flights.com
spec:
  scope: Namespaced
  group: flights.com
  names: 
    kind: FlightTicket
    singular: flightticket
    plural: flighttickets
    shortNames:
      - ft
  versions:
    - name: v1
      served: true
      storage: true
      schema:
        openAPIV3Schema
          type: object
          properties:
            from:
              type: string
            to:
              type: string
            number:
              type: integer
              minimum: 1
              maximum: 10

```
## create definition
`kubectl create -f flightticket-custome-definition.yaml`
## create resource
`kubectl create -f flightticket.yaml`

# Custom controllers
* built in go
* custom controller repo
* build as pod or service on your cluster

# operator framework
* packages CRD and controller
* operator hub operatorhub.io