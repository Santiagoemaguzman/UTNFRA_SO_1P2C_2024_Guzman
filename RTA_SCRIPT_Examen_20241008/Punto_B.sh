#!/bin/bash
sudo fdisk /dev/sdc << EOF
1G
1G
1G
1G
1G
1G
1G
1G
1G
1G
EOF
for i in 1 2 3 5 6 7 8 9 10; do
    sudo mkfs -t ext4 /dev/sdc$i
done
echo "/dev/sdc{1..3}  /Examenes-UTN/alumno_1/parcial_{1..3}  ext4  defaults  0  0" | sudo tee -a /etc/fstab
echo "/dev/sdc{5..6}  /Examenes-UTN/alumno_2/parcial_{1..2}  ext4  defaults  0  0" | sudo tee -a /etc/fstab
echo "/dev/sdc{7..9}  /Examenes-UTN/alumno_3/parcial_{1..3}  ext4  defaults  0  0" | sudo tee -a /etc/fstab
echo "/dev/sdc10      /Examenes-UTN/profesores               ext4  defaults  0  0" | sudo tee -a /etc/fstab
sudo mount -a
