LIB_TMPL = $(wildcard lib/*.tmpl)
LIB_PY = $(patsubst %.tmpl,%.py,$(LIB_TMPL))

TMPL = $(wildcard *.tmpl)
PY = $(patsubst %.tmpl,%.py,$(TMPL))
HTM = $(patsubst %.tmpl,%.htm,$(TMPL))

.PHONY: all
all: $(HTM)

venv: requirements.txt
	rm -rf venv
	virtualenv venv -ppython3
	venv/bin/pip install -rrequirements.txt

%.py: %.tmpl |venv
	venv/bin/cheetah-compile $^

%.htm: %.py $(LIB_PY)
	venv/bin/python -m $* > $@

.PHONY: push
push: venv
	venv/bin/markdown-to-presentation push \
		--default-branch real_main \
		--pages-branch main \
		.nojekyll README.md CNAME \
		*.htm *.html css images ppm salon winxphtml

.PHONY: clean
clean:
	rm -rf $(HTM) $(PY) $(LIB_PY) venv

.SECONDARY:
