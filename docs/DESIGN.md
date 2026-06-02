# 📐 Documento de Diseño - Urban Warfare

## Mecánicas Principales

### 1. Sistema de Spawn
- Los jugadores aparecen en puntos aleatorios del mapa
- 3-5 segundos de invulnerabilidad inicial

### 2. Sistema de Combate
- Arma básica: Pistola
- Daño: 25 HP por disparo
- Salud del jugador: 100 HP
- 4 disparos = 1 eliminación

### 3. Sistema Económico
- Baja básica = $100
- Con evento "Doble dinero" = $200
- Tienda con 3 armas:
  - Pistola: $0 (gratis al empezar)
  - Rifle: $500
  - Escopeta: $750

### 4. Tabla de Clasificación
- Muestra Top 5 jugadores
- Ordenados por número de eliminaciones
- Se actualiza en tiempo real

### 5. Sistema de Eventos
- Cada 5 minutos: evento aleatorio
- Duración: 2 minutos
- Se anuncian a todos los jugadores

## Flujo de Juego

1. Jugador entra → Aparece en el mapa
2. Elimina a otros → Gana dinero
3. Abre la tienda → Compra armas
4. Cada 5 min → Evento aleatorio
5. El que más eliminaciones tenga → Gana la ronda

## Variables Principales

```lua
-- Jugador
playerMoney = 0
playerKills = 0
playerDeaths = 0
playerWeapon = "Pistol"
playerHealth = 100

-- Juego
eventActive = false
currentEvent = nil
gameTime = 0
```
