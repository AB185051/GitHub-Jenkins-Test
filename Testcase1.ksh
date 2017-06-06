filecount=`wc -l < td_systems.txt`
echo "File count is " $filecount
export stg_tbl_cnt=`tail -1 stg_tbl.out | awk '{print $1}'`
echo "Staging table count is " $stg_tbl_cnt
export stg_tbl_cond_cnt=`tail -1 stg_tbl_conditions.out | awk '{print $1}'`
echo "Staging table count with Transformation logic is " $stg_tbl_cond_cnt
export tgt_tbl_cnt=`tail -1 tgt_tbl.out | awk '{print $1}'`
echo "Target table count is " $tgt_tbl_cnt
if [[ $filecount -eq $stg_tbl_cnt ]] 
 then
	#echo "File to Staging table count matches"
	if [[ $stg_tbl_cond_cnt -eq $tgt_tbl_cnt ]] 	
	 then
	  echo "Pass"
	else
      echo "Fail"
      exit 99	  
	fi  
 else
	echo "Fail"
	exit 99
fi

exit 0