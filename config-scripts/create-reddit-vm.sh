#! /bin/bash
 yc compute instance create \
  --name reddit-app-immutable \
  --hostname reddit-app \
  --memory=2 \
  --create-boot-disk name=disk1,size=10GB,image-id=fd8ecbmvr44ipcv6nsue \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key ~/.ssh/appuser.pub
