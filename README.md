# Automation_Project

1.Here we define the bucket name
S3_bucket=assignmetupgradesharad


2.this command is use to update the packages
sudo apt update -y

3.Then checking if apache is installed or not, and if not install it automatically, script is already written in automation.sh


4.Then installing net-tools so that it can be used for the next operation

5.then The next step i have done is  checking if apache service is running or not, if not running then restart it



6.then we have enabled apache restart automatically

6then apache Archiving Logs

7.then copy to S3 since we have already setup  aws cli on ec2 instance by using commands 
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
# here we will enter our script shedule time of execution the below will shedule a cron job for daily at 1 am
0 1 * * * sh /root/Automation_Project/automation.sh

# this will execute the script every minute

########################################
Start of task 3
#########################################
1. automation file contain the script to shedule the crontab automatically without going inside the crontab
2. the script will execute at 1 am
3, I have given all the permission to the file automation i.e. all root privelleges
    with command
               sudo chmod -R 777 automation
