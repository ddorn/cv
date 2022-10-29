CC = pdflatex


all: resume.pdf french_resume.pdf

%.pdf: %.tex
	@echo "Compiling $@"
	@$(CC) $^



clean:
	rm *.pdf *.log *.out *.aux
