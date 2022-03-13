setwd("D:/OneDrive - Johns Hopkins/Course/340.733.01 - Principles of Genetic Epidemiology 3/Student research project/Calculation and visulization")

require(tidyverse)

burden <- read_csv("burden_power.csv")

burden %>% 
    pivot_longer(cols = c(contains("power")),
                 names_to = "power",
                 values_to = "value") %>% 
    mutate(alpha = paste("Alpha = ", alpha, sep = "")) %>% 
    mutate(or_variant = factor(or_variant, levels = c(1.2, 1.5, 1.8))) %>% 
    ggplot(aes(x = or_variant, y = value, group = power, color = power)) +
    geom_line() +
    geom_point() +
    facet_wrap(~ alpha) +
    xlab("Odds Ratio of Causal Variants") +
    ylab("Power") +
    scale_color_manual("Proportion of causal variants (Jc/J)",
                       values = c("#0099e5", "#ff4c4c", "#34bf49"),
                       labels = c("20%", "25%", "30%")) +
    theme(panel.grid = element_line(colour = "grey92"),
          axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),
          axis.ticks = element_blank(), legend.background = element_blank(), 
          legend.key = element_blank(), panel.background = element_blank(), 
          legend.position="bottom",
          panel.border = element_blank(), strip.background = element_blank(), 
          plot.background = element_blank(), complete = TRUE)

skat <- read_csv("skat_power.csv")

skat %>% 
    pivot_longer(cols = c(contains("power")),
                 names_to = "power",
                 values_to = "value") %>% 
    mutate(alpha = paste("Alpha = ", alpha, sep = "")) %>% 
    mutate(or_variant = factor(or_variant, levels = c(1.2, 1.5, 1.8))) %>% 
    ggplot(aes(x = or_variant, y = value, group = power, color = power)) +
    geom_line() +
    geom_point() +
    facet_wrap(~ alpha) +
    xlab("Odds Ratio of Causal Variants") +
    ylab("Power") +
    scale_color_manual("Models for genetic architecture",
                       values = c("#0099e5", "#ff4c4c", "#34bf49"),
                       labels = c("S1", "S2", "S3")) +
    labs(caption = "S1: MAF is independent of EV \n
         S2: MAF is independent of genetic effects measured in the unit of per copy of an allele \n
         S3: MAF is negatively correlated with genetic effect through the function β = −log10(MAF)") +
    theme(panel.grid = element_line(colour = "grey92"),
          axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),
          axis.ticks = element_blank(), legend.background = element_blank(), 
          legend.key = element_blank(), panel.background = element_blank(), 
          legend.position="bottom",
          panel.border = element_blank(), strip.background = element_blank(), 
          plot.background = element_blank(), complete = TRUE)
