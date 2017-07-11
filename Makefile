.PHONY: show clean clean-all

basename = kontorskilt
pdf_file = $(basename).pdf
tex_file = $(basename).tex
figdir = fig
figs_basename = apollon.pdf english-logo.pdf norsk-logo.pdf
figs = $(foreach figure,$(figs_basename), $(figdir)/$(figure))

$(pdf_file): $(tex_file) $(figs)
	pdflatex $(tex_file)
	pdflatex $(tex_file)

show: $(pdf_file)
	evince $(pdf_file) &

clean:
	$(RM) $(basename).aux $(basename).log

clean-all: clean
	$(RM) $(pdf_file)
