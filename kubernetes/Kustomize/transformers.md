# Common Transformers

```
commonLabels:
  org: KodeKloud
```

```
namespace: lab
```

```
namePrefix: KodeKloud-
nameSuffix: -dev
```

```
commonAnnotations: 
  branch: master
```

# Image transformers
## change image

```
images:
  - name: nginx
    newName: haproxy
```

## change image tag
```
images:
  - name: nginx
    newTag: 2.4
```

## change both image and image tag
```
images:
  - name: nginx
    newName: haproxy
    newTag: 2.4
```