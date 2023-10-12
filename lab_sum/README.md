# Sumador con acarreo previo

Según los visto en clase vimos que se podría hacer un sumador de cuantos bits se quisiera, y el laboratorio pasado se realizó el decodificador de un número de 4 bits, pudiendo sumas de valores máximos de 15, para esto se realizó el paso a paso de como se calcula el sumador.

1. Para empezar la tabla de verdad de lo que necesitamos, dos entradas de un bit (A y B) y el acarreo (C), si es el primer \notsumador pues queda en ceros pero para los demás nos importa bastante el valor de este acarreo, las salidas que se requieren son; un dígito del número a sumar (S) y el acarreo para la siguiente suma (Cout).
<center>
  <img src="img/sum_verdad.png" height="50%" width="50%" >
</center>

2.Luego para cada salida se hizo el mapa de karnaugh:
<center>
  <img src="img/sum_k.png" height="30%" width="30%" >
</center>
- Este mapa es para la salida del digito de suma, con esto podemos obtener la expresión:
$`C_{out} = BC_{in}+ AC_{in}+AB`$
<center>
  <img src="img/carry_k.png" height="30%" width="30%" >
</center>


# esquematicos del sumador
<center>
  <img src="img/sum_sch.png" height="30%" width="30%" >
</center>
# se puede ver el 16 en binario en el led del carry out 
<center>
  <img src="img/sum16.png" height="30%" width="30%" >
</center>
