.PHONY: clean

pdf:
	perl build/tools/build_pdf.pl

test:
	prove -r t/

clean:
	rm -f build/pdf/*.pdf
