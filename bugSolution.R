```r
#Improved code with better handling of logical conditions and NA values

df <- data.frame(a = c(1, 2, 3), b = c(4, 5, 6))

#Explicitly check for the existence of data before subsetting
if(nrow(df[df$a > 10, ]) > 0) {
  subset <- df[df$a > 10, ]
  print(subset)
} else {
  print("Warning: No data satisfying the condition")
}


df2 <- data.frame(a = c(1, 2, NA), b = c(4, 5, 6))

#Use `is.na()` to handle NA values explicitly in the logical condition
subset2 <- df2[df2$a > 1 & !is.na(df2$a), ]

if (nrow(subset2) > 0){
  print(subset2)
} else{
  print("Warning: No data satisfying the condition")
}

#Alternative approach using dplyr for better readability and NA handling
library(dplyr)

subset3 <- df2 %>% filter(a > 1, !is.na(a))

print(subset3)
```