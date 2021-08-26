# The evolution of a plot

rm(list = ls(all = TRUE))

# Libraries
library(palmerpenguins)
library(ggplot2)
library(magrittr)
library(ggpubr)


# Seed
set.seed(2021)


## Read dataset Palmer Penguins
data = penguins
data <- na.omit(data)

#### Plot Evolution ####

## The default boxplot Boxplot

ggboxplot(data, x = "species", y = "bill_length_mm", lwd=1.5, shape = "species") +
  theme_bw() + theme(legend.position="none")
    

## Boxplot: colors, axis, labels, size, themes

palette = c("#ff7a00", "#c45bcb", "#067276")

ggboxplot(data, x = "species", y = "bill_length_mm", color = "species", 
          palette = palette, lwd=1.5, shape = "species") +
  ggtitle("Bill Length of Palmer Penguins Species") + xlab("") + ylab("Bill Length (mm)") +
  theme_bw() + theme(text = element_text(size=20), legend.position="none") 


## Boxplot with flipped cordinates

ggboxplot(data, x = "species", y = "bill_length_mm", color = "species", 
          palette = palette, lwd=1.5, shape = "species") + 
  ggtitle("Bill Length of Palmer Penguins Species") + xlab("") + ylab("Bill Length (mm)") +
  coord_flip() + theme_bw() + theme(text = element_text(size=20), legend.position="none") 


## Boxplot with continuos y axis

ggboxplot(data, x = "species", y = "bill_length_mm", color = "species", 
          palette = palette, lwd=1.5, shape = "species") +
  ggtitle("Bill Length of Palmer Penguins Species") + xlab("") + ylab("Bill Length (mm)") +
  coord_flip() + scale_y_continuous(limits = c(0, 70)) +
  theme_bw() + theme(text = element_text(size=20), legend.position="none") 


## Violin plot

ggviolin(data, x = "species", y = "bill_length_mm", color = "species", 
         fill= "species", palette = palette, lwd=1.5, shape = "species") +
  ggtitle("Bill Length of Palmer Penguins Species") + xlab("") + ylab("Bill Length (mm)") +
  coord_flip() + scale_y_continuous(limits = c(0, 70)) +
  theme_bw() + theme(text = element_text(size=20), legend.position="none") 


## Violin plot + boxplot

ggviolin(data, x = "species", y = "bill_length_mm", color = "species",add = "boxplot", 
         add.params = list(color = "black", fill = "white"), fill= "species", palette = palette, 
         lwd=1.5, shape = "species") +
  ggtitle("Bill Length of Palmer Penguins Species") + xlab("") + ylab("Bill Length (mm)") +
  coord_flip() + scale_y_continuous(limits = c(0, 70)) +
  theme_bw() + theme(text = element_text(size=20), legend.position="none") 


## Geom_point plot

ggplot(data, aes(x = species, y = bill_length_mm, color= species)) +
  geom_point(size = 3, alpha = 0.15) + 
  scale_color_manual(values=c("#ff7a00", "#c45bcb", "#067276")) +
  ggtitle("Bill Length of Palmer Penguins Species") + xlab("") + ylab("Bill Length (mm)") +
  coord_flip() + scale_y_continuous(limits = c(0, 70)) +
  theme_bw() + theme(text = element_text(size=20), legend.position="none") 


## Jitter plot

ggplot(data, aes(species, bill_length_mm, color = species)) +
  geom_jitter(position = position_jitter(seed = 2021, width = 0.2), size = 2, alpha = 0.25) + 
  scale_color_manual(values=c("#ff7a00", "#c45bcb", "#067276")) +
  ggtitle("Bill Length of Palmer Penguins Species") + xlab("") + ylab("Bill Length (mm)") +
  coord_flip() + scale_y_continuous(limits = c(0, 70)) +
  theme_bw() + theme(text = element_text(size=20), legend.position="none") 


## Jitter plot + boxplot

ggboxplot(data, x = "species", y = "bill_length_mm",
          color = "species", palette = palette, lwd=1.5, shape = "species") +
  geom_jitter(position = position_jitter(seed = 2021, width = 0.2), size = 2, alpha = 0.25) + 
  ggtitle("Bill Length of Palmer Penguins Species") + xlab("") + ylab("Bill Length (mm)") +
  coord_flip() + scale_y_continuous(limits = c(0, 70)) +
  theme_bw() + theme(text = element_text(size=20), legend.position="none") 