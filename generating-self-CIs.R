install.packages('rcicr')
library(rcicr)
library(tidyverse)

# The rcicr packages does not allow use of tibble dataset 
RCdata <- readxl::read_xlsx('The_Mirror_of_Mind.XLSX', sheet = 2) %>% 
  data.frame() 

# The rcicr packages does not allow use of tibble dataset 
RCdata <- readxl::read_xlsx('Table 1.XLSX', sheet = 2) %>% 
    data.frame() 

# A data-frame that contains participants' ID, stimulus ID, and responses
RCdata 

female_ci <- batchGenerateCI2IFC(RCdata %>% filter(ID == "ex_f"),  
                    by = "ID",
                    stimuli = "stim_ID",
                    responses = "response",
                    baseimage = "female",
                    rdata = "female.Rdata",
                    saveasjpeg = F)

scaled_cis <- autoscale(female_ci, saveasjpegs = TRUE)


male_ci <- batchGenerateCI2IFC(RCdata %>% filter(ID == "ex_m"),  
                                 by = "ID",
                                 stimuli = "stim_ID",
                                 responses = "response",
                                 baseimage = "male",
                                 rdata = "male.Rdata",
                                 saveasjpeg = F)

scaled_cis <- autoscale(male_ci, saveasjpegs = TRUE)

