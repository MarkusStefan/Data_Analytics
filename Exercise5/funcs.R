support <- function(A, B=c()){
  T. <- length(A)
  if (length(B) == length(c())){ # check if  is empty
    #frq_x <- sum(x)
    mask <- A == 1
    freqA <- length(A[mask])
    suppA <- freqA/T.
    return(suppA)
  } 
  
  mask <-  A == 1 & B == 1
  freqAB <- length(A[mask])
  suppAB <- freqAB/T.
  return(suppAB)
  
  
}



confidence <- function(A, B){
  suppAB <- support(A, B)
  suppA <- support(A)
  confAB <- suppAB/suppA
  return(confAB)
}


lift <- function(A, B){
  confAB <- confidence(A, B)
  suppB <- support(B)
  liftAB <- confAB / suppB
  return(liftAB)
}



euclidean_no_weights <- function(A, B){
  ed <- as.numeric(sqrt(sum((A-B)**2)))
  return(ed)
}



euclidean <- function(A, B, weights=c()){
  
  if (length(weights) == length(c())){
    ed <- as.numeric(sqrt(sum((A-B)**2)))
    return(ed)
  }
  
  edw <-  as.numeric(sqrt(sum( ((A-B)*weights)**2 )))
  return(edw)
}


t_test_plot <- function(data, t_statistic, alpha=0.05){
  # computing the critical value
  n <- nrow(data)
  df <- n-ncol(data)
  # critical value 2 tailed -> alpha/2 -> two tailed test != 0
  cv2 <- qt(1-(alpha/2), df)
  # lower rejection region is the same value just negative!
  # qt(alpha/2, df)
  
  t_dist <- data.frame(x = c(-4, 4))
  lower_rj <- c(-4,(-1)*cv2)
  upper_rj <- c(cv2, 4)
  
  # plot the t-distribution
  g <- ggplot(data=t_dist, aes(x = x)) +
    geom_area(stat = "function", fun = dt, args = list(df = df),
              fill='white') +
    geom_area(stat = "function", fun = dt, args = list(df = df), 
              fill='orange', xlim=lower_rj) +
    geom_area(stat = "function", fun = dt, args = list(df = df), 
              fill='orange', xlim=upper_rj) +
    geom_line(stat = "function", fun = dt, args = list(df = df)) +
    
    geom_vline(xintercept = cv2, col=2, lwd=1.1) +
    geom_vline(xintercept = cv2*(-1), col=2, lwd=1.1) +
    geom_vline(xintercept = t_statistic , col=4) +
    geom_text(aes(x = t_statistic, y=0.3), label='test', col=4) 
  return(g)
  
}

#t_test_plot(data=air, t_statistic = t.test(air$Temp, mu = 79)$statistic, alpha = 0.05)

url <- "https://raw.githubusercontent.com/MarkusStefan/Economics/main/t_test_plot.R"
source(url)