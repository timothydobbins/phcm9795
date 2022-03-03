library(tidyverse)
library(haven)
library(skimr)
library(moments)

# Two-sample t-test

babies <- read_stata("data/examples/Example_5.1.dta") %>% 
  mutate(gender = factor(gender, levels=c(1,2), labels=c("Male", "Female")))

skim(babies)

ggplot(babies, aes(x = birthweight)) +
  geom_histogram(fill = "white", colour = "black", binwidth=0.25) +
  facet_wrap(gender ~ .)

ggplot(babies, aes(x = birthweight)) +
  geom_density() +
  facet_wrap(gender ~ .)

ggplot(babies, aes(y = birthweight, x=gender)) +
  geom_boxplot()

babies %>% 
  group_by(gender) %>% 
  skewness("birthweight")

babies %>% 
  group_by(gender) %>% 
  summarise(skewness = skewness(birthweight),
            kurtosis = kurtosis(birthweight))

t.test(birthweight ~ gender, data=babies)

# Paired t-test
# Read data in
bloodpressure <- read_stata("data/examples/Example_5.2.dta")

skim(bloodpressure)

bloodpressure <- mutate(bloodpressure, diff = sbp_dp - sbp_tp)

ggplot(bloodpressure, aes(x = diff)) +
  geom_histogram(fill = "white", colour = "black", binwidth = 10)

ggplot(bloodpressure, aes(x = diff)) +
  geom_density()

ggplot(bloodpressure, aes(y = diff)) +
  geom_boxplot()

t.test(Pair(sbp_tp, sbp_dp) ~ 1, data=bloodpressure)
