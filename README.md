Pupil_Bioinformatics_Project/
├── data/
│   ├── PupilBioTest_PMP_revA.csv      # PMP input dataset
│   ├── NGS_Tumor_sample.fastq         # Tumor NGS sample
│   ├── NGS_Normal_sample.fastq        # Normal NGS sample
│   ├── hg38_index/                    # Reference genome index for alignment
├── scripts/
│   ├── coverage_analysis.R            # PMP coverage analysis script
│   ├── biomarker_identification.R     # PMP biomarker identification script
│   ├── sequencing_depth_analysis.R    # PMP sequencing depth analysis script
│   ├── ngs_alignment.sh               # NGS alignment script using Bowtie2
│   ├── variant_calling.sh             # Variant calling using samtools and bcftools
│   ├── coverage_analysis_ngs.R        # Coverage analysis for NGS data
├── results/
│   ├── figures/                       # Plots and visualizations
│   ├── tables/                        # Summary results and statistics
├── README.md                          # Project documentation
├── report.pdf                         # Final report with results
└── LICENSE                            # MIT License
