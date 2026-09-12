# load libraries
library(MASS)
library(knitr)
library(tidyverse) # gotta be tidy
library(magrittr)  # pipe!

library(tufte)     # Tufte-style handout formatting
library(ggthemes)  # nice themes for plotting
library(scales)    # trans_new() etc. for axis transforms
library(gganimate) # animation of plots
library(patchwork)
library(scatterplot3d)

library(broom)     # working with model output
library(broom.mixed)  # working with mixed model output
library(brms)      # Bayesian regression models using Stan
library(rstanarm)  # Bayesian regression models using Stan
library(tidybayes) # tidy access to posterior draws (spread_draws, etc.)
library(marginaleffects)

# set R markdown formatting
opts_chunk$set(dev = 'pdf',
               comment="", 
               echo=FALSE, warning=TRUE, message=TRUE,
               cache=FALSE, 
               size="footnotesize",
               tidy.opts = list(width.cutoff = 250),
               fig.width = 8, fig.height = 4.5, fig.align = "center")

def.chunk.hook  <- knitr::knit_hooks$get("chunk")
knitr::knit_hooks$set(chunk = function(x, options) {
  x <- def.chunk.hook(x, options)
  ifelse(options$size != "normalsize", paste0("\n \\", options$size,"\n\n", x, "\n\n \\normalsize"), x)
})

color_block = function(color) {
  function(x, options) sprintf('\\color{%s}\\begin{verbatim}%s\\end{verbatim}\\color{black}',
                               color, x)
}
knitr::knit_hooks$set(error = color_block('red'))
knitr::knit_hooks$set(warning = color_block('orange'))

# constants
chains <- 4
options(
  width = 1000,
  mc.cores = min(chains, parallel::detectCores()))

theme_set(theme_bw())
