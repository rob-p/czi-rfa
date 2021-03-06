---
link-citations: true
citecolor: blue
---
<!--
## Title: Efficient tools for quantifying and simulating transcript-level abundance in single-cell RNA-seq

## Primary focus area

Computational Biology

## Project summary 

A major component of the Human Cell Atlas (HCA) will be a repository of single-cell RNA-sequencing (scRNA-seq) data, which will allow us to transcriptionally profile a tremendous number (likely on the order of 10^6^ — 10^7^) of cells. These data can offer an unprecedented  view into processes such as development and disease formation at the cellular level. The utility of these data, however, will fundamentally depend on the accuracy and capabilities of the computational tools used to process them.  Inaccurate, biased, or limited computational methods can slow or altogether prevent the uncovering of Biological knowledge encoded in the raw sequencing data.

The focus of this proposal is on building tools that will help to tackle the first phase of processing the scRNA-seq data generated as part of the HCA initiative. Specifically, we propose to build methods to accurately assess transcript-level abundance estimates and, crucially, the fundamental uncertainty with which many of these estimates must be reported.  In order to help assess the methods we build, we propose to develop a read-level scRNA-seq simulator that will mimic many of the characteristics of different scRNA-seq experimental protocols. The abundance and uncertainty estimates we produce will be immediately useful to downstream tools (some of which are being developed in response to this same RFA; see Collaborative Network) that rely on accurate and robust transcript-level abundance profiles to perform higher-level analyses. 

## Keywords

RNA-seq, scRNA-seq, transcript abundance, Bayesian inference, maximum likelihood, simulation, posterior uncertainty


## Full citations (with PubMed links), GitHub repository links, data repositories, and/or similar for up to five of your most significant contributions relevant to the proposal

