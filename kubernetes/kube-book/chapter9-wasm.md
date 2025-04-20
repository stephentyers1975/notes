# chapter 9 WASM
* SpinKube from Fermyon

1. Install and test the pre-requisites
* install RUST
* `rustup target add wasm32-wasip1`
* install spin

2. Write and compile the Wasm app
`spin new tkb-wasm -t http-rust`
`cd tkb-wasm`
`spin build`

3. Build it into an OCI image and push it to an OCI registry
* Create Docker file in tkb-wasm
```
FROM scratch
COPY /target/wasm32-wasip1/release/tkb_wasm.wasm .
COPY spin.toml .
```
# run docker build to create image
```
docker build --platform wasi/wasm --provenance=false -t stephentyers1975/wasm:0.2 .
```
```
docker push stephentyers1975/wasm:0.2
```

4. Build and configure a new multi-node Kubernetes cluster for
Wasm
* install k3d
```
k3d cluster create wasm --image ghcr.io/deislabs/containerd-wasm-shims/examples/k3d -p "5005:80@loadbalancer" --agents 2
```
* check shims on node
`docker exec -it k3d-wasm-agent-1 ash`
`ls /bin | grep shim`
`cat /var/lib/rancher/k3s/agent/etc/containerd/config.toml`
* label node for wasm
`kubectl label nodes k3d-wasm-agent-1 wasm=yes`
`kubectl get nodes --show-labels | grep wasm=yes`
5. Deploy the runtime class and app to Kubernetes
`kubectl apply -f rc-spin.yml`
`kubectl get runtimeclass`
# create test spin app
`spin new tkb-wasm -t http-rust`
`kubectl apply -f app.yml`