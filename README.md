# alex7sky_infra
alex7sky Infra repository
#Terraform_1
Определена input переменная public_key_path для подключения провижинеров.
Определена input переменная instance_zone для задания зоны в ресурсе "yandex_compute_instance" "app"
Отформатированы конфигурационные файлы.
Создан terraform.tfvars.example с переменными для образца
*
создан lb.tf с описанием балансировщика.
Добавлен адрес балансировщика в output переменные 
Добавлен второй инстанс, проверена доступность приложения при отключении одного из инстансов. 
Добавлен адрес второго инстанса в output переменные 
Какие проблемы вы видите в такой конфигурацииприложения?
У нас для каждого инстанса используется отдельная база данных, это приведет к неконсистентности данных в приложении. 
Удален второй инстанс, созданный копированием, создан через парамтр ресурса count.

#Packer
В директорию packer добавлены:
Файл переменных variables.json.example
Файл для сборки fry образа  ubuntu16.json
Файл для сборки bake образа immutable.json
 Скрипты деплоя fry образа в директории packer/scripts/
 Скрипт деплоя bake образа в директории packer/files/deploy.sh ( Для установки монги и руби используются скрипты от fry образа из packer/scripts/)
 В директорию config-scripts/ добавлен скрипт для бысртой выкатки вируталки из созданного bake образа


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
