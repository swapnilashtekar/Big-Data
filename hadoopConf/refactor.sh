# REPLACE <YOURUSERNAME> with your username
test_home=~/hadoopConf
 
for i in `cat $test_home/slaves`
do
	echo 'logging into '${i}

	gnome-terminal -x bash -c "ssh -t ${i} 'rm -rf /s/${i}/a/tmp/hadoop-sashteka;bash;'" &


done
