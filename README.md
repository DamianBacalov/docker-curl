# docker-curl
Description
---
Container to generate traffic to a service.

How to use it
---
For Kubernetes, just create a job yaml file with the URLs, Request count, and seconds between calls.

The following example will generate 10 pods and will make 100 calls each with a pause of half a second between each call.

```
apiVersion: batch/v1
kind: Job
metadata:
  name: traffic-generator
spec:
  ttlSecondsAfterFinished: 10
  template:
    metadata:
      labels:
        app: traffic-generator
    spec:
      restartPolicy: Never
      containers:
      - image: bdamian/docker-curl:1.0.1
        name: docker-curl
        env:
        - name: REQUESTS_COUNT
          value: "100"
        - name: SECONDS_BETWEEN_REQUESTS
          value: "0.5"
        - name: URLS
          value: >
            https://host/
            http://host/page
            https://host/page2

  completions: 10
  parallelism: 10
```
