#!/bin/bash
# Annotation Script using snpEff

# Annotate variants using snpEff
snpEff hg38 somatic_snps.vcf > annotated_somatic.vcf

# Alternatively, use VEP (Variant Effect Predictor)
# vep -i somatic_snps.vcf -o annotated_somatic_vep.vcf --cache --assembly GRCh38
