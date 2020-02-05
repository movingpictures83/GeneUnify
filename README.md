# GeneUnify
# Language: R
# Input: TXT (parameters)
# Output: CSV (expression levels for each sample/timepoint)
# Tested with: PluMA 1.0, R 3.2.5

PluMA plugin that takes a clinical and training data set, a set of timepoints,
and average gene expression levels of a selected set of genes.  It produces
a single unified set of sample/timepoints, along with the expression of levels
of each selected gene.  This output file will be in CSV format.

The input file will be a set of keywords and values.
Keywords and their respective values include:

Keyword		Value
------------------------
clinical	Clinical data (TSV)
training	Training data (TSV)
files		Set of files (CSV) with average gene expression levels 

At the moment, the plugin assumes seven timepoints.  This should change in a future release.

Note the input TSV and CSV files in the example/ directory are not publically available.
A future goal is to make a synthetic data set.  In the meantime however, one may
use it on their own tab-separated input data.
