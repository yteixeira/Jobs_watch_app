
sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt install python3-dev python3-pip -y
sudo pip3 install -r /home/ubuntu/job-watch/requirements.txt
mkdir /home/vagrant/Downloads
touch /home/vagrant/Downloads/ItJobsWatchTop30.csv
