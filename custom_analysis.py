import pandas as pd

# Load the VCF file
vcf_file = "Normal_with_AF.vcf"
allele_frequencies = []

# Read the VCF file
with open(vcf_file, 'r') as file:
    for line in file:
        # Skip header lines
        if not line.startswith('#'):
            fields = line.strip().split('\t')
            info = fields[7]  # INFO field
            for item in info.split(';'):
                if item.startswith('AF='):
                    af_values = item.split('=')[1].split(',')
                    for af in af_values:
                        try:
                            allele_frequencies.append(float(af))
                        except ValueError:
                            print(f"Skipping invalid value: {af}")

# Calculate the median background mutation level
median_af = pd.Series(allele_frequencies).median()
print(f"Median Background Mutation Level: {median_af}")

# Calculate required reads per million to confidently call a mutation
reads_per_million = 1_000_000 / (2 * median_af)
print(f"Reads per million required to confidently call a mutation: {reads_per_million}")
