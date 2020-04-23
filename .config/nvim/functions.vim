function CompileLatex()
  lcd %:h " cd into file directorh
  silent !mkdir build
  silent !pdflatex -output-directory build %
endfunction
