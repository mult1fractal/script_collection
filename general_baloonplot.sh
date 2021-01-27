#!/bin/env bash

##header done

####PHYLUM

cat *pavian_report_filtered.csv | grep -w "P" | awk -F"\t" '$1 > 0.1' | cut -f6 | sort | uniq | tr -d " " > .organismlist.dataR

# i just need to change the
# header (change 01-GER to GER-01)
printf "phylum," > phylum.csv
for x in *pavian_report_filtered.csv ; do
		samplename=$(echo "${x%_pavian_report_filtered.csv}" | cut -f2 -d "-")
		sampleid=$(echo "${x%_pavian_report_filtered.csv}" | cut -f1 -d "-")
		printf "${samplename}-${sampleid}," >> phylum.csv
done
printf "\n" >> phylum.csv
##header done

cat .organismlist.dataR | while IFS= read -r orgname ; do 
	printf "${orgname}," >> phylum.csv
	for x in *pavian_report_filtered.csv ; do
		# if grep true else "NA,"		
		readcount=$(grep -w "P" ${x}| cut -f1,6 | grep -w "$orgname" | cut -f1 | awk -F, '$1 > 0.1'| tr -d  "\n" | tr -d " ")
		if [ -z "$readcount" ]
			then
      			printf "NA," >> phylum.csv
			else
      			printf "${readcount}," >> phylum.csv
		fi
	done
	printf "\n" >> phylum.csv
done

sed -i 's/.$//' phylum.csv

rm .*.dataR


####CLASS

cat *pavian_report_filtered.csv | grep -w "C" | awk -F"\t" '$1 > 0.1' | cut -f6 | sort | uniq | tr -d " " > .organismlist.dataR

# header
printf "class," > class.csv
for x in *pavian_report_filtered.csv ; do
		samplename=$(echo "${x%_pavian_report_filtered.csv}" | cut -f2 -d "-")
		sampleid=$(echo "${x%_pavian_report_filtered.csv}" | cut -f1 -d "-")
		printf "${samplename}-${sampleid}," >> class.csv
done
printf "\n" >> class.csv
##header done

cat .organismlist.dataR | while IFS= read -r orgname ; do 
	printf "${orgname}," >> class.csv
	for x in *pavian_report_filtered.csv ; do
		# if grep true else "NA,"		
		readcount=$(grep -w "C" ${x}| cut -f1,6 | grep -w "$orgname" | cut -f1 | awk -F, '$1 > 0.1'| tr -d  "\n" | tr -d " ")
		if [ -z "$readcount" ]
			then
      			printf "NA," >> class.csv
			else
      			printf "${readcount}," >> class.csv
		fi
	done
	printf "\n" >> class.csv
done

sed -i 's/.$//' class.csv

rm .*.dataR

####GENUS

cat *pavian_report_filtered.csv | grep -w "G" | awk -F"\t" '$1 > 0.1' | cut -f6 | sort | uniq | cut -f15,16 | tr -d " " > .organismlist.dataR

# header
printf "genus," > genus.csv
for x in *pavian_report_filtered.csv ; do
		samplename=$(echo "${x%_pavian_report_filtered.csv}" | cut -f2 -d "-")
		sampleid=$(echo "${x%_pavian_report_filtered.csv}" | cut -f1 -d "-")
		printf "${samplename}-${sampleid}," >> genus.csv
done
printf "\n" >> genus.csv
##header done

cat .organismlist.dataR | while IFS= read -r orgname ; do 
	printf "${orgname}," >> genus.csv
	for x in *pavian_report_filtered.csv ; do
		# if grep true else "NA,"		
		readcount=$(grep -w "G" ${x}| cut -f1,6 | grep -w "$orgname" | cut -f1 | awk -F, '$1 > 0.1'| tr -d  "\n" | tr -d " ")
		if [ -z "$readcount" ]
			then
      			printf "NA," >> genus.csv
			else
      			printf "${readcount}," >> genus.csv
		fi
	done
	printf "\n" >> genus.csv
done

sed -i 's/.$//' genus.csv

rm .*.dataR

####SPECIES

cat *pavian_report_filtered.csv | grep -w "S" | awk -F"\t" '$1 > 0.1' | cut -f6 | sort | uniq | cut -f15,16 | awk '{$1=$1;print}' > .organismlist.dataR

# header
printf "species," > species.csv
for x in *pavian_report_filtered.csv ; do
		samplename=$(echo "${x%_pavian_report_filtered.csv}" | cut -f2 -d "-")
		sampleid=$(echo "${x%_pavian_report_filtered.csv}" | cut -f1 -d "-")
		printf "${samplename}-${sampleid}," >> species.csv
done
printf "\n" >> species.csv
##header done

cat .organismlist.dataR | while IFS= read -r orgname ; do 
	printf "${orgname}," >> species.csv
	for x in *pavian_report_filtered.csv ; do
		# if grep true else "NA,"		
		readcount=$(grep -w "S" ${x}| cut -f1,6 | grep -w "$orgname" | cut -f1 | awk -F, '$1 > 0.1'| tr -d  "\n" | tr -d " ")
		if [ -z "$readcount" ]
			then
      			printf "NA," >> species.csv
			else
      			printf "${readcount}," >> species.csv
		fi
	done
	printf "\n" >> species.csv
done

sed -i 's/.$//' species.csv

rm .*.dataR
