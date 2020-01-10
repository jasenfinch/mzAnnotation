#' @importFrom dplyr everything

elementFrequencies <- function(db){
  MFs <- db %>%
    getDescriptors() %>%
    .$MF %>%
    unique() %>%
    map(~{
      mf <- .
      mf %>%
        count.elements() %>%
        as.list() %>%
        as_tibble()
    })
  names(MFs) <- db %>%
    getDescriptors() %>%
    .$MF %>% unique()
  MFs <- MFs %>% 
    bind_rows(.id = 'MF') %>%
    right_join(db@descriptors[[1]] %>% select(SMILES,MF), by = "MF") %>%
    select(SMILES,everything())
  return(MFs)
}