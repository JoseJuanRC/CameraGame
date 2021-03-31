# Juego con cámara

Este proyecto tiene como objetivo desarrollar un juego con el que puedas interactuar usando la cabeza.

## Características del juego

- Rebotes 
    - Con el margen superior, derecho e izquierdo
- Movimiento
    - Se usará el movimiento de la cabeza para mover la plataforma con la que se golpea a la bola
- Se puede definir el nivel de difuminado de la cámara
- Tipos de sonidos:
    - Al rebotar
    - Al conseguir puntos
    - Al ganar
    - Al perder
- El movimiento inicial será aleatorio
- Victoria:
    - El jugador perderá si la bola toca el margen inferior
    - El jugador ganará si se eliminan todos los rectángulos

## Decisiones
###### Cámara
- En el caso de que no se encuentre disponible volveremos a intentar acceder a ella un determinado número de veces más.

###### Movimiento Inicial
- Será aleatorio:
    - Eje horizontal: En cualquier dirección
    - Eje vertical: Inicialmente hacia el jugador

###### Jugador
- Su posición es definida por la cabeza del usuario
- Una vez se defina una posición de la cabeza esta perdurará los siguientes frames en el caso de que no se vuelva a encontrar la cabeza
- La cabeza no será detectada si se encuentra muy lejos
- Cuanta mejor iluminación mejor se detectará

###### Bola
- La bola se inicial a mover en el centro de la pantalla, moviéndose en una dirección aleatoria
- La bola irá aumentando la velocidad en el eje Y

###### Colisión Bola con jugador
1. Calculamos el lado más cercano a la bola
2. Calculamos la distancia entre ese lado y el centro de la bola
3. Si la distancia es menor al radio significa que existe colisión
4. Calculamos la siguiente dirección de la bola según diferentes condiciones:
    - Si el centro de la bola se encuentra a la derecha del 65% de la superficie del jugador la bola irá para la derecha
    - Si el centro se encuentra a la izquierda del 35% de la superficie del jugador la bola irá para la izquierda
    - Si el centro se encuentra en el centro la bola solo se moverá verticalmente.

###### Rectángulos
- Se eliminan siempre que detecten una bola
- Si quedan 0 se gana la partida


###### Input
- Utilizamos r/R para resetear
- Utilizamos ↑/↓ para cambiar el nivel de difuminado
- Posición de la cabeza para mover la plataforma de golpeo


## Resultado final
A continuación se ve un ejemplo del juego:

![](resultado_6.gif)

## Sonidos utilizados
- [Rebote](https://www.youtube.com/watch?v=o8YIN11w0wA&ab_channel=Sonidos%26EfectosHD)
- [Al marcar](https://www.youtube.com/watch?v=y9rRD5yZqjE&list=PLuE1RIpYgk-UmLN1jS4Y9AZr_0FjujtfK&index=17&ab_channel=GFXSounds)
- [Victoria](https://www.youtube.com/watch?v=xP1b_uRx5x4&ab_channel=DragRacingMarinaDangs7)
- [Derrota](https://www.youtube.com/watch?v=_asNhzXq72w&ab_channel=GamingSoundFX)

## Herramientas utilizadas
- [Processing](https://processing.org/)
- [Descargar sonidos](https://yt1s.com/)
- [Cortar sonidos](https://mp3cut.net/es/)
- [Editar el readme.md](https://dillinger.io/)

Realizado por [José Juan Reyes Cabrera](https://github.com/JoseJuanRC)
