#!/bin/bash
mkdir -p ~/Estructura_Asimetrica/{correo,clientes}

for i in {1..100}; do
    touch ~/Estructura_Asimetrica/correo/cartas_$i
    touch ~/Estructura_Asimetrica/clientes/cartas_$i
done

for i in {1..10}; do
    touch ~/Estructura_Asimetrica/correo/carteros_$i
done

