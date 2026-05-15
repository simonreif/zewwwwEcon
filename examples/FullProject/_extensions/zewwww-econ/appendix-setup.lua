function Div(el)
  if el.classes:includes("appendix-setup") then
    local letter = el.attributes["letter"] or "A"
    
    if FORMAT:match("latex") then
      return pandoc.RawBlock("latex", string.format([[
\renewcommand{\thetable}{%s.\arabic{table}}
\renewcommand{\thefigure}{%s.\arabic{figure}}
\setcounter{table}{0}
\setcounter{figure}{0}
\FloatBarrier
]], letter, letter))
    end
    
    return pandoc.Null()
  end
end