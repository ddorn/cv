CC = latexmk -output-directory=out -pdf


all: out/resume.pdf

out/%.pdf: %.tex
	@echo "Compiling $@"
	@$(CC) $^


clean:
	rm -r out/
	rm *.log *.out *.aux