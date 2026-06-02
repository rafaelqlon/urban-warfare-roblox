-- 🎮 URBAN WARFARE - Gestor Principal del Juego
-- Este script va en ServerScriptService como Script (no LocalScript)
-- Requiere que Constants esté en ServerScriptService > GameScripts > Constants

local ServerScriptService = game:GetService("ServerScriptService")
local GameScripts = ServerScriptService:WaitForChild("GameScripts")
local Constants = require(GameScripts:WaitForChild("Constants"))

local Players = game.Players
local playerStats = {}
local currentEvent = nil
local eventActive = false

-- 📊 INICIALIZAR ESTADÍSTICAS DEL JUGADOR
local function initializePlayer(player)
	playerStats[player.UserId] = {
		kills = 0,
		deaths = 0,
		money = 0,
		weapon = "Pistol",
		health = Constants.HEALTH.playerMaxHealth,
	}
	print("[✓ GAME] " .. player.Name .. " se unió al juego")
	print("[✓ STATS] Kills: 0 | Dinero: $0")
end

-- 🗑️ LIMPIAR AL SALIR
local function cleanupPlayer(player)
	if playerStats[player.UserId] then
		print("[✗ GAME] " .. player.Name .. " abandonó el juego")
		print("[✗ STATS] Final - Kills: " .. playerStats[player.UserId].kills .. " | Dinero: $" .. playerStats[player.UserId].money)
		playerStats[player.UserId] = nil
	end
end

-- 🎲 SELECCIONAR EVENTO ALEATORIO
local function selectRandomEvent()
	local events = Constants.EVENTS
	local randomIndex = math.random(1, #events)
	return events[randomIndex]
end

-- 🎬 ACTIVAR EVENTO
local function startEvent()
	currentEvent = selectRandomEvent()
	eventActive = true
	
	local eventName = Constants.EVENT_EFFECTS[currentEvent] or currentEvent
	print("[🎲 EVENTO] " .. eventName .. " - Activo por 2 minutos!")
	
	-- Aplicar efectos según el evento
	if currentEvent == "LowGravity" then
		workspace.Gravity = 15 -- Reducir gravedad (por defecto 196.2)
		print("[🎲 EVENTO] Gravedad reducida a 15")
		
	elseif currentEvent == "Fog" then
		local terrain = workspace.Terrain
		terrain.Fog = Instance.new("Fog")
		terrain.Fog.Start = 10
		terrain.Fog.End = 50
		print("[🎲 EVENTO] Niebla aplicada al mapa")
		
	elseif currentEvent == "HighSpeed" then
		print("[🎲 EVENTO] Velocidad aumentada para todos")
		
	elseif currentEvent == "DoubleMoney" then
		print("[🎲 EVENTO] Dinero duplicado por kills")
		
	elseif currentEvent == "PistolsOnly" then
		print("[🎲 EVENTO] Solo pistolas permitidas")
		
	elseif currentEvent == "InfiniteAmmo" then
		print("[🎲 EVENTO] Munición infinita activada")
	end
	
	-- Esperar a que termine el evento
	wait(Constants.EVENT_DURATION)
	
	-- Terminar evento
	endEvent()
end

-- 🎬 TERMINAR EVENTO
local function endEvent()
	if currentEvent then
		print("[🎲 EVENTO] " .. Constants.EVENT_EFFECTS[currentEvent] .. " - ¡Terminado!")
	end
	
	eventActive = false
	
	-- Restaurar valores por defecto
	workspace.Gravity = 196.2
	local terrain = workspace.Terrain
	if terrain.Fog then
		terrain.Fog:Destroy()
	end
	
	currentEvent = nil
end

-- 💰 DAR DINERO POR KILL
local function giveKillReward(player)
	if playerStats[player.UserId] then
		local reward = Constants.MONEY.killReward
		
		-- Si "Doble dinero" está activo
		if currentEvent == "DoubleMoney" and eventActive then
			reward = Constants.MONEY.killRewardDouble
		end
		
		playerStats[player.UserId].money = playerStats[player.UserId].money + reward
		playerStats[player.UserId].kills = playerStats[player.UserId].kills + 1
		
		print("[💰 KILL] " .. player.Name .. " eliminó a un jugador! +$" .. reward)
		print("[📊 STATS] " .. player.Name .. " - Kills: " .. playerStats[player.UserId].kills .. " | Dinero: $" .. playerStats[player.UserId].money)
	end
end

-- 🎯 LOOP DE EVENTOS (cada 5 minutos)
local function eventLoop()
	print("[⏰ LOOP] Sistema de eventos iniciado")
	while true do
		wait(Constants.EVENT_INTERVAL)
		if #Players:GetPlayers() > 0 then
			startEvent()
		end
	end
end

-- 📊 MOSTRAR TABLA DE CLASIFICACIÓN
local function printLeaderboard()
	local sortedPlayers = {}
	
	for userId, stats in pairs(playerStats) do
		table.insert(sortedPlayers, {userId = userId, stats = stats})
	end
	
	table.sort(sortedPlayers, function(a, b)
		return a.stats.kills > b.stats.kills
	end)
	
	print("\n" .. string.rep("=", 50))
	print("📊 TABLA DE CLASIFICACIÓN")
	print(string.rep("=", 50))
	
	for i, data in ipairs(sortedPlayers) do
		if i <= 5 then
			local player = Players:GetPlayerByUserId(data.userId)
			local name = player and player.Name or "Desconocido"
			print(string.format("%d. %s - Kills: %d | Dinero: $%d", i, name, data.stats.kills, data.stats.money))
		end
	end
	
	print(string.rep("=", 50) .. "\n")
end

-- 👤 EVENTOS DE JUGADORES
Players.PlayerAdded:Connect(function(player)
	initializePlayer(player)
end)

Players.PlayerRemoving:Connect(function(player)
	cleanupPlayer(player)
end)

-- 🚀 INICIALIZAR JUEGO
print("\n" .. string.rep("=", 50))
print("🎮 URBAN WARFARE - SERVIDOR INICIADO")
print(string.rep("=", 50) .. "\n")
print("[✓] Sistema de juego activo")
print("[✓] Esperando jugadores...")
print("[✓] Eventos aleatorios cada 5 minutos\n")

-- Iniciar loop de eventos en un hilo separado
task.spawn(eventLoop)

-- Mostrar tabla de clasificación cada 30 segundos
task.spawn(function()
	while true do
		wait(30)
		if #Players:GetPlayers() > 0 then
			printLeaderboard()
		end
	end
end)

-- Exportar funciones para otros scripts
return {
	playerStats = playerStats,
	currentEvent = function() return currentEvent end,
	eventActive = function() return eventActive end,
	giveKillReward = giveKillReward
}
