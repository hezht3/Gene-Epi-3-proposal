require(tidyverse)

# heritability visulization

tibble(
    paper = c("Bailey, A., 1995", "Tick, B., 2016", "Klei, L., 2012",
              "Bai, D., 2019", "PGC Consortium, 2013", "Byrne, E.M., 2021",
              "Grove, J., 2019"),
    estimate = c(0.90, 0.74, 0.552, 0.808, 0.17, 0.12, 0.118),
    type = c(rep("Based on Phenotype", 4), rep("SNP heritability", 3))
) %>% 
    mutate(paper = factor(paper, levels = c("Bailey, A., 1995", "Tick, B., 2016", "Klei, L., 2012",
                                            "Bai, D., 2019", "PGC Consortium, 2013", "Byrne, E.M., 2021",
                                            "Grove, J., 2019"))) %>% 
    mutate(type = factor(type, levels = c("Based on Phenotype", "SNP heritability"))) %>% 
    ggplot(aes(x = paper, y = estimate, fill = estimate)) +
    geom_bar(stat = "identity", width = 0.5) +
    scale_fill_continuous(high = "#132B43", low = "#56B1F7", guide = "none") +
    xlab("") +
    ylab("Heritability estimates") +
    theme(panel.grid = element_line(colour = "grey92"),
          axis.text.x = element_text(angle = 15, vjust = 0.5, hjust = 0.5),
          axis.ticks = element_blank(), legend.background = element_blank(), 
          legend.key = element_blank(), panel.background = element_blank(), 
          legend.position = "bottom",
          panel.border = element_blank(), strip.background = element_blank(), 
          plot.background = element_blank(), complete = TRUE)
