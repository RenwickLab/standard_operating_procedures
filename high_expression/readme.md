# High expression SOP

Markdown version of [High expression SOP version 2](./high_expression_sop_v2.docx)

**Standard as of:** December 21, 2018

**Note:** This is to be done **after** preprocessing. Preprocessing involves filtering for the 95th percentile of expression. As high expression includes all miRNAs, start with the raw data, but keep note of which samples were removed during preprocessing.

## miRNA
1.	Start with raw merged miRNA summary data
1.	Remove samples that were marked as outliers in preprocessing
1.	Relative frequency (RF) normalize
1.	Find the median RF expression of each miRNA across all remaining samples
1.	Remove star sequences (has ‘STAR’ suffix)
1.	Get highest N expressed miRNAs where:
	* N = [remaining miRNAs] * [percentile] 
	* (round down)

## Cistrons
1.	Start with raw cistron data (clustsummary)
1.	Remove samples that were marked as outliers in preprocessing
1.	Relative frequency (RF) normalize
1.	Find the median RF expression of each cistron across all remaining samples
1.	Get highest N expressed cistrons where:
	* N = [remaining miRNAs] * [percentile] 
	* (round down)
