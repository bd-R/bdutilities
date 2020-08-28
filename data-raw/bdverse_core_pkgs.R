## code to prepare `bdverse_core_pkgs` dataset goes here:

bdverse_core_pkgs <- c(
                       "bdutilities",
                       "bdutilities.app",
                       "bdDwC",
                       "bddwc.app",
                       "bdchecks",
                       "bdchecks.app",
                       "bdclean",
                       "bdverse"
                       )

usethis::use_data(bdverse_core_pkgs, overwrite = TRUE) # add data to pkg
