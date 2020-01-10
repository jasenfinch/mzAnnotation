#' convert
#' @description convert between SMILES and Inchi and to InchiKey
#' @param input a valid SMILE or Inchi
#' @param inputType either "smiles" or "inchi", denoting the input type
#' @param outputType either "smiles", "inchi" or "inchikey", denoting the output type
#' @examples
#' convert(aminoAcids$SMILES[1],'smiles','inchi')
#' @importFrom callr r
#' @importFrom utils getFromNamespace
#' @importFrom webchem cs_convert
#' @export

convert <- function(input, inputType, outputType) {
  
  suppressMessages({
    output <- cs_convert(input,from = inputType,to = outputType)[[1]]
  })
  
  return(output)
}
