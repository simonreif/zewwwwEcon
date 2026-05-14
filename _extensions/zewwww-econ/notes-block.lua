-- Default numeric values
local DEFAULT_WIDTH = 1.0          -- means 1.0 * \textwidth
local DEFAULT_VSPACE_ABOVE = -5     -- pt
local DEFAULT_VSPACE_BELOW = 15    -- pt

-- Helper to parse numeric attributes or fall back
local function parse_numeric(attr, default)
  local num = tonumber(attr)
  if num then
    return num
  else
    return default
  end
end

function Div(div)
if div.classes:includes('notes-block') and (FORMAT:match('latex') or FORMAT:match('beamer')) then
    -- Read and parse numeric values
    local width_factor = parse_numeric(div.attributes["width"], DEFAULT_WIDTH)
    local above_pt = parse_numeric(div.attributes["above"], DEFAULT_VSPACE_ABOVE)
    local below_pt = parse_numeric(div.attributes["below"], DEFAULT_VSPACE_BELOW)

    -- Format LaTeX-ready strings
    local width_str = string.format("%.2f\\textwidth", width_factor)
    local above_str = string.format("%dpt", above_pt)
    local below_str = string.format("%dpt", below_pt)

    -- Build LaTeX blocks
    local start_latex = string.format([[
\vspace{%s}
\begin{minipage}{%s}
\scriptsize
\singlespacing
]], above_str, width_str)

    local end_latex = string.format([[
\end{minipage}\vspace{%s}]], below_str)

    -- Inject into Div
    table.insert(div.content, 1, pandoc.RawBlock('latex', start_latex))
    table.insert(div.content, pandoc.RawBlock('latex', end_latex))

    return div
  end
end
