install.packages("enrichR")
library("enrichR")
listEnrichrSites()
setEnrichrSite("Enrichr") # Human genes
websiteLive <- TRUE
dbs <- listEnrichrDbs()
if (is.null(dbs)) websiteLive <- FALSE
if (websiteLive) head(dbs)

all_dbs_list <- dbs[,3]
dbs_list <- all_dbs_list
dbs_list <- c("GO_Molecular_Function_2015", "GO_Cellular_Component_2015", "GO_Biological_Process_2015")
gene_list <- c("MUC6", "USH2A", "MATR3", "PCDH7", "LRP1B", "GABRR2", "OR2AG2", "IRGC", "SYNE1", "ETV3", "MYO9B", "IGSF9", "UQCRHL", "COL6A6", "RPL8", "PARD3B", "SOAT2", "SIPA1L3", "SPTBN5", "PLCB2", "ARAP1", "SLC9B1", "ZNF148", "CPEB1", "FAM222B", "BRPF1", "TNC", "ATXN7L1", "BAZ2A", "ZNF827", "SETD5", "KCNN2", "UBN2", "ADAMTSL1", "HTR7", "OTUD7B", "GLI3", "SLC34A1", "CABIN1", "BRD1", "TEX10", "YLPM1", "RNF10", "XKR6", "HNRNPR", "RAP2A", "MBNL2", "ID2", "IGF1R", "SZT2", "TMEM132E", "HIPK2", "WTAP", "ASB10", "SMARCC2", "DLG1", "FAM214B", "MEF2C", "DSCAM", "JADE1", "BRD8", "CITED2", "ROBO4", "BEST3", "THRA", "NR1D1", "ZC3H14", "TNRC6A", "KAT6B", "PRKCA", "RIMS2", "USP34", "REM1", "NFAT5", "SPEN", "LTBP1", "PANK2", "PUM1", "MUC16", "VPS13B", "SPTB", "CASZ1", "MEX3C", "LCORL", "HNRNPH2", "YTHDF2", "CDH5", "LRRTM2", "ZBTB20", "PLXNB3", "ZFHX3", "NCOA2", "LRRC7", "HECTD1", "BNC2", "PAPPA", "ZNF608", "KDM6A", "ADGRV1", "SRCAP", "HOXA2", "ARHGAP15", "RGAG1", "KPNA3", "USP9X", "CLK1", "SKIDA1", "ZBTB26", "IKZF2", "SP3", "WNK2", "LCOR", "MSL2", "CARNMT1", "NTNG1", "HOXC4", "JAG2", "FAM84A", "LIN54", "ASB17", "SMAD7", "ZNF541", "FHL1", "XKRX", "HOXC8", "NRXN3", "VSTM2A", "ANAPC1", "SRRM2", "RFX1", "SLITRK4", "PCDH19", "ANKRD17", "WNK3", "LILRB1", "ANKRD36", "IGFN1", "IGSF11", "NCOA6", "DLGAP3", "F13A1", "ODF2", "NTRK3", "TTBK2", "KMT2A", "ATP2A3", "CSMD1", "TIAM1", "TTN", "MMP16", "CAMK2G", "EHD4", "CSNK1A1L", "TUBGCP6", "RC3H2", "WDR33", "TSPAN12", "TSC22D2", "FAP", "POLG", "MSL1", "DYNC1H1", "ARID4B", "MPI", "LRRC8A", "CEMIP", "REV3L", "TRPV3", "KIAA0907", "CYFIP1", "ANKRD24", "GAB2", "APOBEC3G", "SNRNP200", "INPP5F", "PCDHA6", "FCRL1", "MYLK", "TNRC6C", "HIPK3", "TRPC7", "PEG3")

if (websiteLive) {
  enriched <- enrichr(gene_list, dbs_list)
}

library(dplyr)
bind_all_result = enriched %>% 
  bind_rows() %>% 
  filter(Adjusted.P.value < 0.05) %>% 
  arrange(desc(Combined.Score))

write.csv(bind_all_result, file = "LFS_OS_any2or3_enrichr_bind_all_result.csv")
