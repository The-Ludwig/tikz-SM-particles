TEXTARGET=particles.pdf
TEXSOURCE=particles.tex

TEXOPTIONS = -lualatex \
		--output-directory=build \
		--interaction=nonstopmode \
		--halt-on-error \

TEXPREFIX = max_print_line=1048576 \

all: build/$(TEXTARGET) 

clean:
	rm -rf build

build:
	mkdir -p build

# Use this to work on tex-document, it will be updated continuesly by latexmk
work:
	$(TEXPREFIX) latexmk -pvc $(TEXOPTIONS) $(TEXSOURCE)

build/$(TEXTARGET): $(TEXSOURCE) $(TEXDEPEND) $(PYTARGET) FORCE | build
	$(TEXPREFIX) latexmk $(TEXOPTIONS) $(TEXSOURCE)

FORCE:

.PHONY: all clean FORCE build
