# load libraries
library(MASS)
library(knitr)
library(tidyverse) # gotta be tidy
library(magrittr)  # pipe!

library(tufte)     # Tufte-style handout formatting
library(ggthemes)  # nice themes for plotting
library(scales)    # trans_new() etc. for axis transforms
library(ggforce)   # for powerful ggplot2 extensions
library(gganimate) # animation of plots
library(patchwork)
library(scatterplot3d)

library(lme4)      # frequentist GLMMs
library(broom)     # working with model output
library(broom.mixed)  # working with mixed model outputlibrary(sjPlot)
library(effects)
library(sjPlot)
library(brms)      # Bayesian regression models using Stan
library(rstanarm)  # Bayesian regression models using Stan
library(tidybayes) # tidy access to posterior draws (spread_draws, etc.)
library(marginaleffects)

# set R markdown formatting
opts_chunk$set(dev = 'pdf',
               comment = "", 
               echo = FALSE, warning = TRUE, message = TRUE,
               cache = FALSE, 
               size = "footnotesize",
               tidy = TRUE,
               tidy.opts = list(width.cutoff = 70),
               fig.width = 8, fig.height = 4.5, fig.align = "center")

def.chunk.hook  <- knitr::knit_hooks$get("chunk")
size.wrapper <- function(x, size) {
  if (size == "micro") {
    paste0("\n\\begingroup\n\\fontsize{3}{4.8}\\selectfont\n", x,
           "\n\\endgroup\n")
  } else if (size != "normalsize") {
    paste0("\n\\begingroup\n\\", size, "\n", x,
           "\n\\endgroup\n")
  } else {
    x
  }
}

knitr::knit_hooks$set(chunk = function(x, options) {
  x <- def.chunk.hook(x, options)
  size.wrapper(x, options$size)
})

def.output.hook <- knitr::knit_hooks$get("output")
knitr::knit_hooks$set(output = function(x, options) {
  x <- def.output.hook(x, options)
  if (identical(options$results, "asis")) x else size.wrapper(x, options$size)
})

color_block = function(color) {
  function(x, options) sprintf('\n\\color{%s}\\begin{verbatim}%s\\end{verbatim}\\color{black}\n',
                               color, x)
}
knitr::knit_hooks$set(error = color_block('red'))
knitr::knit_hooks$set(warning = color_block('orange'))

# constants
chains <- 4
options(
  width = 70,
  mc.cores = min(chains, parallel::detectCores()))

theme_set(theme_bw())
