#!/bin/bash
# Variant Calling Script using Mutect2 and BCFtools

# Run Mutect2 for somatic variant calling
gatk Mutect2 \
  -R /Users/pratushjambhulkar/genome_indexes/hg38/Homo_sapiens.GRCh38.dna.primary_assembly.fa \
  -I Tumor_aligned_sorted.bam \
  -I Normal_aligned_sorted.bam \
  -tumor Tumor \
  -normal Normal \
  -O somatic_raw.vcf

# Filter the variants
gatk FilterMutectCalls \
  -V somatic_raw.vcf \
  -R /Users/pratushjambhulkar/genome_indexes/hg38/Homo_sapiens.GRCh38.dna.primary_assembly.fa \
  -O somatic_filtered.vcf

# Extract SNPs and INDELs
bcftools view -v snps somatic_filtered.vcf -o somatic_snps.vcf
bcftools view -v indels somatic_filtered.vcf -o somatic_indels.vcf
