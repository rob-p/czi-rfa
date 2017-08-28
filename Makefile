all: proposal.pdf

proposal.pdf: proposal.md proposal.bib
	pandoc proposal.md -V fontsize=11pt -V citecolor=blue --highlight-style=espresso -V mainfont="Arial"  -V geometry:margin=1in --latex-engine=xelatex --bibliography=proposal.bib --csl=acm-sig-proceedings.csl -o proposal.pdf

proposal.docx: proposal.md proposal.bib
	pandoc proposal.md -V fontsize=11pt --highlight-style=espresso -V mainfont="Arial"  -V geometry:margin=1in --latex-engine=xelatex --bibliography=proposal.bib --csl=acm-sig-proceedings.csl -o proposal.docx

clean:
	rm proposal.pdf
