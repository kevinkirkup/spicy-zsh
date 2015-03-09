#!/bin/zsh

export R_HISTFILE="~/.RHistory"

# Render the specified RMarkdown document
r_render() {
  R -e "rmarkdown::render('$1')"
}
