#' smartsSearch
#' @description SMARTS substructure searching for SMILES.
#' @param smiles a valid SMILES
#' @param smarts a valid SMARTS symbol
#' @examples
#' smartsSearch(aminoAcids$SMILES[1],"[OX2H]")
#' @export

smartsSearch <- function(smiles,smarts){
  forEachMol("SMILES",smiles,identity) %>%
  smartsSearch_OB(smarts)
}