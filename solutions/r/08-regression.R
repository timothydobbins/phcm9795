library(tidyverse)
library(haven)
library(skimr)
library(broom)

# Import data

lung <- read_stata("data/examples/Example_8.1.dta")
head(lung)
skim(lung)

# Creating a scatter plot

plot <- ggplot(lung, aes(x=Height, y=FVC)) +
  geom_point() +
  labs(x="Height (cm)", y="FVC (L)", title="Scatter plot") +
  theme_classic()

plot

# Add a regression line
plot +
  geom_smooth(method=lm, colour="darkred", se=FALSE) +
  theme_classic()

# Calculate correlation coefficients
cor(lung$Height, lung$FVC)
cor.test(lung$Height, lung$FVC)



# Obtain linear regression
model <- lm(FVC ~ Height, data=lung)
model

glance(model)
tidy(model, conf.int = TRUE)

diagnostics <- augment(model)
hist(diagnostics$.resid)

residplot <- ggplot(diagnostics, aes(x=.resid)) +
  geom_histogram(binwidth=0.25, colour="black", fill="white") +
  theme_classic()
residplot

residdens <- ggplot(diagnostics, aes(x=.resid)) +
  geom_density() +
  theme_classic()
residdens
