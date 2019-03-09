#!/bin/bash

TOKEN="2Rv0qsp4i3x6IcnAsH0owvskByZr2QOd"

#curl -X POST -H "Authorization: Bearer $TOKEN" "http://127.0.0.1:8000/api/repos/crazyzi/lark"|python -m json.tool



#curl -X GET -H "Authorization: Bearer $TOKEN" "http://127.0.0.1:8000/api/repos/crazyzi/lark"|python -m json.tool


curl -X GET -H "Authorization: Bearer $TOKEN" "http://127.0.0.1:8000/api/stream/crazyzi/lark"


docker run \
  --volume=/var/run/docker.sock:/var/run/docker.sock \
  --env=DRONE_GIT_ALWAYS_AUTH=false \
  --env=DRONE_GITEA_SERVER=http://localhost:3000 \
  --env=DRONE_GITEA_DEBUG=true \
  --env=DRONE_RUNNER_CAPACITY=2 \
  --env=DRONE_SERVER_HOST=localhost:8000 \
  --env=DRONE_SERVER_PROTO=http \
  --env=DRONE_TLS_AUTOCERT=false \
  -e=DRONE_LOGS_DEBUG=true \
  -e=DRONE_LOGS_TEXT=true \
  -e=DRONE_LOGS_COLOR=true \
  --publish=8000:80 \
  --publish=443:443 \
  --restart=always \
  --detach=true \
  --name=drone \
  drone/drone:latest


    #--volume=/var/lib/drone:/data \