NAME ?= Undead-Kernel-wt88047

DATE := $(shell date +'%Y%m%d-%H%M')

ZIP := $(NAME)-$(DATE).zip

EXCLUDE := Makefile *.git*

all: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE) -x 'LICENSE' 'README.md'
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."

clean:
	@rm -vf "$(NAME)-"*.zip*
	@rm -vf zImage
	@rm -vf dt.img
	@echo "Done."
