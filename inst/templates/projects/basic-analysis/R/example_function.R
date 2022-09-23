#' Print message to console
#'
#' @param message chr. String to print to screen. Default is "Hello world"
#'
#' @return Print message to console
#' @export
#'

example_function <- function(message = NULL){
  if(is.null(message)){
    
    print("Hello world")
    
  } else{
    
    print(c(message))
    
  }
  
}
