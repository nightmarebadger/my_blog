all: tutorial build

build:
	@echo "-------------------------------------------------------------------"
	@echo "Building the blog ..."
	../bin/blogofile build

tutorial:
	@echo "-------------------------------------------------------------------"
	@echo "Converting Ipython notebook tutorials ..."
	cd tutorials/base && \
		../../../bin/ipython nbconvert *.ipynb --to html --template basic
