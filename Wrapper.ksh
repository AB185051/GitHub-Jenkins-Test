echo -e "\n\nScript Started On " `date` 
echo -e "Starting DevOps Case Study Execution...." 
echo -e "Starting Fastload execution..." 
fastload < td_systems.fld > td_systems.log 
echo -e "Fastload execution completed" 
echo -e "Loading of data from staging to Target..." 
bteq < td_systems_edw.btq > td_systems_edw.log 
echo -e "Target table loaded" 
echo -e "Starting View creation..." 
bteq < td_systems_view.btq > td_systems_view.log 
echo -e "View DDL created"
./td_rowcount.ksh
echo -e "\n\nScript Completed On " `date` 
