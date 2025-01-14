rrs_primer.pdf: rrs_primer.Rmd ms_changes-crop.pdf pandoc-header.tex
	Rscript -e 'rmarkdown::render("$<")'

rrs_primer.docx: rrs_primer.Rmd
	Rscript -e 'rmarkdown::render("$<", output_format="word_document")'

submission: rrs_primer.pdf rrs_primer.docx
	git commit -m 'auto-generated submission' rrs_primer.pdf rrs_primer.docx rrs_primer.Rmd

ms_changes-crop.pdf: ms_changes.tex
	pdflatex $^
	pdfcrop ms_changes.pdf


# rrs_primer.pdf: rrs_primer.md
# 	pandoc --include-in-header=pandoc-header.tex -o $@ $^

clean:
	rm -f *.html *.pdf *.tex

