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
        cat <(printf "<DOC>\n<DOCNO>`basename $i`</DOCNO>\n<TEXT>\n") <(unzip -p $j $i | perl /Users/jyothi/Documents/EDiscovery/Spring2013/clean.pl) <(printf "\n</TEXT>\n</DOC>\n") >> $dump_dir/$fileName              
       # cat <(printf "<DOC>\n<DOCNO>`basename $i`</DOCNO>\n<TEXT>\n") <(unzip -p $j "$i") <(printf "\n</TEXT>\n</DOC>\n") >> $dump_dir/$fileName
        done
    echo "************************************************"
    echo " "
done

# for k in `ls $dump_dir/*.xml`
# do
# 	perl /Users/jyothi/Documents/EDiscovery/Spring2013/clean.pl < "$k" > cleaned_`basename "$k"`
# done
# 
# echo "------------------------ Cleaning Done------------------------"


# TO TAR GZ USE THE FOLLOWING COMMAND
# tar -cvzf enronCustodianDatanew.tar.gz ef
  
  
    # cat <(echo "<DOC><DOCNO>`basename $i`</DOCNO><TEXT>") <(unzip -p $j "$i") <(echo "</TEXT></DOC>") >> $dump_dir/trec2010_enron.txt

  
             
        # Put multiple files in the $dump_dir folder
       # cat <(echo "<DOC><DOCNO>`basename $i`</DOCNO><TEXT>") <(unzip -p $j "$i") <(echo "</TEXT></DOC>") > $dump_dir/`basename $i`.xml
        
        # perl /Users/jyothi/Documents/EDiscovery/Spring2013/clean.pl "`unzip -p $j $i`"
        # break
        
      #      
        
        # Put in one file in the $dump_dir folder