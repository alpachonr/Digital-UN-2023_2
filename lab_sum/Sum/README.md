# Sumador con acarreo previo

Según los visto en clase vimos que se podría hacer un sumador de cuantos bits se quisiera, y el laboratorio pasado se realizó el decodificador de un número de 4 bits, pudiendo sumas de valores máximos de 15, para esto se realizó el paso a paso de como se calcula el sumador.

1. Para empezar la tabla de verdad de lo que necesitamos, dos entradas de un bit (A y B) y el acarreo (C), si es el primer \notsumador pues queda en ceros pero para los demás nos importa bastante el valor de este acarreo, las salidas que se requieren son; un dígito del número a sumar (S) y el acarreo para la siguiente suma (Cout).
<center>
  <img src="https://github.com/alpachonr/Digital-UN-2023_2/blob/main/lab_sum/img/sum_verdad.png" height="50%" width="50%" >
</center>

2.Luego para cada salida se hizo el mapa de karnaugh:
<center>
  <img src="https://github.com/alpachonr/Digital-UN-2023_2/blob/main/lab_sum/img/sum_k.png" height="30%" width="30%" >
</center>
- Este mapa es para la salida del digito de suma, con esto podemos obtener la expresión:
```math
C_{out} = BC_{in}+ AC_{in}+A*B
```
<center>
  <img src="https://github.com/alpachonr/Digital-UN-2023_2/blob/main/lab_sum/img/carry_k.png" height="30%" width="30%" >
</center>


# Esquematicos del sumador
<center>
  <img src="https://github.com/alpachonr/Digital-UN-2023_2/blob/main/lab_sum/img/sum_sch.png" height="30%" width="30%" >
</center>
# Se puede ver el 16 en binario en el led del carry out 
<center>
  <img src="https://github.com/alpachonr/Digital-UN-2023_2/blob/main/lab_sum/img/sum16.png" height="30%" width="30%" >
</center>

# Sumador-Restador Completo

Con el objetivo de compilar lo visto en anteriores prácticas, se propuso la simulación y posterior prueba de un sumador-restador completo en una fpga cyclone.

Este se compone de:
1. El 7 segmentos realizado en practicas anteriores (lab_fpga/READ.md)
2. El sumador-restado con c_in para alternar entre la operación de suma y resta
3. EL divisor de frecuencia para poder trabajar con la fpga
4. Mulpliplexores para la selección de datos
5. Y también un BintoDec para poder de pasar de lenguaje binario a Decimal



Tras confirmar el correcto funcionamiento del simulador, se realiza el Makefile y se con el top.vcp para cuadrar los Led's de la cyclone.

<center>
  <img src="https://github.com/alpachonr/Digital-UN-2023_2/blob/main/lab_sum/img/RtlSumres.png" height="30%" width="30%" >
</center>

 Como resultado de este proceso tenemos el codigo del Sumador-Restador completo ya montado en la FPGA Cyclone IV, donde a continuacion se muestra un ejemplo de operaciones en las que A=7 y B=6
<center>
  <img src="https://github.com/alpachonr/Digital-UN-2023_2/blob/main/lab_sum/img/7+6.jpeg" height="30%" width="30%" >
</center>
<center>
  <img src="https://github.com/alpachonr/Digital-UN-2023_2/blob/main/lab_sum/img/7-6.jpeg" height="30%" width="30%" >
</center>
