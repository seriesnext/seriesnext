FORMS=$(wildcard *.commonform)
COMMONFORM=node_modules/.bin/commonform

all: $(FORMS:.commonform=.docx)

$(COMMONFORM):
	npm i --save commonform/commonform-cli

%.docx: %.commonform %.options $(COMMONFORM)
	$(COMMONFORM) render -f docx $(shell cat $*.options) < $< > $@

%.md: %.commonform %.options $(COMMONFORM)
	$(COMMONFORM) render -f markdown $(shell cat $*.options) < $< > $@
