build:
	docker build --tag my-app .

start:
	docker run -it -p 8001:8001 -p 8080:8080 --rm my-app

stop:
	docker stop `docker ps -aq --filter ancestor=my-app`

debug:
	bash -c "dlv connect :8001 --init <(sed 's|PWD|'`pwd`'|g; s|HOME|'$HOME'|g' dlv.init)"

send-request:
	curl -s localhost:8080
