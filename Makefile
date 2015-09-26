FORMS=$(wildcard *.commonform)
COMMONFORM=node_modules/.bin/commonform

all: $(FORMS:.commonform=.docx)

pdf: $(FORMS:.commonform=.pdf)

%.pdf: %.docx
	doc2pdf $<

$(COMMONFORM):
	npm i --save commonform/commonform-cli

%.docx: %.commonform %.signatures.json %.options $(COMMONFORM)
	$(COMMONFORM) render -f docx -s $*.signatures.json $(shell cat $*.options) < $< > $@

%.docx: %.commonform %.options $(COMMONFORM)
	$(COMMONFORM) render -f docx $(shell cat $*.options) < $< > $@

.PHONY: lint critique

lint:
	for form in $(FORMS); do \
		echo $$form; \
		$(COMMONFORM) lint < $$form | sort -u; \
		echo; \
	done

critique:
	for form in $(FORMS); do \
		echo $$form; \
		$(COMMONFORM) critique < $$form | sort -u; \
		echo; \
	done
