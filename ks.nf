#!/usr/bin/env nextflow
echo true

normal1="normal_fastqs_1.txt"
normal2="normal_fastqs_2.txt"
tumor1="tumor_fastqs_1.txt"
tumor2="tumor_fastqs_2.txt"
ref="ref_genome/hg19.fa"
np=4
id="chr22_insilico"
cpus=2


process runSMuFin {
	"""
	cd /tmp
	/usr/lib64/openmpi/bin/mpirun --np $np --allow-run-as-root SMuFin --ref $ref --normal_fastq_1 $normal1 --normal_fastq_2 $normal2 --tumor_fastq_1 $tumor1 --tumor_fastq_2 $tumor2 --patient_id $id --cpus_per_node $cpus
	"""
}
