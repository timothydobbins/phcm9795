library(tidyverse)
library(haven)
library(skimr)
library(broom)


# Import data

los <- read_stata("data/examples/Example_9.1.dta")
head(los)
skim(los)

los <- los %>% 
  mutate(ln_los = log(los+1))

hist(los$los)
hist(los$ln_los)

skim(los)

# Exponentiate the mean of ln_los
mean(los$ln_los)
exp(mean(los$ln_los))

wilcox.test(los$los ~ los$infect)

psych::describeBy(los ~ infect)

los %>% 
  group_by(infect) %>% 
  summarize(median_los = median(los),
            q1_los = quantile(los, 0.25),
            q3_los = quantile(los, 0.75))


# Wilcoxon matched-pairs signed-rank test
arthritis <- read_stata("data/examples/Example_9.2.dta") %>% 
  mutate(diff = drug_1 - drug_2)

head(arthritis)
skim(arthritis)

hist(arthritis$diff)

# Note that Stata can calculate an exact P-value
# To obtain the same P-value as the z-based test in Stata, need to add "correct=FALSE")
wilcox.test(arthritis$drug_1, arthritis$drug_2, paired=TRUE)



# Non-parametric correlation
lung <- read_stata("data/examples/Example_8.1.dta")

cor.test(lung$Height, lung$FVC, method="spearman")

cor.test(lung$Height, lung$FVC, method="kendall")
