# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

Format_Input <- function(id,wave,income,CPI,weight=1,bottom.threshold=1,top.threshold){

  n <- length(id)

  if (length(weight)==1) weight <- rep(1,n)
  if (length(bottom.threshold)==1) bottom.threshold <- rep(bottom.threshold,n)
  if (length(top.threshold)==1) top.threshold <- rep(top.threshold,n)

  if (n != length(wave) | n!=length(top.threshold) | n!=length(bottom.threshold)| n!=length(weight) | n!=length(income)) stop("The lengths of the input vectors do not match")

  df <- data.frame(id=id,wave=wave,weight=weight,bottom.threshold=bottom.threshold,top.threshold=top.threshold,income=income)

  df$Type <- 1*(df$income>=df$bottom.threshold)+1*(df$income>=df$top.threshold)

  df <- df[with(df, order(id, wave)), ]

  df$seq_id <- 1:length(df$Type)

  df

}


