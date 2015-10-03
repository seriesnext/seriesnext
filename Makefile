FORMS=$(wildcard *.commonform) investment-agreement.commonform disclosure-schedule.commonform
VARIABLES=variables.json
VARIABLES_TO_BLANKS=variables-to-blanks.js
COMMONFORM=node_modules/.bin/commonform
MUSTACHE=node_modules/.bin/mustache
ENGLISH_LIST=node_modules/english-list

all: $(FORMS:.commonform=.docx)

pdf: $(FORMS:.commonform=.pdf)

%.pdf: %.docx
	doc2pdf $<

node_modules/%:
	npm i

.SECONDARY: node_modules

$(VARIABLES_TO_BLANKS): $(ENGLISH_LIST)

blanks.json: $(VARIABLES_TO_BLANKS) $(VARIABLES)
	node $(VARIABLES_TO_BLANKS) $(VARIABLES) > $@

%.signatures.json: %.signatures.js $(VARIABLES)
	node $< $(VARIABLES) > $@

%.commonform: %.mustache $(VARIABLES) $(MUSTACHE)
	$(MUSTACHE) $(VARIABLES) $*.mustache > $@

%.docx: %.commonform %.signatures.json %.options blanks.json $(COMMONFORM)
	$(COMMONFORM) render -f docx -b blanks.json -s $*.signatures.json $(shell cat $*.options) < $< > $@

certificate-of-incorporation.docx: certificate-of-incorporation.commonform certificate-of-incorporation.options blanks.json $(COMMONFORM)
	$(COMMONFORM) render -f docx -b blanks.json $(shell cat certificate-of-incorporation.options) < $< > $@

disclosure-schedule.docx: disclosure-schedule.commonform disclosure-schedule.options blanks.json $(COMMONFORM)
	$(COMMONFORM) render -f docx -b blanks.json $(shell cat disclosure-schedule.options) < $< > $@

.PHONY: lint critique

lint: $(FORMS)
	for form in $(FORMS); do \
		echo $$form; \
		$(COMMONFORM) lint < $$form | sort -u; \
		echo; \
	done

critique: $(FORMS)
	for form in $(FORMS); do \
		echo $$form; \
		$(COMMONFORM) critique < $$form | sort -u; \
		echo; \
	done
