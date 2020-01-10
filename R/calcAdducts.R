#' calcAdducts
#' @description calculate ionisation products for given database accession
#' @param id accession id.
#' @param db object of class \code{MetaboliteDatabase}.
#' @param adductTable table of adduct rules. Defaults to adducts().
#' @examples 
#' db <- metaboliteDB(aminoAcids,descriptors(aminoAcids$SMILES))
#' add <- calcAdducts(1,db)
#' @importFrom purrr map_df
#' @export

calcAdducts <- function(id,db,adductTable = adducts()){
  
  smile <- db %>%
    getAccessions() %>%
    filter(ACCESSION_ID == id) %>%
    .$SMILES
  
  desc <- db@descriptors[[1]] %>%
    filter(SMILES == smile) %>%
    map_df(rep,times = nrow(adductTable))
  
  add <- adductTable %>%
    select(Name,Rule) %>%
    bind_cols(desc) %>%
    rowwise() %>%
    mutate(Possible = eval(parse(text = Rule)),`m/z` = calcMZ(Accurate_Mass,Name,adductTable = adductTable),MF = adductTransformMF(formula,Name,Adducts = adductTable)) %>%
    select(Name,Possible,`m/z`,MF)
  return(add)
}