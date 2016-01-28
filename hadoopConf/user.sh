USER="sashteka"
HOSTNAME = $(hostname)
echo 'Localhost is :' $(hostname)
echo 'User is :' ${USER}
#For Loclahost
ssh $(hostname) 'rm -rf /tmp/*' >> local_output_file
ssh $(hostname) 'rm -rf /s/${HOSTNAME}/a/tmp/*' >> local_output_file

#For Slaves
for server in $(cat slaves)
do
  echo 'Server is :' $server
  HOSTNAME = $(hostname)
  ssh $server 'rm -rf /tmp/*' >> local_output_file
  ssh $server 'rm -rf /s/${HOSTNAME}/a/tmp/*' >> local_output_file
done

#For Master
for server in $(cat masters)
do
  echo 'Server is :' $server
  HOSTNAME = $(hostname)
  ssh $server 'rm -rf /tmp/*' >> local_output_file
  ssh $server 'rm -rf /s/${HOSTNAME}/a/tmp/*' >> local_output_file 
done