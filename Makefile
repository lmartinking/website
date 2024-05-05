IMG_NAME := website
NAMESPACE := website


.PHONY: website
website: content
	podman build -t $(IMG_NAME) .


content/css/normalize.css:
	curl "https://raw.githubusercontent.com/necolas/normalize.css/master/normalize.css" -o content/css/normalize.css


.PHONY: fmt
fmt:
	./caddy fmt --overwrite Caddyfile


.PHONY: run
run:
	podman run --rm -p 8080:80 $(IMG_NAME)


.PHONY: pre-deploy
pre-deploy:
	kubectl create namespace $(WEBSITE)


.PHONY: deploy
deploy:
	kubectl apply --validate=strict -f deployment.yaml -n $(NAMESPACE)

