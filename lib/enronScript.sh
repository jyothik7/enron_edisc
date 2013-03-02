#!/bin/bash
# To run: "bash sample.sh"

dump_dir=/Users/jyothi/Documents/CustodianData/ef
data_dir=/Users/jyothi/Documents/CustodianData

for j in `ls $data_dir/*.zip`
do
    echo "* DIR: $j"
    fileName="`basename $j`".xml 
    for i in `unzip -l $j | awk '{print $NF}' | grep ".*\.txt" | grep -v "native"`
    do
        echo "-------- FILE: $i"  
        cat <(printf "<DOC>\n<DOCNO>`basename $i`</DOCNO>\n") <(unzip -p $j $i | perl parseToTags.pl) <(printf "\n</DOC>\n") >> $dump_dir/$fileName
        done
    echo "************************************************"
    echo " "
done