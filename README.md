# template-R-project
This is a template for an R project with some commonly used directories and suggestions on how to structure your data and scripts. 
If you start a new project, start by comming to this URL. Click "Use this template". That will create a new remote github repository. 
Give it the name of your new project.

You can then clone it from RStudio. Go to File -> New project -> Version Control -> Git. You can get the URL of the remote repository 
by clicking the "Clone" button on the main page of the new remote repository you've just created. Copy that URL into the
first field of the dialogue opened in RStudio. RStudio will automatically propose a folder name based on the name of the remote repository. 
I recommend you just stick with that, but you can change it. As for the folder location where you want the repository I recommend *not* 
putting it on dropbox, box, or alike. I typically keep the repositories on my desktop. Remember that these are just the local copies of 
your remote repository. As long as you regularly push changes you make from your local repository (on your computer) to the remote 
repository (on github), everything is backed up.

As a rule of thumb, **all and only content that is *not* reproducible** from other content in the git repository should be included 
in the repository. For example, you should include all necessary raw data and scripts, but typically you should not include the models
that are fit to the data (still this repository contains a subfolder for models, so that your code can *store* models in that folder, 
without tracking those files).

As a rule of thumb, do *not* include your .Rproj file in the repository. As a rule of thumb, *do* include the .gitignore file.

If you follow standards of the field, you will likely want to share more than just the data and code, but also stimuli and the 
materials that went into creating the stimuli. In that case, make sure to add additional folders (e.g., stimuli/, materials/, etc.).
But keep in mind that these types of files can be very large. So we tend to upload these files onto OSF, rather than including them
into the git repository. However, if the inclusion of large files in the git repository becomes necessary, check out https://git-lfs.github.com/.
