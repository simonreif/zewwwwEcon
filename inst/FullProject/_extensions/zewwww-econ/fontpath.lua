-- Resolves the absolute path to the extension's fonts/ directory and
-- exposes it as the pandoc template variable $font-path$.
-- This allows zewPaperTemplate.tex to load the bundled Linux Libertine
-- fonts regardless of where the user's document lives.

function Meta(meta)
  -- Get the directory containing this filter script
  local scriptdir = PANDOC_SCRIPT_FILE:match("(.+)[/\\][^/\\]+$") or "."
  -- Wrap as raw LaTeX inlines so pandoc does not escape underscores or
  -- other characters when substituting into the pandoc template.
  meta["font-path"] = pandoc.MetaInlines({
    pandoc.RawInline("latex", scriptdir .. "/fonts/")
  })
  -- Used by zewSlidesTemplate.tex for bundled image assets.
  -- Ignored by zewPaperTemplate.tex (unused variables are silently dropped).
  meta["images-path"] = pandoc.MetaInlines({
    pandoc.RawInline("latex", scriptdir .. "/zewwwwImages/")
  })
  return meta
end
