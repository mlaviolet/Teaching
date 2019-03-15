# data sets from Bush (2012) Biostatistics: An applied introduction for the
#   Public Health Practitioner, Clifton Park, NY: Delmar.

library(mosaic)
library(purrr)
library(readxl)
setwd("P:/Bush/Data")

# childhood obesity study, p. 3--no data given

# Herbicide exposure study, p. 91
hgb <- read_xls("hgb.xls") %>% 
  mutate(ID = sprintf("%03d", ID),
         group = factor(group, 1:3, c("Tap water only", 
                                      "Bottled/filtered Water only",
                                      "Both")),
         prenatal = factor(prenatal, 0:1, 
                           c("No", "Adequate PNC")),
         psmoke = factor(psmoke, 0:1, c("No", "Pre-pregnancy smoker")),
         parity = factor(parity, 0:3, c("None", "One", "Two", "Three ormore")),
         ed = factor(ed, 0:2, 
                     c("Less than HS", "HS/GED", "College or more"))) %>% 
  # somehow, columns appearing with all missings; remove
  map(~ .x) %>%
  discard(~ all(is.na(.x))) %>%
  map_df(~ .x) 

# Malaria, p. 155
nets <- read_xls("nets.xls") %>% 
  mutate(ID = sprintf("%04d", ID),
         rural = factor(rural, 1:0, c("Rural", "Urban")),
         hcdist = factor(hcdist, 1:3, c("Within 15 miles",
                                        "Between 15 and 50 miles", 
                                        "Greater than 50 miles")),
         child = factor(child, 0:1, c("No children", "Children")),
         wealth = factor(wealth, 1:4, c("Lowest 25%", "Next lowest",
                                        "Next highest", "Highest")),
         roof = factor(roof, 1:3, c("Thatched", "Corrugated Metal", "Other")),
         type = factor(type, 1:3),
         malaria = factor(malaria, 1:0, c("Death from malaria", "No death")),
         net = factor(net, 0:1, c("No net", "Used net")))

# Fractures, p. 233
fracture <- read_xls("frac.xls") %>% 
  mutate(ID = sprintf("%04d", i)) %>% 
  select(ID, everything()) %>% 
  select(-i) %>% 
  mutate(cal = factor(cal, 0:1, c("No", "Calcium use")),
         frachx = factor(frachx, 0:1, c("No", "History of fracture")),
         race = factor(race, 1:3, c("White", "Black", "Other")),
         act = factor(act, 1:4, c("None", "Limited", "Moderate", "Rigorous")),
         strint = factor(strint, 0:1, c("No", "Strength training")))

# atrazine study, p. 35
atrazine <- read_xls("at.xls") %>% 
  mutate(ID = sprintf("%03d", ID),
         cause = factor(cause),
         prior = factor(prior, 0:1, c("No", "Prior injuries")),
         gender = factor(gender, 1:0, c("Male", "Female")),
         rtp = factor(rtp, 0:1, c("No", "Returned to play")))

save(at, frac, hgb, nets, file = "Bush.Rdata")
