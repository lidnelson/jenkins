echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

sudo apt-get install apt-transport-https ca-certificates

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

sudo apt-get update && sudo apt-get install google-cloud-sdk

gcloud compute instance delete jenkins-instance

gcloud compute instances create jenkins-instance --zone europe-west1-b --image-family ubuntu-1604-lts --image-project ubuntu-os-cloud 

gcloud beta compute --project "abbibrunton" ssh --zone "europe-west3-b" "jenkins-instance"

sudo apt-get update
sudo apt-get -y install python3-pip
sudo apt-get install git

git clone https://github.com/lidnelson/personalproject

cd personalproject

sudo pip3 install -r requirements.txt

export FLASK_APP=run.py
export FLASK_RUN=production
export FLASK_RUN_HOST='0.0.0.0'

flask run
