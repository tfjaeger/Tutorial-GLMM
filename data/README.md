This is where your raw data files should go. 
Ideally, only generally accessible formats should be used. E.g., .csv or .tab files or, if necessary, .RData (but not .rds) files. 
Make sure that the filenames are verbose, making it easier for your collaborators (or others you share your project with) to navigate 
the raw data, to check, edit, etc. as necessary. I.e., don't use opaque abbreviations. Instead write out words. It might seem like 
unnecessary work, but you're only doing it once. Also coding does *not* become more complicated with longer filenames since RStudio 
and other programs all offer auto-completion while coding, including for filenames.

Additionally, try to follow a consistent naming scheme. For example, if you're working with multiple languages, you might have data files like

*German-perception-data.csv*

*English-perception-data.csv*

*English-production-data.csv*

...

rather than 

*German-perception-data.csv*

*Perception.csv*

*Production-English.csv*

...

If this project has a lot of data files, consider grouping them into subfolders. For example, if you're important many individual data files 
from various data sources, make different folders for each data source.
