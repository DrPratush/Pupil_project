#!/bin/bash
# Alignment Script for Tumor and Normal Samples using BWA

# Index the reference genome (if not already indexed)
bwa index /Users/pratushjambhulkar/genome_indexes/hg38/Homo_sapiens.GRCh38.dna.primary_assembly.fa

# Align Tumor Sample
bwa mem -t 4 \
  /Users/pratushjambhulkar/genome_indexes/hg38/Homo_sapiens.GRCh38.dna.primary_assembly.fa \
  /Users/pratushjambhulkar/Downloads/pupil\ bio\ ngs\ dataset/PA220KH-lib09-P19-Tumor_S2_L001_R1_001.fastq \
  /Users/pratushjambhulkar/Downloads/pupil\ bio\ ngs\ dataset/PA220KH-lib09-P19-Tumor_S2_L001_R2_001.fastq \
  > Tumor_aligned.sam

# Align Normal Sample
bwa mem -t 4 \
  /Users/pratushjambhulkar/genome_indexes/hg38/Homo_sapiens.GRCh38.dna.primary_assembly.fa \
  /Users/pratushjambhulkar/Downloads/pupil\ bio\ ngs\ dataset/PA221MH-lib09-P19-Norm_S1_L001_R1_001.fastq \
  /Users/pratushjambhulkar/Downloads/pupil\ bio\ ngs\ dataset/PA221MH-lib09-P19-Norm_S1_L001_R2_001.fastq \
  > Normal_aligned.sam

# Convert SAM to BAM
samtools view -Sb Tumor_aligned.sam > Tumor_aligned.bam
samtools view -Sb Normal_aligned.sam > Normal_aligned.bam

# Sort BAM files
samtools sort Tumor_aligned.bam -o Tumor_aligned_sorted.bam
samtools sort Normal_aligned.bam -o Normal_aligned_sorted.bam

# Index BAM files
samtools index Tumor_aligned_sorted.bam
samtools index Normal_aligned_sorted.bam
