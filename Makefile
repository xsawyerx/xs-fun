.PHONY: clean

pdf:
	perl build/tools/build_pdf.pl

clean:
	rm -f build/pdf/*.pdf
