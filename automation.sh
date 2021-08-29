#!/bin/sh
S3_bucket=assignmetupgradesharad

sudo apt update -y

#checking if apache is installed or not, and if not install it automatically

if dpkg --get-selections | grep apache | awk '{ print $2 }' | uniq eq 'install'
then
echo "installed already"
else

 echo y | sudo apt install apache2

fi

#installing net-tools so that it can be used for the next operation

echo y | sudo apt-get install net-tools

# checking if apache service is running or not, if not running then restart it

if sudo netstat -tnlp | grep apache | awk '{ print $6 }' | uniq  eq 'LISTEN'
then
echo "service running"
  else
  sudo systemctl restart apache2
fi

# enabling apache restart automatically

sudo systemctl enable apache2

#Archiving Logs
#for access log
for file in $(ls /var/log/apache2/*.$(date '+%d%m%Y-%H%M%S').access.log); do
    gzip $file
    mv $file.gz /temp/Sharad-httpd-logs-$(date '+%d%m%Y-%H%M%S').gz
    aws s3 \
cp /tmp/Sharad-httpd-logs-$(date '+%d%m%Y-%H%M%S').gz \
s3://${s3_bucket}/Sharad-httpd-logs-$(date '+%d%m%Y-%H%M%S').gz
#now copied to S3 since your aws cli is already configured on ec2 instance
done;

#for error log files
for file in $(ls /var/log/apache2/*.$(date '+%d%m%Y-%H%M%S').error.log); do
    gzip $file
    mv $file.gz /temp/Sharad-error-logs-$(date '+%d%m%Y-%H%M%S').gz
    aws s3 \
cp /tmp/Sharad-error-logs-$(date '+%d%m%Y-%H%M%S').gz \
s3://${s3_bucket}/Sharad-error-logs-$(date '+%d%m%Y-%H%M%S').gz
#now copied to S3 since your aws cli is already configured on ec2 instance

done;


# we will shedule this in crontab . Instruction is written in readme file
