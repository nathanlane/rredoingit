# Code and snippets for updating R and reinstalling packages.


# 1. SAVE CURRENT PACKAGES.
# Run on old computer, save packages to Dropbox.
tmp = installed.packages() 
old_installedpackages = as.vector(tmp[is.na(tmp[,"Priority"]), 1]) 
file_path <- file.path("~" , "Dropbox" , "CodeProgrammingSync" , "R" , "installed_packages.rda" )
save( old_installedpackages , file = file_path )

# 2. NEXT, DOWNLOAD AND INSTALL NEW R.
# Install and update R, then load R Studio.


# 3. REOPEN AND INSTALL PACKAGES.

# Reload package list.
load(file_path)
oldinstallpackages <- installedpackages #Rename dataframe.

# Looped installer. Yes, not functional R-style.
for (count in 1:length(installedpackages)) { 
  
  install.packages( installedpackages[count] , 
                    dependencies = TRUE ,
                    force = FALSE ,
                    repos = "https://cloud.r-project.org" ) 

}

#... the last argument (repos) is optional. Specific to my R.




# Doodle: if a system has a long, incomplete list of packages,
# ... it may pay to compare subsets of old vs. install pkgs.
compare(oldinstallpackages, 
        currentlyinstalledpackages)

subset(oldinstallpackages, 
       !(oldinstallpackages %in% currentlyinstalledpackages), 
       select)
