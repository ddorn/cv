# CC = latexmk -output-directory=out -pdf


all: out/resume.pdf out/resume_manuel.pdf

out/%.pdf: %.typ
	echo "Compiling $@"
	typst compile $< $@


clean:
	rm -r out/
	rm *.log *.out *.aux
