.PHONY: clean

# requires that Pod-PseudoPod-LaTeX is available in the parent directory of
# the xs-fun directory, i.e. from within the xs-fun directory do:
# $ cd ..
# $ git clone https://github.com/chromatic/Pod-PseudoPod-LaTeX.git
# $ cd xs-fun
# to ensure that you can build the pdf
pdf:
	perl build/tools/build_chapters.pl
	perl -I../Pod-PseudoPod-LaTeX/lib build/tools/build_latex.pl
	cd build/pdf && pdflatex xs-fun.tex && pdflatex xs-fun.tex

test:
	prove -r t/

clean:
	rm -f build/pdf/*.pdf
