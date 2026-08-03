# MB5370-Module-2-Workshop-1

Workshop 1: Foundations of data science begins with building off the skill learnt in Module 1 with a focus on preparing raw data to reveal underlying biological patterns. The workshop begins with importing data from various formats using tidyverse and readxl. 
 
Using the palmerpenguins dataset, the workshop covered key inspection functions like glimpse(), str(), and summary(). It also covered using core dplyr wrangling verbs like select(), filter(), and arrange(). Mutate() was also used for creating new variables. The workshop then introduced group summarisation with group_by() and summarise(). Statistics like the mean, standard deviation, and standard error was then calculated. Missing values were fixed using na.rm = true. These summaries were then piped directly into ggplot2 to build faceted point plots with error bars and refined custom colours, formatted axes, and cleaner theming. 
 
Overall, the workshop demonstrates a full workflow from raw data import to polished visualisation and reinforced manual coding skills. 
 


Reflection on the AI-Off Phase

Coding without Copilot or chattr forced me to actually read and trace console error messages myself, rather than relying on AI suggestions to fix them. This made me pay closer attention to variable classes and data structures, particularly when comparing the base R data frame (benthic_cover_df) with the tidyverse tibble (benthic_cover). Printing both side by side showed clear differences. The tibble displayed a condensed preview with labelled data types, while the data frame printed all rows and columns in full without type labels, feeling clunkier for larger datasets. Working through these distinctions manually, rather than having them explained by an AI tool, slowed my pace but deepened my understanding of how R actually handles and represents data.
