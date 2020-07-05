#!/bin/bash

USER="reddit"
apt-get install -y git
useradd -U -d /home/$USER -s /bin/bash $USER
chown -R $USER:$USER /home/$USER
sudo git clone -b monolith https://github.com/express42/reddit.git /home/$USER/app
cd /home/$USER/app && bundle install
touch /home/$USER/reddit.service
sudo echo "[Unit]
Description=Test Puma HTTP Server
After=network.target

[Service]
Type=simple
User=$USER
WorkingDirectory=/home/$USER/app
ExecStart=/bin/bash -lc 'RAILS_ENV=production bundle exec puma'
PIDFile=/home/$USER/app/puma.pid
Restart=always

[Install]
WantedBy=multi-user.target" > /home/$USER/reddit.service
sudo mv /home/$USER/reddit.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable reddit.service
sudo systemctl start reddit.service
