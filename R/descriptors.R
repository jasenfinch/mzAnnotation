#' molecular descriptors
#' @description convert SMILES to a series of molecular descriptors
#' @param smiles vector containing valid SMILEs
#' @importFrom dplyr mutate mutate_if ungroup
#' @importFrom parallel makeCluster parLapply stopCluster
#' @importFrom purrr map_dbl map_int map_chr map
#' @importFrom magrittr set_names
#' @importFrom ChemmineOB forEachMol prop_OB smartsSearch_OB
#' @export
#' @examples
#' data(aminoAcids)
#' descriptors(aminoAcids$SMILES)

descriptors <- function(smiles){
  desc <- map(smiles,~{
    suppressWarnings({
      ref <- forEachMol("SMILES",.x,identity) 
      
      desc <- ref %>%
        prop_OB()
      
      smarts <- c('[-]',
                  '[+]',
                  "[NX3;H2]",
                  "[OX2H]",
                  "[CX3](=O)[OX2H1]",
                  "[CX3](=O)[OX1H0-]") %>%
        map(~{
          smartsSearch_OB(ref,.x)
        }) %>%
        set_names(c('Negative_Charge',
                    'Positive_Charge',
                    'NHH',
                    'OH',
                    'COOH',
                    'COO')) %>%
        as_tibble()
      
      desc <- desc %>%
        bind_cols(smarts) %>%
        as_tibble() %>%
        mutate_if(is.factor,as.character)
    })
    return(desc)
  }) %>%
    bind_rows() %>%
    rowwise() %>%
    mutate(Accurate_Mass = calcAccurateMass(formula)) %>%
    ungroup() %>%
    mutate(Total_Charge = Negative_Charge + Positive_Charge,
           SMILES = smiles) %>%
    select(-InChI,-title,MF = formula)
  return(desc)
}
