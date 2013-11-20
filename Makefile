all:
	echo "Converting Ipython notebook tutorials"
	cd tutorials/base && \
		../../../bin/ipython nbconvert *.ipynb --to html --template basic
	echo "Building the blog"
	../bin/blogofile build
