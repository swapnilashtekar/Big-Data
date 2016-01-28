USER="sashteka"
HOSTNAME = $(hostname)
echo 'Localhost is :' $(hostname)
echo 'User is :' ${USER}
ssh $(hostname) 'rm -rf /tmp/*' >> local_output_file
ssh $(hostname) 'rm -rf /s/${HOSTNAME}/a/tmp/hadoop-${USER}*' >> local_output_file
ssh $(hostname) 'rm -rf /s/${HOSTNAME}/a/tmp/${USER}*' >> local_output_file 

for server in $(cat slaves)
do
  echo 'Server is :' $server
  HOSTNAME = $(hostname)
  ssh $server 'rm -rf /tmp/*' >> local_output_file
  ssh $server 'rm -rf /s/${HOSTNAME}/a/tmp/haddop-${USER}*' >> local_output_file 
  ssh $server 'rm -rf /s/${HOSTNAME}/a/tmp/*' >> local_output_file 
done

for server in $(cat masters)
do
  echo 'Server is :' $server
  HOSTNAME = $(hostname)
  ssh $server 'rm -rf /tmp/*' >> local_output_file
  ssh $server 'rm -rf /s/${HOSTNAME}/a/tmp/haddop-${USER}*' >> local_output_file
  ssh $server 'rm -rf /s/${HOSTNAME}/a/tmp/${USER}*' >> local_output_file 
done