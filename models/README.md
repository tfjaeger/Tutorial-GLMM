This is where your the results of your analysis go. This could include, for example, Stan code (consider a separate subfolder) or the 
fits of varioues GLMM or GAMMs. 

Typically, the models are *not* checked into the git repository, as they tend to be large and because they can be reproduced from the code. 
In rare cases, you might want to include model fits in your git repository. If you share models, make sure to do so in a generally accessible 
format (e.g., .RData but not .rds).

Ideally, filenames should transparently map onto the variable names of the objects they store. If anything filenames should be more verbose 
(not less) than the variable names. This will help you identify what a file contains without loading it into the program. This might not seem
like a big deal but is really helpful as soon as you have more than a few files.

Additionally, try to follow a consistent naming scheme. Definitely read the tidyverse style guide: https://style.tidyverse.org/
