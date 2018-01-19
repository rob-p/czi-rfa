all: proposal.pdf

proposal.pdf: proposal.md proposal.bib
	pandoc proposal.md --variable fontsize=11pt --variable colorlinks --variable urlcolor=blue --variable mainfont="Palatino"  --variable geometry:margin=1in --pdf-engine=xelatex --bibliography=proposal.bib --csl=acm-sig-proceedings.csl -o proposal.pdf

proposal.docx: proposal.md proposal.bib
	pandoc proposal.md --variable fontsize=11pt --variable colorlinks --variable urlcolor=blue --highlight-style=espresso --variable colorlinks --variable mainfont="Palatino"  --variable geometry:margin=1in --pdf-engine=xelatex --bibliography=proposal.bib --csl=acm-sig-proceedings.csl -o proposal.docx

collab_net.docx: collab_net.md 
	pandoc collab_net.md --variable fontsize=11pt --variable colorlinks --variable urlcolor=blue --highlight-style=espresso --variable colorlinks --variable mainfont="Palatino"  --variable geometry:margin=1in -o collab_net.docx

part2_combined.pdf: part2.md
	pandoc part2.md --variable fontsize=11pt --variable colorlinks --variable urlcolor=blue --highlight-style=espresso --variable colorlinks --variable mainfont="Palatino"  --variable geometry:margin=1in --pdf-engine=xelatex -o part2.pdf
	pdftk part2.pdf detailed_budget.pdf cat output part2_combined.pdf

clean:
	rm proposal.pdf
