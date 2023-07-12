[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Lifecycle: stable](https://lifecycle.r-lib.org/articles/figures/lifecycle-stable.svg)

<img align="right" width="35%" height="auto" src="vignettes/logo_Cerebro.png">

This is a fork of the excellent [cerebroApp](https://github.com/romanhaa/cerebroApp) R package from [Roman Hillje](https://github.com/romanhaa), which was sadly discontinued.
This is supposed to be a lightweight version that only keeps the key functions and focuses on speed.

The fork can be installed with:

```r
devtools::install_github('mihem/cerebroApp')
```

# cerebroApp

R package upon which the [Cerebro](https://github.com/romanhaa/Cerebro) is built.
Contains helper function that prepare single-cell RNA-seq data stored in a Seurat object for visualization in Cerebro.
Seurat v3 and v4 and `SCE`/`SingleCellExperiment` objects are supported.


For further details, please refer to the official [cerebroApp](https://romanhaa.github.io/cerebroApp/) website.
