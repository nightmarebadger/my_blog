all: tutorial build
blog: build

build: minify
	@echo "-------------------------------------------------------------------"
	@echo "Building the blog ..."
	../bin/blogofile build


tutorial:
	@echo "-------------------------------------------------------------------"
	@echo "Converting Ipython notebook tutorials ..."
	cd tutorials/base && \
		../../../bin/ipython nbconvert *.ipynb --to html --template basic

minify:
	@echo "-------------------------------------------------------------------"
	@echo "Minifying custom.css and custom-notebook.css"
	java -jar _tools/yuicompressor-2.4.8.jar --type css \
		css/nonminified/custom.css -o css/custom.min.css -v
	java -jar _tools/yuicompressor-2.4.8.jar --type css \
		css/nonminified/custom-notebook.css -o css/custom-notebook.min.css -v
