
.PHONY: server agent controller
server:
	cd cmd/drone-server/ && go build -o ../../drone-server -v $(ls *.go)

server-linux:
	cd cmd/drone-server/ && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ../../drone-server -v $(ls *.go)

agent:
	cd cmd/drone-agent/ && go build -o ../../drone-agent -v $(ls *.go)

controller:
	cd cmd/drone-controller/ && go build -o ../../drone-controller -v $(ls *.go)