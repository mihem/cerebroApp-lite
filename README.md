[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Lifecycle: stable](https://lifecycle.r-lib.org/articles/figures/lifecycle-stable.svg)

<img align="right" width="35%" height="auto" src="vignettes/logo_Cerebro.png">

:warning: This is a fork of the excellent [cerebroApp](https://github.com/romanhaa/cerebroApp) R package from [Roman Hillje](https://github.com/romanhaa), which was sadly discontinued.
The fork can be installed with:

```r
devtools::install_github('mihem/cerebroApp')
```

# cerebroApp

R package upon which the [Cerebro](https://github.com/romanhaa/Cerebro) is built.
Contains helper function that prepare single-cell RNA-seq data stored in a Seurat object for visualization in Cerebro.
Seurat v3 and `SCE`/`SingleCellExperiment` objects are supported.


For further details, please refer to the official [cerebroApp](https://romanhaa.github.io/cerebroApp/) website.

## Credit

* Pathway enrichment in marker gene lists (`getEnrichedPathways()`) is done through the enrichR API (<https://github.com/wjawaid/enrichR>). I took the `enrichr` function and modified it to run in parallel (`future_lapply`) and not print status messages.
* Gene set enrichment analysis (`performGeneSetEnrichmentAnalysis()`) is performed using the [GSVA](https://bioconductor.org/packages/release/bioc/html/GSVA.html) R package. p- and q-value statistics are calculated through the same method as used by "Evaluation of methods to assign cell type labels to cell clusters from single-cell RNA-sequencing data", Diaz-Mejia *et al*., F1000Research (2019). [Link to publication](https://f1000research.com/articles/8-296/v2)
