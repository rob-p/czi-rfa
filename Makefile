all: proposal.pdf

proposal.pdf: proposal.md
	pandoc proposal.md -V fontsize=11pt -V mainfont="Arial"  -V geometry:margin=1in --latex-engine=xelatex -o proposal.pdf

clean:
	rm proposal.pdf
