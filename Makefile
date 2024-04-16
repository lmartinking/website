IMG_NAME := website

ifeq ($(shell command -v podman 2> /dev/null),)
    CMD=docker
else
    CMD=podman
endif


.PHONY: website
website: content
	$(CMD) build -t $(IMG_NAME) .


content/css/normalize.css:
	curl "https://raw.githubusercontent.com/necolas/normalize.css/master/normalize.css" -o content/css/normalize.css


.PHONY: fmt
fmt:
	./caddy fmt --overwrite Caddyfile
