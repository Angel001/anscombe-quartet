library(ggplot2)

data <- anscombe
x <- c(data[,1:4], recursive = T, use.names = F)
y <- c(data[,5:8], recursive = T, use.names = F)
cat <- rep(LETTERS[1:4], each = 11)
df <- data.frame(x = x, y = y, cat = cat)

ggplot(df, aes(x = x, y = y)) +
        geom_point(pch = 19, size = 4, alpha = 0.6) +
        xlim(3, 20) + ylim(3, 20) +
        stat_smooth(method = lm, se = F, lwd = 1) +
        theme_bw()

ggplot(df, aes(x = x, y = y)) +
        geom_point(pch = 19, size = 4, alpha = 0.6, aes(colour = cat)) +
        xlim(3, 20) + ylim(3, 20) +
        stat_smooth(method = lm, se = F, lwd = 1, colour = "black") +
        scale_colour_manual(values = c("salmon4", "cornflowerblue", "darkolivegreen4", "orange")) +
        guides(colour = guide_legend(title=NULL)) +
        theme_bw() +
        theme(legend.position = c(0,1),
              legend.justification = c(0,1.1)
        )

ggplot(df, aes(x = x, y = y, colour = cat)) +
        geom_point(pch = 19, size =4, alpha = 0.6) +
        xlim(3, 20) + ylim(3, 20) +
        stat_smooth(method = lm, se = F, lwd = 1, colour = "grey30") +
        scale_colour_manual(name = NULL, values = c("salmon4", "cornflowerblue", "darkolivegreen4", "orange")) +
        facet_wrap( ~ cat) +
        guides(colour = F) +
        theme_bw() +
        theme(strip.text = element_text(face = "bold"),
              strip.background = element_rect(fill = "antiquewhite"))
