#!/bin/bash
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

sudo useradd -m -G p1c2_2024_gAlumno p1c2_2024_A1
echo "p1c2_2024_A1:vagrant" | sudo chpasswd

sudo useradd -m -G p1c2_2024_gAlumno p1c2_2024_A2
echo "p1c2_2024_A2:vagrant" | sudo chpasswd

sudo useradd -m -G p1c2_2024_gAlumno p1c2_2024_A3
echo "p1c2_2024_A3:vagrant" | sudo chpasswd

sudo useradd -m -G p1c2_2024_gProfesores p1c2_2024_P1
echo "p1c2_2024_P1:vagrant" | sudo chpasswd

sudo grep -E 'p1c2_2024_A1|p1c2_2024_A2|p1c2_2024_A3' /etc/shadow | awk -F ':' '{print $2}'

sudo chown -R p1c2_2024_A1:p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo chmod -R 750 /Examenes-UTN/alumno_1

sudo chown -R p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chmod -R 760 /Examenes-UTN/alumno_2

sudo chown -R p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chmod -R 700 /Examenes-UTN/alumno_3

sudo chown -R p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores
sudo chmod -R 775 /Examenes-UTN/profesores

for i in 1 2 3; do
    sudo su -c "whoami > /Examenes-UTN/alumno_${i}/validar.txt" "p1c2_2024_A${i}"
done

sudo su -c "whoami > /Examenes-UTN/profesores/validar.txt" p1c2_2024_P1
