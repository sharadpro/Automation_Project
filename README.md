# Automation_Project

Here we define the bucket name
S3_bucket=assignmetupgradesharad


this command is use to update the packages
sudo apt update -y

#Then checking if apache is installed or not, and if not install it automatically 


#Then installing net-tools so that it can be used for the next operation

then The next step i have done is  checking if apache service is running or not, if not running then restart it



then we have enabled apache restart automatically

then apache Archiving Logs

then copy to S3 since we have already setup  aws cli on ec2 instance by using commands 
sudo apt update
sudo apt install awscli
and then configured there with the iam role keys

#Make the script executible
chmod  +x  /root/Automation_Project/automation.sh
#switch to root user with sudo su
sudo  su
./root/Automation_Project/automation.sh

# or run with sudo privileges
sudo ./root/Automation_Project/automation.sh




Now we have to shedule the script in crontab so for that run the following cammand

sudo crontab -e
# here we will enter our script shedule time of execution
* * * * * sh /root/Automation_Project/automation.sh

# this will execute the script every minute
