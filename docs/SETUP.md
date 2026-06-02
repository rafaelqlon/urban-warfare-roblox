# 🛠️ Instrucciones de Instalación - Urban Warfare

## Paso 1: Preparar Roblox Studio

1. Abre **Roblox Studio**
2. Ve a **File → New → Baseplate**
3. Se abrirá un mapa básico con un terreno

## Paso 2: Crear la estructura de Scripts

1. En el panel izquierdo, busca **ServerScriptService**
2. Haz clic derecho → **Insert Object → Folder**
3. Nombra la carpeta: **GameScripts**

## Paso 3: Copiar el script de Constantes

1. En la carpeta **GameScripts**, haz clic derecho → **Insert Object → ModuleScript**
2. Nombra el script: **Constants**
3. **Borra todo** lo que hay adentro
4. Copia Y PEGA el código de `src/shared/constants.lua`
5. Presiona **Ctrl + S** para guardar

## Paso 4: Copiar el script del Gestor del Juego

1. En **ServerScriptService**, haz clic derecho → **Insert Object → Script**
2. Nombra el script: **GameManager**
3. **Borra todo** lo que hay adentro
4. Copia Y PEGA el código de `src/server/gameManager.lua`
5. Guarda con **Ctrl + S**

## Paso 5: Crear puntos de Spawn en el mapa

1. Haz clic derecho en el mapa → **Insert Object → Part**
2. Nombra: **SpawnPoint1**
3. En Properties, cambia **Position** a: X=10, Y=5, Z=10
4. Hazlo pequeño (Size: 1, 1, 1)

5. Repite el proceso para más puntos:
   - **SpawnPoint2**: X=-10, Y=5, Z=10
   - **SpawnPoint3**: X=10, Y=5, Z=-10
   - **SpawnPoint4**: X=-10, Y=5, Z=-10
   - **SpawnPoint5**: X=0, Y=5, Z=0

## Paso 6: Prueba del juego

1. Presiona el botón ▶️ **Play** en la parte superior
2. Abre la **Consola de Salida** (**View → Output**)
3. Deberías ver mensajes como "[✓ GAME] Urban Warfare iniciado!"

## ✅ Checklist

- [ ] Roblox Studio abierto con mapa base
- [ ] Carpeta GameScripts creada
- [ ] Script Constants copiado
- [ ] Script GameManager copiado
- [ ] 5 Spawn Points creados
- [ ] El juego inicia sin errores en la consola

## 🔧 Próximos pasos

Una vez que todo funcione, agregaremos:
- Sistema de armas
- Tienda
- Sistema de daño
- Interfaz del jugador (GUI)

¡Avísame cuando tengas los scripts listos!
