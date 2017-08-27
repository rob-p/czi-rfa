

## Title: Efficient tools for quantifying and simulating transcript-level abundance in single-cell RNA-seq

## Primary focus area

Computational Biology

## Project summary 

A major component of the Human Cell Atlas (HCA) will be a repository of single-cell RNA-sequencing (scRNA-seq) data, which will allow us to transcriptionally profile a tremendous number (likely on the order of 10<sup>6</sup> — 10<sup>7</sup>) of cells. These data can offer an unprecedented  view into processes such as development and disease formation at the cellular level. The utility of these data, however, will fundamentally depend on the accuracy and capabilities of the computational tools used to process them.  Inaccurate, biased, or limited computational methods can slow or altogether prevent the uncovering of Biological knowledge encoded in the raw sequencing data.

The focus of this proposal is on building tools that will help to tackle the first phase of processing the scRNA-seq data generated as part of the HCA initiative. Specifically, we propose to build methods to accurately assess transcript-level abundance estimates and, crucially, the fundamental uncertainty with which many of these estimates must be reported.  In order to help assess the methods we build, we propose to develop a read-level scRNA-seq simulator that will mimic many of the characteristics of different scRNA-seq experimental protocols. The abundance and uncertainty estimates we produce will be immediately useful to downstream tools (some of which are being developed in response to this same RFA; see Collaborative Network) that rely on accurate and robust transcript-level abundance profiles to perform higher-level analyses. 

## Keywords

## Full citations (with PubMed links), GitHub repository links, data repositories, and/or similar for up to five of your most significant contributions relevant to the proposal

