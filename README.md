# alex7sky_infra
alex7sky Infra repository
### Для подключения в одну команду можно использовать это: "ssh -i ~/.ssh/appuser -A -J appuser@84.201.172.139  appuser@10.130.0.24"
bastion_IP = 84.201.172.139
someinternalhost_IP = 10.130.0.24
testapp_IP = 84.201.133.229
testapp_port = 9292
#Дополнительное задание:
#Для запуска в gcloud выполнить команду из директории со скриптом startup_script.sh:
gcloud compute instances create reddit-app \
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure\
  --metadata-from-file startup-script=startup_script.sh

#В яндекс облаке выполнить команду из директории с файлом startup_script.yaml:
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=startup_script.yaml