* Patro, R., Duggal, G., Love, M. I., Irizarry, R. A., & Kingsford, C. (2017). Salmon provides fast and bias-aware quantification of transcript expression. Nature Methods, 14(4), 417–419. PMID: [28263959](https://www.ncbi.nlm.nih.gov/pubmed/28263959)
* [Salmon transcript-level quantification software](https://github.com/COMBINE-lab/salmon) (GitHub: https://github.com/COMBINE-lab/salmon)
* Zakeri, M., Srivastava, A., Almodaresi, F., & Patro, R. (2017). Improved data-driven likelihood factorizations for transcript abundance estimation. Bioinformatics, 33(14), i142–i151. DOI: [https://doi.org/10.1093/bioinformatics/btx262](https://doi.org/10.1093/bioinformatics/btx262)
* Patro, R., Mount, S. M., & Kingsford, C. (2014). Sailfish enables alignment-free isoform quantification from RNA-seq reads using lightweight algorithms. Nature Biotechnology, 32(5), 462–464. PMID: [24752080](https://www.ncbi.nlm.nih.gov/pubmed/24752080)
* Sarkar, H., Zakeri, M., Malik, L., & Patro, R. (2017). Towards selective-alignment: Bridging the accuracy gap between alignment-based and alignment-free transcript quantification. BioRxiv. DOI : [https://doi.org/10.1101/138800](https://doi.org/10.1101/138800)

## Collaborative network

Collaborative network text here!

## List of key personnel including name, organization, role on project

* Rob Patro, Stony Brook University, (PI; oversight, method development & implementation, dissemination)
* Avi Srivastava, Stony Brook University, (Graduate Student; method development & implementation relevant to Aim 1)
* Hirak Sarkar, Stony Brook University, (Graduate Student; method development & implementation relevant to Aim 2)
-->

## Summary

Single-cell RNA-sequencing (scRNA-seq) data holds immense promise for capturing transcriptional profiles at the level of individual cells and helping to transform our understanding of tissue development, organogenesis, disease progression, and other key processes related to human health. However, the manifold protocols that have been proposed to generate scRNA-seq data are often complicated, imperfect, noisy and subject to sample-specific biases [@screvmc;@scpower;@sc_batch]. Hence, the procedure of extracting transcriptional profiles from the sequencing data itself is a computational challenge. While the inference problem is challenging, the amount of data being produced is simultaneously immense, precluding the application of what might typically be considered the most accurate and robust inference methods (e.g., MCMC sampling) for these problems.

The focus of this proposal is to develop computationally-efficient and robust methods for inferring gene and transcript-group level abundances from scRNA-seq data, with a concentration on accurately assessing the uncertainty in these estimates. We will develop, implement and benchmark different inference procedures to determine the most computationally-efficient methodology that allows accurate estimation and assessment of posterior uncertainty. In addition to evaluating our methodology on benchmarking datasets being generated for the HCA, we will also develop a fragment-level scRNA-seq simulator that will allow us to rapidly test and evaluate these methods on data where the ground truth is known. Since accurate transcriptional profiles, along with estimates of the uncertainty of these profiles, are the input to many higher-level analyses, the proposed work is foundational for making the most effective use of the scRNA-seq data generated for the HCA initiative.

## Project Aims

#### Aim 1 : Design, develop and test computationally-efficient approaches for robustly estimating posterior uncertainty in scRNA-seq-based transcriptional profiles (at both the gene-level and at subgenic resolution).

#### Aim 2 : Design, develop and test a fragment-level scRNA-seq data simulator, capable of mimicking the most common / popular scRNA-seq protocols.

### Prior contributions 

Our group has a history of developing highly-efficient methods for
transcript-level abundance estimation from bulk RNA-seq data. This work
includes the popular tools Sailfish [@sailfish] and Salmon [@salmon].
Further, we have been systematically evaluating the space of efficiency and
accuracy trade-offs for transcript quantification. This has led to the
development of a novel data-driven factorization scheme [@ddfact] for
improving the accuracy of fast maximum likelihood methods, and a new, fast,
read mapping algorithm [@selectivealignment] that bridges the accuracy gap
between fast "alignment-free" algorithms and traditional alignment-based
approaches. These developments allow for accurate transcript
abundance estimation on a very moderate computational budget. In the
proposed work, we will bring the same insights to bear on challenges posed by
single-cell RNA-seq data.

<!--### Background

The majority of research into transcript quantification methods has focused on obtaining accurate and efficient _point estimates_ of transcript abundance. While work has been done on estimating posterior uncertainty [@bitseq;@mmseq;@isolator;@isode;@kallisto;@salmon], this problem --- though more difficult --- has received less attention.  However, an understanding of the uncertainty inherent in transcript-level abundance estimates can be _crucial_, especially with respect to single-cell RNA-seq data.  Moreover, existing methodologies for estimating uncertainty have been developed primarily in the context of bulk RNA-seq, where each read-to-sample assignment is perfectly know.  Yet, numerous popular scRNA-seq technologies use barcoding techniques [@screvmc;@scpower] (e.g. Drop-Seq, inDrop, MARS-Seq etc.) where sequence barcodes, which are subject to amplification and sequencing error, are used to determine the cell from which each sequenced fragment has derived.  Little work has been done to assess the degree to which various proposed methods accurately estimate posterior uncertainty or the effect of uncertainty in cell barcode assignment on the resulting abundance estimates. -->

### Proposed work and deliverables

**Aim 1** : We will design, implement and evaluate multiple computational strategies for assessing uncertainty in gene and transcript level expression inference from scRNA-seq data.  Specifically, we will expand the inference being performed to account for additional uncertainty present in scRNA-seq data (sub-aim A below), we will explore the effect of different likelihood factorizations and read-mapping procedures on the accuracy of estimates of posterior uncertainty (sub-aim B below), and we will evaluate different computational approaches for estimating this uncertainty (sub-aim C below). 

  A.  scRNA-seq poses more challenges than bulk RNA-seq for abundance and uncertainty estimation at both the gene and transcript level.  For example, strong 3' bias in tagged-end protocols reduces the probability of observing sequence that uniquely identifies certain transcripts.  This makes model identifiability less likely, and makes the estimation and downstream usage of uncertainty even more crucial than with other types of RNA-seq data.  Additionally, in barcode-based scRNA-seq data (e.g. Drop-Seq, inDrop, etc.) [screvmc;@scpower], there is uncertainty not only in read assignment within a cell, but also in the cell from which a read has derived [@bartender].  Thus, methods used to estimate transcriptional abundance and posterior uncertainty should take this ambiguity into account. We will explore models
  that allow us to probabilistically model the uncertainty in cell-barcode assignment, and will incorporate this ambiguity in fragment-to-cell assignment into our estimates of posterior uncertainty.

  B.  Highly-simplified likelihood models, when coupled with specific methods for estimating parametric intervals (e.g., confidence or credible intervals), may lead to systematic underestimation of posterior uncertainty [@isode2]. Our lab has been focusing on improved data-driven likelihood factorizations [@ddfact] that admit efficient inference without sacrificing accuracy, as well as the development of a selective alignment [@selectivealignment] procedure that efficiently computes the information required to obtain highly-accurate abundance estimates.  This allows us to close the small but persistent accuracy gap between fast "alignment-free" and traditional alignment-based quantification methods, while retaining high computational efficiency.  We will explore the interaction between the methodology used to map reads to transcripts <!--(i.e., traditional alignment, quasi-mapping, and selective alignment)--> and the likelihood factorization adopted, and will determine the most efficient combination of mapping and likelihood factorization that admits accurate estimates of posterior uncertainty. <!--This will lead to computationally efficient, yet accurate methods for estimating posterior the posterior uncertainty of transcript-level abundances derived from scRNA-seq data.-->

  C.  Though numerous approaches have been proposed for estimating posterior uncertainty [@rsem;@isode;@isode2;@bitseqvb;@kallisto;@salmon;@mmseq;@bitseq;@isolator] of transcript-level expression estimates, little comparison has been done concerning the effectiveness of different methodologies.  <!-- Specifically, the following (non-exhaustive) list of methods have been proposed in the literature : Bayesian MCMC [@bitseq], Slice sampling [@isolator], posterior Gibbs sampling (starting from maximum likelihood estimates) [@rsem;@mmseq;@salmon], and non-parametric bootstrapping over either input data or sufficient statistics [@isode;isode2;@kallisto;@salmon] -->.  We propose to perform, within the framework of Salmon and Alevin, a systematic comparison of different methodologies for estimating the posterior uncertainty of transcript abundances.  Specifically, we will evaluate posterior Gibbs sampling, non-parametric bootstrapping, Bayesian bootstrapping, and Hamiltonian Monte Carlo sampling.  It has previously been demonstrated that these approaches, though related, when brought to bear on other problems, exhibit distinct results in terms of their overall accuracy [@gibbs_vs_bs].  Hence, we will evaluate each of these methodologies with respect to their overall accuracy (how often the posterior intervals contain the true abundances) as well as their computational cost in the gene and transcript abundance uncertainty estimation problems ([Figure 1](#fig:fig1)).  <!--Here, we seek a method that accurately estimates the posterior uncertainty, but which exhibits the computational efficiency to eventually scale to all scRNA-seq data that will be generated for the HCA.-->

#### Deliverables 

   We will implement the described methods in the frameworks of [Salmon](https://github.com/COMBINE-lab/salmon) and [Alevin](https://github.com/k3yavi/alevin).  These features will synergize with work (through a different funding mechanism) to enhance the single-cell modeling and inference capabilities of these software.  We will also collaborate with Casey Greene's and Elana Fertig's labs as outlined in our [collaborative network description](#fig:fig3).<!-- lab to expose the relevant internal functionality of Salmon to speed their resampling-based approach for data augmentation.  We will also collaborate with Elana Fertig's lab to provide our quantification estimates and posterior uncertainty information in a format that can be easily provided to their P-GAPS / CoGAPS factorization model. -->
   
**Aim 2**:
We will develop a fragment-level simulator for scRNA-seq data. While a few simulators exist for scRNA-seq data, they focus on simulating gene-level _counts_ [@splatter], rather than the sequenced fragments themselves. There has also been a focus on how to model gene-level counts [@lun;@lun2;@basic;@scdd], but less-so transcript-level abundance. Currently, scRNA-seq data is generated by a range of protocols that differ in various steps, such as selection of fragments (full length, 3' end), library preparation protocol (CEL-seq, SMARTer etc.), and cell capture platform (microwell, microfluidic, droplet). These experimental steps introduce different types of noise and bias in the raw data. To model the effects of these protocols, our simulator will operate at the level of cell and cDNA fragment selection from the raw reference sequence, analogous to popular bulk RNA-seq simulation tools [@polyester]. We describe key details below:

  * For tag-based protocols, analysis requires counting unique molecular identifiers (UMIs) [@umitools]. UMI-tags play a crucial role in estimating molecular abundance, but the methodology has shortcomings [@sc_batch]. Due to their short length, the number of different UMI tags is less than the number of molecules present in the cell, which can lead to assigning the same UMIs to different molecules. Further, due to errors during amplification and sequencing, different UMIs do not always indicate different molecules. Finally, shared sequence between molecules (gene isoforms) can result in identical fragments that may falsely appear as duplicates. We will model the problem of UMI-tag assignment as a weighted bipartite graph ([Figure 2](#fig:fig2)), where the aforementioned types of error can be inferred from experimental data and incorporated as graph perturbations. <!-- The possible errors related to UMI tags are also prevalent in cell barcodes but occur less often due to high abundance of unique cell bar codes. -->

  * Prior to generating the simulated fragments, we will follow the recently-proposed Splatter [@splatter] model. The generative process involves learning model parameters from experimental scRNA-seq data and using the model to repeatedly sample genes or transcripts. The raw _counts_ estimated in this fashion incorporate the main features of scRNA-seq protocols such as the presence of outlier genes, gene dispersion, gene drop-out etc. We will extend this model by (1) adopting transcript-level, instead of gene-level, count modeling and (2) learning the relevant parameters to simulate raw fragments with UMIs and cell barcodes, instead of just counts. We will also incorporate known experimental biases [@alpine] into the read selection process. 
<!--  * Following the recent bulk RNA-seq simulators [@polyester] that allow the simulation of differentially expressed transcripts, our simulator will also generate the condition specific fold changes to regulated transcripts. Fold changes can be explicitly provided by the user. -->

#### Deliverables 
The deliverable for aim 2 is a fragment-level simulator for scRNA-seq data that can be trained with experimental scRNA-seq data. Learned model parameters will be used to generate gene and transcript level counts [@splatter], and protocol-dependent modeling of UMI and cell barcode tagging will be implemented. The benchmark data generated for the HCA will be used to train various models for the simulator, and we will create an array of simulated datasets that can be used to help benchmark future methods. 

## Evaluation and dissemination of methods, resources, or results

**Evaluation of methods** The simulator will be evaluated by measuring the correlation and relative error of transcript abundances from simulated reads with that of the experimental data from which the simulation parameters were learned. The methods developed for Aim 1 will be evaluated using the benchmark data being generated by collaborative network members Loyal Goff and Arjun Raj to assess the accuracy of our methods on experimental data and the concordance of our estimates between protocols. We will also make extensive use of the simulator developed for Aim 2 to evaluate accuracy where the ground truth is known. 

**Dissemination of methods & results** The relevant statement regarding the dissemination of methods & results appears in part II of this project proposal. 
<!-- Our methods and tools will be made available openly as they are designed and developed via our lab's [GitHub organization](https://github.com/COMBINE-lab)).  The suite of simulated data we generate to benchmark our abundance estimation methods will be documented and made publicly-available for use by other groups.  Finally, the scholarly papers that result from work will be posted to bioRxiv prior to journal submission, and journals with open-access publication options will be targeted. -->

## Statement of commitment to share
The relevant statement regarding our commitment to share code and results appears in part II of this project proposal. 
<!-- We hereby commit to share our proposal, methods, code, and research papers openly under permissive licenses.  <!-- Methods and tools created for this proposal will be developed openly on GitHub, and research will be disseminated via pre-prints on [bioRxiv](http://www.biorxiv.org/collection/bioinformatics) prior to submission to any conference or journal.-->

## Figures

![We will evaluate the performance of various methods using the following computational strategies for assessing uncertainty in both transcript and gene-level expression inference from scRNA-seq data. Each example path in the plot shows a different strategy, composing some method for mapping with a specific likelihood factorization and an inference strategy for estimating uncertainty. We will evaluate all combinations of methods for mapping, factorization and uncertainty estimation. The hypothetical plot at the top shows the performance comparison of different paths, from which we intend to choose the best (shown with a tick mark).\label{fig:fig1}](./Fig1.png){ width=70% }


![The simulator learns the model parameters from the experimental data. The repeated sampling process guided by these parameters constructs the set of final transcripts. Different sequence error models are used to introduce noise into cell barcodes and UMI tags. Finally, cell barcodes and UMI tags are appended to the sampled nucleotide sequence from the reference sequence adhering to the user defined protocol to construct the fastq files. The read header contains the ground truth.\label{fig:fig2}](./Fig2.png){ width=70% }


![Collaborative network overview for proposals submitted to this RFA with Patro lab contributions highlighted in blue.\label{fig:fig3}](./Fig3.png){width=70%}




\newpage

## References cited
<!--
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
-->
