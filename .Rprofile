# Set the R mirror to UMich
local({r <- getOption("repos")
       r["CRAN"] <- "http://repo.miserver.it.umich.edu/cran"
       options(repos=r)})

nCk <- function(n,k) {
    return(factorial(n)/(factorial(k)*factorial(n-k)))
}
