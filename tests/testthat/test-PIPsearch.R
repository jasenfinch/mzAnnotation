
context('PIP search')

test_that('PIPsearch works',{
  res <- PIPsearch(metaboliteDB(aminoAcids,descriptors(aminoAcids$SMILES)),133.03358,5,'[M-H]1-','13C')
  
  expect_false(F %in% (class(res) == c("tbl_df","tbl","data.frame")))
  expect_true(nrow(res) == 1)
  expect_true(ncol(res) == 12)
  expect_false(F %in% (colnames(res) == c( "ID","NAME","InChI",
                                           "InChIKey","SMILES","MF",
                                           "Accurate_Mass","Isotope","Adduct",
                                           "Measured m/z","Theoretical m/z","PPM Error")))
  expect_false(F %in% (res$NAME == "L-Aspartic acid"))
  expect_false(F %in% (res$`PPM Error` == 0))
})