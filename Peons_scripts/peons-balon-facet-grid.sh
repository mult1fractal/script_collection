#!/bin/env bash

cutoff="0.0"
######### Phylum

for i in *pavian_report_filtered.csv ; do
#get samplename
	samplename=$(echo "$i" | awk -F"_pavian_report_filtered.csv" '{print $1}')
# get case
	casename=$(echo "$i" | cut -d "_" -f1 )
# get type 
	source=$(echo "$i" | cut -d "_" -f3 )
	if [ "$source" == "NB" ]; then 
	type="Mother"
	elif [ "$source" == "VT0" ]; then 
	type="Mother"
	elif [ "$source" == "VT1" ]; then 
	type="Mother"
	elif [ "$source" == "VT2" ]; then 
	type="Mother"
	elif [ "$source" == "RE" ]; then 
	type="Child"
	elif [ "$source" == "PH" ]; then 
	type="Child"
	elif [ "$source" == "ME" ]; then 
	type="Child"
	else :
	fi
# get abundance and phylum name
	cat $i | grep -w "P" | cut -f1,6 | tr "\t" "," | tr -d  " " | awk -v z="$cutoff" '$1>=z' > tmp1_"$i"
# add column:  samplename
	awk -v d="$samplename" -F"," 'BEGIN { OFS = "," } {$3=d; print}' tmp1_"$i" > tmp2_"$i"
# add column:  case
	awk -v e="$casename" -F"," 'BEGIN { OFS = "," } {$4=e; print}' tmp2_"$i" > tmp3_"$i"
# add column:  source
	awk -v f="$source" -F"," 'BEGIN { OFS = "," } {$5=f; print}' tmp3_"$i" > tmp4_"$i"
# add column:  type
	awk -v g="$type" -F"," 'BEGIN { OFS = "," } {$6=g; print}' tmp4_"$i" > phylum_only_"$i"
	rm tmp1_"$i" tmp2_"$i" tmp3_"$i" tmp4_"$i"


########### Genus


# get abundance and genus name
	cat $i | grep -w "G" | cut -f1,6 | tr "\t" "," | tr -d  " " | awk -v z="$cutoff" '$1>=z' > tmp1_"$i"
# add column:  samplename
	awk -v d="$samplename" -F"," 'BEGIN { OFS = "," } {$3=d; print}' tmp1_"$i" > tmp2_"$i"
# add column:  case
	awk -v e="$casename" -F"," 'BEGIN { OFS = "," } {$4=e; print}' tmp2_"$i" > tmp3_"$i"
# add column:  source
	awk -v f="$source" -F"," 'BEGIN { OFS = "," } {$5=f; print}' tmp3_"$i" > tmp4_"$i"
# add column:  type
	awk -v g="$type" -F"," 'BEGIN { OFS = "," } {$6=g; print}' tmp4_"$i" > genus_only_"$i"
	rm tmp1_"$i" tmp2_"$i" tmp3_"$i" tmp4_"$i"


############ Class

# get abundance and class name
	cat $i | grep -w "C" | cut -f1,6 | tr "\t" "," | tr -d  " " | awk -v z="$cutoff" '$1>=z' > tmp1_"$i"
# add column:  samplename
	awk -v d="$samplename" -F"," 'BEGIN { OFS = "," } {$3=d; print}' tmp1_"$i" > tmp2_"$i"
# add column:  case
	awk -v e="$casename" -F"," 'BEGIN { OFS = "," } {$4=e; print}' tmp2_"$i" > tmp3_"$i"
# add column:  source
	awk -v f="$source" -F"," 'BEGIN { OFS = "," } {$5=f; print}' tmp3_"$i" > tmp4_"$i"
# add column:  type
	awk -v g="$type" -F"," 'BEGIN { OFS = "," } {$6=g; print}' tmp4_"$i" > class_only_"$i"
	rm tmp1_"$i" tmp2_"$i" tmp3_"$i" tmp4_"$i"


############ Species

# get abundance and species name
	cat $i | grep -w "S" | cut -f1,6 | tr "\t" "," | tr -s " " | awk -v z="$cutoff" '$1>=z' | awk '{sub(/^ +/,""); gsub(/, /,",")}1' > tmp1_"$i"
# add column:  samplename
	awk -v d="$samplename" -F"," 'BEGIN { OFS = "," } {$3=d; print}' tmp1_"$i" > tmp2_"$i"
# add column:  case
	awk -v e="$casename" -F"," 'BEGIN { OFS = "," } {$4=e; print}' tmp2_"$i" > tmp3_"$i"
# add column:  source
	awk -v f="$source" -F"," 'BEGIN { OFS = "," } {$5=f; print}' tmp3_"$i" > tmp4_"$i"
# add column:  type
	awk -v g="$type" -F"," 'BEGIN { OFS = "," } {$6=g; print}' tmp4_"$i" > species_only_"$i"
	rm tmp1_"$i" tmp2_"$i" tmp3_"$i" tmp4_"$i"
done

# create files for facet grid plot
cat phylum_only* > phylum_plot.csv
sed -i '1s/.*/Abundance,Organism,Sample_name,Case,Source,Type\n&/' phylum_plot.csv

cat genus_only* > genus_plot.csv
sed -i '1s/.*/Abundance,Organism,Sample_name,Case,Source,Type\n&/' genus_plot.csv

cat class_only* > class_plot.csv
sed -i '1s/.*/Abundance,Organism,Sample_name,Case,Source,Type\n&/' class_plot.csv

cat species_only* > species_plot.csv
sed -i '1s/.*/Abundance,Organism,Sample_name,Case,Source,Type\n&/' species_plot.csv
## remove data trash
rm phylum_only* genus_only* class_only* species_only*


# add header sed -i 1i"id1,id2,id3,id4" file.csv
