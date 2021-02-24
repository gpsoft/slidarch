HTTPDPORTNO ?= 8088

CMD_LIST := serve

all:
	@echo Usage:
	@echo make serve

.PHONY: $(CMD_LIST)
.SILENT: $(CMD_LIST)

serve:
	echo Web server port: $(HTTPDPORTNO)
	docker run --rm --init \
		--volume $(shell pwd):/home/marp/app \
		--publish $(HTTPDPORTNO):8080 \
		--publish 37717:37717 \
		--name marp-cli \
		marpteam/marp-cli \
		--server public/

%:
	@:
