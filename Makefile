emacs.pdf: emacs.md
	pandoc emacs.md -o emacs.pdf -V classoption=supertabular -V geometry=landscape -V papersize=a4paper
