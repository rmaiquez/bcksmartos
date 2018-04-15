#!/usr/bin/bash

# script to backups smartos vms
#
#
# Variables to VM ID
vm_1=ac732286-a254-67dd-e8d2-ef50bd70d68f
vm_2=3mv81426-5116-4e81-8042-fa133c2f5cc3
vm_3=m93f1edb-6930-601e-d65d-eae6478d7624
vm_4=10j6f264-e922-403f-e365-dfa0e490feec
vm_5=5tg87cdd-b917-62a5-e78f-e44a3a913fc9
backupdate=$(date "+%d-%m-%Y")

# Shutdown vm_1
echo "Apagando $vm_1... que la fuerza te acompañe... "
echo "..."
echo "..."

zlogin $vm_1 shutdown -h now

#sleep 10  # Waits 10 seconds

# Shutdown vm_2
echo "Apagando $vm_2... "
echo "..."
echo "..."

zlogin $vm_2 shutdown -h now

#sleep 10  # Waits 10 seconds

# Shutdown vm_3
echo "Apagando $vm_3... "
echo "..."
echo "..."

zlogin $vm_3 shutdown -h now

#sleep 10  # Waits 10 seconds

# Shutdown vm_4
echo "Apagando $vm_4... "
echo "..."
echo "..."

zlogin $vm_4 shutdown -h now

#sleep 10  # Waits 10 seconds

# Shutdown vm_5
echo "Apagando $vm_5... "
echo "..."
echo "..."

zlogin $vm_5 shutdown -h now

sleep 10  # Waits 10 seconds

# SEND VM vmadm send <UUID-ZONA> /opt/backups/<UUID-ZONA>
echo "Creando snapshot y enviando $vm_1 a /opt/backups/$vm_1@$backupdate... "
echo "..."
echo "..."

zfs snapshot zones/$vm_1@$backupdate
zfs snapshot zones/cores/$vm_1@$backupdate && vmadm start $vm_1
# to send an other server
zfs send zones/$vm_1@$backupdate | pv | ssh $ip_destino zfs receive -v zones/$vm_1@$backupdate
zfs send zones/cores/$vm_1@$backupdate | pv | ssh $ip_destino zfs receive -v zones/cores/$vm_1@$backupdate

echo "Creando snapshot y enviando $vm_2 a /opt/backups/$vm_2@$backupdate... "
echo "..."
echo "..."

zfs snapshot zones/$vm_2@$backupdate
zfs snapshot zones/cores/$vm_2@$backupdate && vmadm start $vm_2
# to send an other server
zfs send zones/$vm_2@$backupdate | pv | ssh $ip_destino zfs receive -v zones/$vm_2@$backupdate
zfs send zones/cores/$vm_2@$backupdate | pv | ssh $ip_destino zfs receive -v zones/cores/$vm_2@$backupdate


echo "Creando snapshot y enviando $vm_3 a /opt/backups/$vm_3@$backupdate... "
echo "..."
echo "..."

zfs snapshot zones/$vm_3@$backupdate
zfs snapshot zones/cores/$vm_3@$backupdate && vmadm start $vm_3
# to send an other server
zfs send zones/$vm_3@$backupdate | pv | ssh $ip_destino zfs receive -v zones/$vm_3@$backupdate
zfs send zones/cores/$vm_3@$backupdate | pv | ssh $ip_destino zfs receive -v zones/cores/$vm_3@$backupdate

echo "Creando snapshot y enviando $vm_4 a /opt/backups/$vm_4@$backupdate.... "
echo "..."
echo "..."

zfs snapshot zones/$vm_4@$backupdate
zfs snapshot zones/cores/$vm_4@$backupdate && vmadm start $vm_4
# to send an other server
zfs send zones/$vm_4@$backupdate | pv | ssh $ip_destino zfs receive -v zones/$vm_4@$backupdate
zfs send zones/cores/$vm_4@$backupdate | pv | ssh $ip_destino zfs receive -v zones/cores/$vm_4@$backupdate

echo "Creando snapshot y enviando $vm_5 a /opt/backups/$vm_5@$backupdate... "
echo "..."
echo "..."

zfs snapshot zones/$vm_5@$backupdate
zfs snapshot zones/cores/$vm_5@$backupdate && vmadm start $vm_5
# to send an other server
zfs send zones/$vm_5@$backupdate | pv | ssh $ip_destino zfs receive -v zones/$vm_5@$backupdate
zfs send zones/cores/$vm_5@$backupdate | pv | ssh $ip_destino zfs receive -v zones/cores/$vm_5@$backupdate

echo "Backups realizados con éxito, la galaxia vuelve a parecer segura."
