-- 🎮 URBAN WARFARE - Constantes del Juego
-- Este es un ModuleScript que contiene todas las configuraciones del juego

local Constants = {}

-- ⚔️ ARMAS
Constants.WEAPONS = {
	Pistol = {
		name = "Pistola",
		damage = 25,
		price = 0,
		fireRate = 0.1
	},
	Rifle = {
		name = "Rifle",
		damage = 35,
		price = 500,
		fireRate = 0.15
	},
	Shotgun = {
		name = "Escopeta",
		damage = 50,
		price = 750,
		fireRate = 0.25
	}
}

-- 💰 DINERO Y ECONOMIA
Constants.MONEY = {
	killReward = 100,
	killRewardDouble = 200
}

-- ❤️ SALUD
Constants.HEALTH = {
	playerMaxHealth = 100,
	spawnInvulnerability = 3 -- segundos
}

-- 🎲 EVENTOS ALEATORIOS
Constants.EVENTS = {
	"InfiniteAmmo",
	"DoubleMoney",
	"PistolsOnly",
	"LowGravity",
	"Fog",
	"HighSpeed"
}

Constants.EVENT_DURATION = 120 -- 2 minutos
Constants.EVENT_INTERVAL = 300 -- 5 minutos

-- 📝 NOMBRES DE EVENTOS AMIGABLES
Constants.EVENT_EFFECTS = {
	InfiniteAmmo = "⚡ Munición Infinita",
	DoubleMoney = "💰 Doble Dinero",
	PistolsOnly = "🔫 Solo Pistolas",
	LowGravity = "🌙 Baja Gravedad",
	Fog = "🌫️ Niebla",
	HighSpeed = "⚡ Velocidad Máxima"
}

return Constants
