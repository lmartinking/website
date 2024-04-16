IMG_NAME := website


.PHONY: website
website: content
	podman build -t $(IMG_NAME) .


content/css/normalize.css:
	curl "https://raw.githubusercontent.com/necolas/normalize.css/master/normalize.css" -o content/css/normalize.css


.PHONY: fmt
fmt:
	./caddy fmt --overwrite Caddyfile
