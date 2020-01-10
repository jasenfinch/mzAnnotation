#' convert
#' @description convert between SMILES and InChI and to InChIKey
#' @param input vecotr of valid SMILES or InChIs
#' @param inputType either "smiles" or "inchi", denoting the input type
#' @param outputType either "smiles", "inchi" or "inchikey", denoting the output type
#' @examples
#' convert(aminoAcids$SMILES[1],'smiles','inchi')
#' @importFrom utils getFromNamespace
#' @importFrom webchem cs_convert
#' @export

convert <- function(input, inputType, outputType) {
  
  output <- map_chr(input,~{
    suppressMessages({
      cs_convert(.x,from = inputType,to = outputType)[[1]]
    })
  })
  
  return(output)
}