* Patro, Rob, et al. "Salmon provides fast and bias-aware quantification of transcript expression." Nature Methods 14.4 (2017): 417-419. PMID: [28263959](https://www.ncbi.nlm.nih.gov/pubmed/28263959)
* [Salmon transcript-level quantification software](https://github.com/COMBINE-lab/salmon)
* Zakeri, Mohsen, et al. "Improved data-driven likelihood factorizations for transcript abundance estimation." Bioinformatics 33.14 (2017): i142-i151. DOI: [https://doi.org/10.1093/bioinformatics/btx262](https://doi.org/10.1093/bioinformatics/btx262)
* Patro, Rob, Stephen M. Mount, and Carl Kingsford. "Sailfish enables alignment-free isoform quantification from RNA-seq reads using lightweight algorithms." Nature biotechnology 32.5 (2014): 462-464. PMID: [24752080](https://www.ncbi.nlm.nih.gov/pubmed/24752080)
* number 5?

## Collaborative network

* Casey
* Elana

## List of key personnel including name, organization, role on project

* Rob Patro, Stony Brook University, (PI; oversight, method development & implementation, dissemination)
* Avi Srivastava, Stony Brook University, (Graduate Student; method development & implementation relevant to Aim 1)
* Hirak Sarkar, Stony Brook University, (Graduate Student; method development & implementation relevant to Aim 2)

# Proposal

## Summary

Single-cell RNA-sequencing (scRNA-seq) data holds immense promise for capturing transcriptional profiles at the level of individual cells and helping to transform our understanding of tissue development, organogenesis, disease progression, and other key processes related to human health. However, the manifold protocols that have been proposed to generate scRNA-seq data are often complicated, imperfect, noisy and subject to sample-specific biases. Hence, the procedure of extracting transcriptional profiles (i.e., transcript-level abundance estimates) from the sequencing data itself is a computational challenge.  While the inference problem itself is challenging, the amount of data being produced is simultaneously immense, precluding the application of what might typically be considered the most accurate and robsut inference methods (e.g., MCMC sampling) for these problems.

The focus of this proposal is to develop computationally-efficient and robust methods for inferring transcript-level abundances from scRNA-seq data, with a particular concentration on accurately assessing the inherent uncertainty in these abundance estimates.  We will develop, implement and benchmark an array of different inference procedures to determine the most computationally-efficient methodology that nonetheless allows accurate esimtation and assessment of posterior uncertainty.  In addition to evaluating our methodology on benchmarking datasets being generated for the HCA, we will also develop a fragment-level scRNA-seq simulator that will allow us to rapidly test and evaluate our methods on data where the ground truth is known.  Since accurate transcriptional profiles, along with reliable estimates of the inherent uncertainty of these profiles, act as the input features to most higher-level analyses, the proposed work is foundational for making the most effective use possible of the scRNA-seq data generated for the HCA initiative. 

## Project Aims

#### Aim 1 : Design, develop and test computationally-efficient approaches for robustly estimating posterior uncertainty in scRNA-seq-based transcriptional profiles.

#### Aim 2 : Design, develop and test a fragment-level scRNA-seq data simulator, capable of generating synthetic data mimicking the most popular scRNA-seq protocols.

### Prior contributions and preliminary Results

Our group has a history of developing highly-efficient methods for transcript-level abundance estimation from bulk RNA-seq data.  This work has resulted in the development of the popular tools Sailfish [(Patro et al. 2014)](#sailfish) and Salmon [(Patro et al. 2017)](#salmon), for solving this problem.  Further, we have been systematically evaluating the space of efficiency and accuracy tradeoffs for the transcript quantification problem.  This has led to the development of a novel data-driven factorization scheme [(Zakeri et al.)](#zakeri) for improving the accuracy of fast maximum likelihood methods for transcript quantification, and a new, fast, read mapping algorithm [(Sarkar et al.)](#sarkar), that bridges the accuracy gap between fast "alignment-free" algorithms and traditional alignment-based approaches.  These developments allow for state-of-the-art transcript abundnace estimation accuracy on a very moderate computational budget.  In the proposed work, this experience will be critical for bringing some of the same insights to bare on the challenges posed by single-cell RNA-seq data.

### Background

The majority of research into problems related to transcript quantification has focused on obtaining accurate and efficient _point estimates_ of transcript abundance.  That is, each transcript, in each sample, is associated with some scalar value (typically in a unit such as transcripts per million (TPM) [(Li and Dewey)](#li-rsem) or the estimated read count) that measures the transcripts' relative abundance.  While work has been done on estimating the posterior distribution in full [(Glaus et al.)](#bitseq), [(Turro et al.)](#mmseq), [(Jones et al.)](#isolator) or the posterior variance of the estimator [(Al Seesi et al.)](#isode), [(Bray et al.)](#kallisto), [(Patro et al.)](#salmon), this problem --- though more difficult --- has received less attention.  However, an understanding of the uncertainty inherent in transcript-level abundance estimates is _crucial_, especially with respect to single-cell RNA-seq data, where the uncertainty in the assignment of a sequenced fragment to a particular transcript can be very high.  Moreover, existing methodologies for estimating uncertainty have been developed primarily in the context of bulk RNA-seq, where each read-to-sample assignment is perfectly know.  Yet, numerous popular scRNA-seq technologies use barcoding techniques [(Ziegenhain et al.)](#sc-review) (e.g. Drop-Seq, inDrop, MARS-Seq etc.) where sequence barcodes are used to determine the cell from which each sequenced fragment has derived.  However, these barcodes are subject to corruption and sequencing errors, which can affect downstream estimates of abundance.  Little work has been done to assess the effect of uncertainty in cell barcode assignment on the resulting abundance estimates.


### Proposed work


> We will explore numerous methodologies for estimation of the posterior distribution of transcript abundances, which sheds light on the complex dependence structure between the abundances of related transcripts.  We will explore (1) Gibbs sampling, (2) bootstrapping (non-parametric, parametric, and Bayesian), and (3) alternative sampling strategies (Hamiltonian Monte Carlo, slice sampling, etc.).  We will also explore how these methods interact with different efficient factorizations of the likelihood function [cite MMSeq, kallisto, Salmon, DDFact, IsoDE2].


*  1.) We will design, implement and evaluate numerous computational strategies for assessing uncertainty in both transcript and gene-level expression inference from single-cell RNA-seq data.  Specifically, we will expand the inference being performed to account for additional uncertainty present in scRNA-seq data (sub-aim A below), we will explore the effect of different likelihood factorizations on the accuracy of estimates of posterior variance (sub-aim B below) and we will evaluate numerous different computational approaches for estimating  posterior variance (sub-aim C below). 

 - A.)  In addition to the difficult challenges posed by estimating inference uncertainty in standard bulk RNA-seq data, scRNA-seq poses additional challenges.  For example, posterior variance is expected to be *much* greater in scRNA-seq data, specifically in 3' tagged-end protocols.  This is the result of the strong 3' bias in sequencing reducing the probability of observing sequence that uniquely identifies a given transcript.  Thus, the transcript-level solutions computed from such data are expected, generally, not to be identifiable.  This makes the estimation (and downstream usage) of uncertainty information even more crucial than with other types of RNA-seq data (e.g., bulk RNA-seq or full-length scRNA-seq protocols).  Additionally, in scRNA-seq data, there is uncertainty not only in read assignment within a cell, but also in the cell from which a read has derived (due to corruption of cellular barcodes).  As a result, uncertainty is increased even further, and the methods used to estimate posterior variance (or the posterior distribution) should take this uncertainty into account.  Yet  We have been developing a novel method that is capable of providing assignment probabilities of reads to cells, leading to an enhanced notion of equivalence classes.  Given these modeling improvements, we can incorporate uncertainty in fragment -> cell assignment into our estimates of posterior variance.

 - B.) Recent work has demonstrated that simplified likelihood models (such as those used in popular fast RNA-seq quantification tools) can lead to systematic underestimation of posterior uncertainty  [(Mandric et al.)](#mandric) when coupled with the non-parametric bootstrap.  On the other hand, traditional fragment-level modeling can result in a considerable increase in the computational burden.  Our lab has been focusing on determining precisely what information is crucial for obtaining accurate transcript-level abundance estimates efficiently.  This has led to the development of new data-driven likelihood factorizations [(Zakeri et al.)](#zakeri) that admit efficient inference without the sacrifices in accuracy that are associated with the more typical likelihood factorizations [cite MMSeq], as well as the development of a selective alignment [(Sarkar et al.)](#sarkar) procedure that efficiently produces the information required to obtain highly-accurate abundance estimates.  Together, this work allows us to close the small but persistent accuracy gap between "fast mapping-based" and traditional alignment-based quantification methods, while retaining high computational efficiency.  While we have previously focused on the accuracy of point estimates of transcript abundance, in the proposed work we will turn our focus to the accuracy of estimating higher moments of the posterior distribution (specifically, the variance in the estimates due to the inherent uncertainty in inference).  We will explore the interaction between the methodology used to map reads to transcripts (i.e., traditional alignment, quasi-mapping, and selective alignment) and the likelihood factorization adopted, and will determine the most efficient combination of mapping and likelihood factorization that admits accurate estimates of posterior variance.   In short, we propose to find the "sweet spot" --- that is, how can we obtain appropriate estimates of variance *without* resorting to alignment-level modeling.  This will lead to computationally efficient, yet accurate methods for estimating posterior variance (posterior distributions).

  - C.) Though numerous approaches have been proposed for estimating either the posterior variance [RSEM, IsoDE, IsoDE2, BitSeq VB, kallisto, salmon] or the full posterior distribution [MMSeq, BitSeq, salmon, isolator] of transcript-level expression estimates, little comparison has been done concerning the effectiveness of different methodologies.  Specifically, the following (non-exhaustive) list of methods have been proposed in the literature : Bayesian MCMC [BitSeq], Slice sampling [Isolator], Posterior Gibbs sampling (starting from maximum likelihood estimates) [RSEM, MMSeq, Salmon], non-parametric bootstrapping over either input data or sufficient statistics [IsoDE, IsoDE2, kallisto, Salmon].  We propose to perform, within the framework of Salmon, a systematic comparison of different methodologies for estimating the posterior uncertainty of transcript abundances.  Specifically, we will evaluate the following methods:
	 * Posterior Gibbs sampling (i.e., Gibbs sampling with one or more chains starting from the maximum likelihood abundance estimates).
	 * Non-parametric bootstrapping  
	 * Bayesian bootstrapping (with non-zero prior abundances on each transcript)
	 * Hamiltonian Monte Carlo sampling (again, starting from near the maximum likelihood estimates)

     It has previously been demonstrated that these approaches, though related, when brought to bare on other problems, exhibit distinct results in terms of their overall accuracy [(Alafro et al.)](#alfaro).  Hence, we will evaluate each of these methodologies with respect to their overall accuracy (how often the posterior credible intervals contain the true abundances) as well as their computational cost in the transcript abundance uncertainty estimation problem.  Here, we seek a method that accurately estimates the posterior uncertainty, but which exhibits the computational efficiency to eventually scale to all scRNA-seq data that will be generated for the HCA.

## Prior contributions in this area and preliminary results (optional)

## Proposed work and deliverables



## Proposal for evaluation and dissemination of methods, resources, or results

## Statement of commitment to share

We hereby commit to share our proposal, methods, code, and research papers openly under permissive licenses.  Methods and tools created for this proposal will be developed openly via GitHub, and research will be disseminated via pre-prints on [bioRxiv](http://www.biorxiv.org/collection/bioinformatics) prior to submission to any conference or journal.

** END OF 1,600 word proposal limit **

## References cited
---------
<a name="zappia">Zappia</a>, Luke, Belinda Phipson, and Alicia Oshlack. "Splatter: Simulation Of Single-Cell RNA Sequencing Data." bioRxiv (2017): 133173.

<a name="mandric">Mandric</a>, Igor, et al. "Fast bootstrapping-based estimation of confidence intervals of expression levels and differential expression from RNA-SEQ data." Bioinformatics (2017).

<a name="zakeri">Zakeri</a>, Mohsen, et al. "Improved data-driven likelihood factorizations for transcript abundance estimation." Bioinformatics 33.14 (2017): i142-i151.

<a name="sarkar">Sarkar</a>, H., Zakeri, M., Malik, L., & Patro, R. (2017). Towards selective-alignment: Bridging the accuracy gap between alignment-based and alignment-free transcript quantification. BioRxiv. https://doi.org/10.1101/138800

<a name="alfaro">Alfaro</a>, Michael E., Stefan Zoller, and François Lutzoni. "Bayes or bootstrap? A simulation study comparing the performance of Bayesian Markov chain Monte Carlo sampling and bootstrapping in assessing phylogenetic confidence." Molecular Biology and Evolution 20.2 (2003): 255-266.

<a name="li-rsem">Li</a>, Bo, and Colin N. Dewey. "RSEM: accurate transcript quantification from RNA-Seq data with or without a reference genome." BMC bioinformatics 12.1 (2011): 323.

<a name="bitseq">Glaus</a>, Peter, Antti Honkela, and Magnus Rattray. "Identifying differentially expressed transcripts from RNA-seq data with biological variation." Bioinformatics 28.13 (2012): 1721-1728.

<a name="mmseq">Turro</a>, Ernest, et al. "Haplotype and isoform specific expression estimation using multi-mapping RNA-seq reads." Genome biology 12.2 (2011): R13.

<a name="isolator">Jones</a>, Daniel C., et al. "Isolator: accurate and stable analysis of isoform-level expression in RNA-Seq experiments." bioRxiv (2016): 088765.

<a name="isode">Al Seesi</a>, Sahar, et al. "Bootstrap-based differential gene expression analysis for RNA-Seq data with and without replicates." BMC genomics 15.8 (2014): S2.

<a name="kallisto">Bray</a>, Nicolas L., et al. "Near-optimal probabilistic RNA-seq quantification." Nature Biotechnology 34.5 (2016): 525-529.

<a name="sailfish">Patro</a>, Rob, Stephen M. Mount, and Carl Kingsford. "Sailfish enables alignment-free isoform quantification from RNA-seq reads using lightweight algorithms." Nature biotechnology 32.5 (2014): 462-464.

<a name="salmon">Patro</a>, Rob, et al. "Salmon provides fast and bias-aware quantification of transcript expression." Nature Methods 14.4 (2017): 417-419.

<a name="sc-review">Ziegenhain</a>, Christoph, et al. "Comparative analysis of single-cell RNA sequencing methods." Molecular cell 65.4 (2017): 631-643.

----

* 2.) A read-level simulator for scRNA-seq data --- while "resonable" simulators exist for bulk RNA-seq data, very little exists in terms of simulating scRNA-seq data.  Among the simulators that do exist, the focus is mostly on simulating transcript or gene-level _counts_ [(Zappia et al.)](#zappia), rather than the reads themselves.  Moreover, simulation of scRNA-seq data poses numerous challenges that may not arise in bulk RNA-seq simulation (e.g., realistic simulation of UMI-tags, cell barcodes, etc. in addition to reads derived from transcripts according to their abundances).  We will develop a read-level scRNA-seq simulator that is capable of simulating data that mimics the most popular scRNA-seq protocols (Drop-seq, inDrop, 10X).  The existence of such a simulator will be instrumental in the development of future methods for inferring transcript (or transcript-group)-level abundance from scRNA-seq data.

