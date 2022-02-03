SHELL = /bin/sh

all:		book report

book:		htmlbook htmlimagesbook pdfbook

htmlbook:	inst/rmarkdown/templates/book/skeleton/html_files/*.*

inst/rmarkdown/templates/book/skeleton/html_files/%: 	inst/rmarkdown/resources/html_files/%
														cp $< $@

htmlimagesbook:	inst/rmarkdown/templates/book/skeleton/html_files/images/*

inst/rmarkdown/templates/book/skeleton/html_files/images/%:	inst/rmarkdown/resources/images/%
															cp $< $@

pdfbook:	inst/rmarkdown/templates/book/skeleton/pdf_files/*

inst/rmarkdown/templates/book/skeleton/pdf_files/%:	inst/rmarkdown/resources/pdf_files/%
													cp $< $@

report:		htmlreport htmlimagesreport pdfreport

htmlreport:	inst/rmarkdown/templates/report/skeleton/html_files/*.*

inst/rmarkdown/templates/report/skeleton/html_files/%: 	inst/rmarkdown/resources/html_files/%
														cp $< $@

htmlimagesreport:	inst/rmarkdown/templates/report/skeleton/html_files/images/*

inst/rmarkdown/templates/report/skeleton/html_files/images/%:	inst/rmarkdown/resources/images/%
																cp $< $@

pdfreport:	inst/rmarkdown/templates/report/skeleton/pdf_files/*

inst/rmarkdown/templates/report/skeleton/pdf_files/%:	inst/rmarkdown/resources/pdf_files/%
														cp $< $@
