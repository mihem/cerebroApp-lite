# How to generate the Seurat PBMC example data set used in the examples parts of cerebroApp function

```r
library(Seurat)
library(cerebroApp)

pbmc_counts <- read.table(
  file = system.file('extdata', 'pbmc_raw.txt', package = 'Seurat'),
  as.is = TRUE
)

pbmc <- CreateSeuratObject(counts = pbmc_counts)

sample_info <- rep(NA, nrow(pbmc@meta.data))
sample_info[1:ceiling(length(sample_info)/2)] <- 'pbmc_1'
sample_info[ceiling(length(sample_info)/2):length(sample_info)] <- 'pbmc_2'
sample_info <- factor(sample_info, levels = c('pbmc_1','pbmc_2'))
pbmc@meta.data$sample <- sample_info

pbmc <- NormalizeData(object = pbmc)
pbmc <- FindVariableFeatures(object = pbmc)
pbmc <- ScaleData(object = pbmc)
pbmc <- RunPCA(object = pbmc)
pbmc <- FindNeighbors(object = pbmc)
pbmc <- FindClusters(object = pbmc)

pbmc <- RunUMAP(
  pbmc,
  reduction.name = 'UMAP',
  reduction.key = 'UMAP_',
  dims = 1:30,
  n.components = 2,
  seed.use = 100,
  verbose = FALSE
)

pbmc <- getMarkerGenes(
  pbmc,
  organism = 'hg',
  column_sample = 'sample',
  column_cluster = 'seurat_clusters'
)

saveRDS(pbmc, 'inst/extdata/v1.3/pbmc_seurat.rds')
```