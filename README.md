# Somatic Mutation Analysis Pipeline

## 📦 Project Structure

```
├── data/                   # Processed datasets
│   ├── Normal_with_AF.vcf
│   ├── somatic_snps.vcf
│   └── reference_info.txt
├── results/                # Analysis results
│   ├── summary_table.csv
│   ├── mutation_statistics.png
│   └── annotated_variants_sample.vcf
├── scripts/                # Automation scripts
│   ├── alignment.sh
│   ├── variant_calling.sh
│   ├── annotation.sh
│   └── custom_analysis.py
├── report.pdf              # Final report
├── LICENSE                 # License information
└── README.md               # Project instructions
```

## 🚀 Setup and Execution

### 1️⃣ Install Required Tools

```bash
brew install --cask anaconda
conda create -n bio_env python=3.8
conda activate bio_env
conda install -c bioconda bwa samtools bcftools gatk4 snpeff
pip install pandas matplotlib seaborn
```

### 2️⃣ Run the Workflow

```bash
bash scripts/alignment.sh
bash scripts/variant_calling.sh
bash scripts/annotation.sh
python scripts/custom_analysis.py
```

## 📊 Expected Outputs

- **summary_table.csv**: Mutation statistics summary.  
- **mutation_statistics.png**: Visualization of mutation distribution.  
- **annotated_variants_sample.vcf**: Annotated somatic variants.

## ⚖️ License

Distributed under the **MIT License**. See `LICENSE` for more information.
