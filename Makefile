FORMS=$(wildcard *.commonform)
VARIABLES=variables.json
COMMONFORM=node_modules/.bin/commonform

all: $(FORMS:.commonform=.docx)

pdf: $(FORMS:.commonform=.pdf)

%.pdf: %.docx
	doc2pdf $<

$(COMMONFORM):
	npm i --save commonform/commonform-cli

%.docx: %.commonform %.signatures.json %.options $(VARIABLES) $(COMMONFORM)
	$(COMMONFORM) render -f docx -b $(VARIABLES) -s $*.signatures.json $(shell cat $*.options) < $< > $@

%.docx: %.commonform %.options $(VARIABLES) $(COMMONFORM)
	$(COMMONFORM) render -f docx -b $(VARIABLES) $(shell cat $*.options) < $< > $@

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
