-- ============================================================================
-- GS MENU - Header + Gap + Content Menu with Tabs + Drag System + Multiple Tabs
-- Sistema de Toggles Funcional com Scripts Externos via Loadstring
-- ============================================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ============================================================================
-- CORES / COLORS
-- ============================================================================

local COLOR_BACKGROUND = Color3.fromRGB(10, 10, 10)
local COLOR_CONTENT_BG = Color3.fromRGB(35, 35, 35)
local COLOR_NEON_PURPLE = Color3.fromRGB(170, 0, 255)
local COLOR_WHITE = Color3.fromRGB(255, 255, 255)
local COLOR_GRAY = Color3.fromRGB(100, 100, 100)
local COLOR_BLACK = Color3.fromRGB(0, 0, 0)
local COLOR_TOGGLE_OFF = Color3.fromRGB(180, 180, 180)

-- ============================================================================
-- VARIÁVEIS DE ESTADO / STATE VARIABLES
-- ============================================================================

local selectedTab = "HOME"
local allTabs = {"HOME", "AIMBOT", "ESP", "CAR", "DESTRY"}

local tabContents = {
	HOME = {
		left = {"FLY", "NOCLIP", "SPEED", "FLING", "BREV"},
		right = {"BREV", "BREV", "BREV", "BREV", "BREV"}
	},
	AIMBOT = {
		left = {"AIMBOT", "FOV", "WALLCK", "FRIENDCK", "BREV"},
		right = {"BREV", "BREV", "BREV", "BREV", "BREV"}
	},
	ESP = {
		left = {"ESP NAME", "ESP TRACE", "ESP BOX", "ESP LIFE", "ESP HEAD"},
		right = {"ESP BAG", "ESP RAGE", "ESP STAFF", "BREV", "BREV"}
	},
	CAR = {
		left = {"ESP CAR", "FLY CAR", "NOCLIP", "BREV", "BREV"},
		right = {"BREV", "BREV", "BREV", "BREV", "BREV"}
	},
	DESTRY = {
		left = {"NOWALL", "PUXAR TODOS", "BREV", "BREV", "BREV"},
		right = {"BREV", "BREV", "BREV", "BREV", "BREV"}
	}
}

-- ============================================================================
-- SCRIPTS URLS COM LOADSTRING COMPLETO
-- ============================================================================

local SCRIPT_URLS = {
	-- HOME TAB
	FLY = {
		on = function() loadstring(game:HttpGetAsync("https://seu-raw-script.com/FLY_ON.lua"))() end,
		off = function() loadstring(game:HttpGetAsync("https://seu-raw-script.com/FLY_OFF.lua"))() end
	},
	NOCLIP = {
		on = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/NO%20CLIP%20On.lua"))() end,
		off = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/NOCLIP%20OFF.lua"))() end
	},
	SPEED = {
		on = function() loadstring(game:HttpGetAsync("https://seu-raw-script.com/SPEED_ON.lua"))() end,
		off = function() loadstring(game:HttpGetAsync("https://seu-raw-script.com/SPEED_OFF.lua"))() end
	},
	FLING = {
		on = function() loadstring(game:HttpGetAsync("https://seu-raw-script.com/FLING_ON.lua"))() end,
		off = function() loadstring(game:HttpGetAsync("https://seu-raw-script.com/FLING_OFF.lua"))() end
	},
	BREV = {
		on = function() print("[GS MENU] EM BREVE") end,
		off = function() print("[GS MENU] EM BREVE") end
	},
	
	-- AIMBOT TAB
	AIMBOT = {
		on = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/AIMLOCK.ON.lua"))() end,
		off = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/Aimlock.off.lua"))() end
	},
	FOV = {
		on = function() loadstring(game:HttpGetAsync("https://seu-raw-script.com/FOV_ON.lua"))() end,
		off = function() loadstring(game:HttpGetAsync("https://seu-raw-script.com/FOV_OFF.lua"))() end
	},
	WALLCK = {
		on = function() loadstring(game:HttpGetAsync("https://seu-raw-script.com/WALLCK_ON.lua"))() end,
		off = function() loadstring(game:HttpGetAsync("https://seu-raw-script.com/WALLCK_OFF.lua"))() end
	},
	FRIENDCK = {
		on = function() loadstring(game:HttpGetAsync("https://seu-raw-script.com/FRIENDCK_ON.lua"))() end,
		off = function() loadstring(game:HttpGetAsync("https://seu-raw-script.com/FRIENDCK_OFF.lua"))() end
	},
	
	-- ESP TAB
	["ESP NAME"] = {
		on = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20NAME%20ON.lua"))() end,
		off = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20NAME%20OFF.lua"))() end
	},
	["ESP TRACE"] = {
		on = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20TRACE%20ON.lua"))() end,
		off = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20TRACE%20OFF.lua"))() end
	},
	["ESP BOX"] = {
		on = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20BOX%20ON.lua"))() end,
		off = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20BOX%20OFF.lua"))() end
	},
	["ESP LIFE"] = {
		on = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20LIFE%20ON.lua"))() end,
		off = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20LIFE%20OFF.lua"))() end
	},
	["ESP HEAD"] = {
		on = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20HEAD%20ON.lua"))() end,
		off = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20HEAD%20OFF.lua"))() end
	},
	["ESP BAG"] = {
		on = function() loadstring(game:HttpGetAsync("https://seu-raw-script.com/ESP_BAG_ON.lua"))() end,
		off = function() loadstring(game:HttpGetAsync("https://seu-raw-script.com/ESP_BAG_OFF.lua"))() end
	},
	["ESP RAGE"] = {
		on = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20DIATANCIA%20ON.lua"))() end,
		off = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20DIATANCIA%20OFF.lua"))() end
	},
	["ESP STAFF"] = {
		on = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/Staff%20LIST%20ON.lua"))() end,
		off = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/STAFF%20LIST%20OFF.lua"))() end
	},
	-- CAR TAB
	["ESP CAR"] = {
		on = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20CAR%20ON.lua"))() end,
		off = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20CAR%20OFF.lua"))() end
	},
	["FLY CAR"] = {
		on = function() loadstring(game:HttpGetAsync("https://seu-raw-script.com/FLY_CAR_ON.lua"))() end,
		off = function() loadstring(game:HttpGetAsync("https://seu-raw-script.com/FLY_CAR_OFF.lua"))() end
	},
	
	-- DESTRY TAB
	NOWALL = {
		on = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/NO%20WALL%20ON.LUA"))() end,
		off = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/No%20wall%20off.lua"))() end
	}
}

local dragState = {
	isDragging = false,
	dragStart = nil,
	startPos = nil,
	dragInput = nil
}

-- ============================================================================
-- CRIAR SCREENGUI / CREATE SCREENGUI
-- ============================================================================

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GSMenuGUI"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

-- ============================================================================
-- CRIAR BARRA SUPERIOR / CREATE HEADER BAR
-- ============================================================================

local headerBar = Instance.new("Frame")
headerBar.Name = "HeaderBar"
headerBar.Size = UDim2.new(0.6, 0, 0, 20)
headerBar.Position = UDim2.new(0.2, 0, 0.16, 0)
headerBar.BackgroundColor3 = COLOR_BACKGROUND
headerBar.BorderSizePixel = 0
headerBar.Parent = screenGui

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0.2, 0)
headerCorner.Parent = headerBar

local headerStroke = Instance.new("UIStroke")
headerStroke.Color = COLOR_NEON_PURPLE
headerStroke.Thickness = 0.75
headerStroke.Transparency = 0
headerStroke.LineJoinMode = Enum.LineJoinMode.Round
headerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
headerStroke.Parent = headerBar

-- ============================================================================
-- CRIAR TEXTO "GS MENU" / CREATE "GS MENU" TEXT
-- ============================================================================

local titleText = Instance.new("TextLabel")
titleText.Name = "TitleText"
titleText.Text = "GS MENU"
titleText.TextColor3 = COLOR_WHITE
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 16
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.TextYAlignment = Enum.TextYAlignment.Center
titleText.BackgroundTransparency = 1
titleText.BorderSizePixel = 0
titleText.Size = UDim2.new(0.5, 0, 1, 0)
titleText.Position = UDim2.new(0.02, 0, 0, 0)
titleText.Parent = headerBar

-- ============================================================================
-- CRIAR TEXTO "[RP]" / CREATE "[RP]" TEXT
-- ============================================================================

local rpText = Instance.new("TextLabel")
rpText.Name = "RPText"
rpText.Text = "[RP]"
rpText.TextColor3 = COLOR_WHITE
rpText.Font = Enum.Font.GothamBold
rpText.TextSize = 10
rpText.TextXAlignment = Enum.TextXAlignment.Left
rpText.TextYAlignment = Enum.TextYAlignment.Center
rpText.BackgroundTransparency = 1
rpText.BorderSizePixel = 0
rpText.Size = UDim2.new(0.2, 0, 1, 0)
rpText.Position = UDim2.new(0.18, 0, 0, 0)
rpText.Parent = headerBar

-- ============================================================================
-- CRIAR ESPAÇO INVISÍVEL / CREATE INVISIBLE GAP
-- ============================================================================

local gapFrame = Instance.new("Frame")
gapFrame.Name = "TransparentGap"
gapFrame.Size = UDim2.new(0.6, 0, 0, 8)
gapFrame.Position = UDim2.new(0.2, 0, 0.16, 20)
gapFrame.BackgroundTransparency = 1
gapFrame.BorderSizePixel = 0
gapFrame.Parent = screenGui

-- ============================================================================
-- CRIAR MENU INFERIOR / CREATE BOTTOM MENU
-- ============================================================================

local contentMenu = Instance.new("Frame")
contentMenu.Name = "ContentMenu"
contentMenu.Size = UDim2.new(0.6, 0, 0.5, 0)
contentMenu.Position = UDim2.new(0.2, 0, 0.16, 28)
contentMenu.BackgroundColor3 = COLOR_BACKGROUND
contentMenu.BorderSizePixel = 0
contentMenu.Parent = screenGui

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 8)
contentCorner.Parent = contentMenu

local contentStroke = Instance.new("UIStroke")
contentStroke.Color = COLOR_NEON_PURPLE
contentStroke.Thickness = 0.75
contentStroke.Transparency = 0
contentStroke.LineJoinMode = Enum.LineJoinMode.Round
contentStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
contentStroke.Parent = contentMenu

-- ============================================================================
-- CRIAR CONTAINER DE ABAS / CREATE TABS CONTAINER
-- ============================================================================

local tabsContainer = Instance.new("Frame")
tabsContainer.Name = "TabsContainer"
tabsContainer.Size = UDim2.new(0.22, 0, 1, 0)
tabsContainer.Position = UDim2.new(0, 0, 0, 0)
tabsContainer.BackgroundTransparency = 1
tabsContainer.BorderSizePixel = 0
tabsContainer.Parent = contentMenu

-- ============================================================================
-- CRIAR LINHA DIVISÓRIA / CREATE DIVIDER LINE
-- ============================================================================

local dividerLine = Instance.new("Frame")
dividerLine.Name = "DividerLine"
dividerLine.Size = UDim2.new(0, 2, 0.85, 0)
dividerLine.Position = UDim2.new(0.19, 0, 0.075, 0)
dividerLine.BackgroundColor3 = COLOR_WHITE
dividerLine.BorderSizePixel = 0
dividerLine.BackgroundTransparency = 0.5
dividerLine.Parent = contentMenu

-- ============================================================================
-- CRIAR CONTAINER DE CONTEÚDO / CREATE CONTENT CONTAINER
-- ============================================================================

local contentContainer = Instance.new("Frame")
contentContainer.Name = "ContentContainer"
contentContainer.Size = UDim2.new(0.78, 0, 1, 0)
contentContainer.Position = UDim2.new(0.22, 0, 0, 0)
contentContainer.BackgroundTransparency = 1
contentContainer.BorderSizePixel = 0
contentContainer.Parent = contentMenu

-- ============================================================================
-- FUNÇÃO PARA EXECUTAR SCRIPTS / EXECUTE SCRIPTS
-- ============================================================================

local function executeScript(scriptFunc, featureName, isActivating)
	if scriptFunc == nil then
		print("[GS MENU] ⚠️ Função de script vazia para: " .. featureName)
		return
	end
	
	pcall(function()
		scriptFunc()
		local state = isActivating and "✓ ATIVADO" or "✓ DESATIVADO"
		print("[GS MENU] " .. featureName .. " " .. state)
	end)
end

-- ============================================================================
-- FUNÇÃO PARA CRIAR TOGGLE / FUNCTION TO CREATE TOGGLE
-- ============================================================================

local function createToggle(parent, name, yOffset)
	local toggleContainer = Instance.new("Frame")
	toggleContainer.Name = name .. "Container"
	toggleContainer.Size = UDim2.new(1, 0, 0, 26)
	toggleContainer.Position = UDim2.new(0, 0, 0, yOffset)
	toggleContainer.BackgroundTransparency = 1
	toggleContainer.BorderSizePixel = 0
	toggleContainer.Parent = parent

	-- Label do toggle / Toggle label
	local toggleLabel = Instance.new("TextLabel")
	toggleLabel.Name = name .. "Label"
	toggleLabel.Text = name
	toggleLabel.TextColor3 = COLOR_WHITE
	toggleLabel.Font = Enum.Font.GothamBold
	toggleLabel.TextSize = 13
	toggleLabel.BackgroundTransparency = 1
	toggleLabel.BorderSizePixel = 0
	toggleLabel.Size = UDim2.new(0.55, 0, 1, 0)
	toggleLabel.Position = UDim2.new(0, 0, 0, 0)
	toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
	toggleLabel.TextYAlignment = Enum.TextYAlignment.Center
	toggleLabel.Parent = toggleContainer

	-- Botão toggle / Toggle button
	local toggleButton = Instance.new("Frame")
	toggleButton.Name = name .. "Button"
	toggleButton.Size = UDim2.new(0, 42, 0, 20)
	toggleButton.Position = UDim2.new(0.5, 0, 0.25, 0)
	toggleButton.BackgroundColor3 = COLOR_TOGGLE_OFF
	toggleButton.BorderSizePixel = 0
	toggleButton.Parent = toggleContainer

	-- Rounded corners no botão / Rounded corners on button
	local toggleCorner = Instance.new("UICorner")
	toggleCorner.CornerRadius = UDim.new(0, 10)
	toggleCorner.Parent = toggleButton

	-- Círculo do toggle / Toggle circle
	local toggleCircle = Instance.new("Frame")
	toggleCircle.Name = name .. "Circle"
	toggleCircle.Size = UDim2.new(0, 16, 0, 16)
	toggleCircle.Position = UDim2.new(0, 2, 0.5, -8)
	toggleCircle.BackgroundColor3 = COLOR_WHITE
	toggleCircle.BorderSizePixel = 0
	toggleCircle.Parent = toggleButton

	-- Rounded corners no círculo / Rounded corners on circle
	local circleCorner = Instance.new("UICorner")
	circleCorner.CornerRadius = UDim.new(0, 8)
	circleCorner.Parent = toggleCircle

	-- Estado do toggle / Toggle state
	local isEnabled = false

	-- Função ao clicar / Click function
	local clickableButton = Instance.new("TextButton")
	clickableButton.Name = name .. "Clickable"
	clickableButton.Text = ""
	clickableButton.BackgroundTransparency = 1
	clickableButton.BorderSizePixel = 0
	clickableButton.Size = UDim2.new(0.5, 0, 1, 0)
	clickableButton.Position = UDim2.new(0.5, 0, 0, 0)
	clickableButton.Parent = toggleContainer

	clickableButton.MouseButton1Click:Connect(function()
		isEnabled = not isEnabled
		
		if isEnabled then
			toggleButton.BackgroundColor3 = COLOR_NEON_PURPLE
			toggleCircle.Position = UDim2.new(0, 24, 0.5, -8)
			-- Executar script de ativação
			if SCRIPT_URLS[name] then
				executeScript(SCRIPT_URLS[name].on, name, true)
			end
		else
			toggleButton.BackgroundColor3 = COLOR_TOGGLE_OFF
			toggleCircle.Position = UDim2.new(0, 2, 0.5, -8)
			-- Executar script de desativação
			if SCRIPT_URLS[name] then
				executeScript(SCRIPT_URLS[name].off, name, false)
			end
		end
		
		print("[GS MENU] " .. name .. " - Estado: " .. tostring(isEnabled))
	end)

	return toggleContainer
end

-- ============================================================================
-- FUNÇÃO PARA CRIAR TAB CONTENT / FUNCTION TO CREATE TAB CONTENT
-- ============================================================================

local function createTabContent(tabName)
	local tabContent = Instance.new("Frame")
	tabContent.Name = tabName .. "TabContent"
	tabContent.Size = UDim2.new(1, 0, 1, 0)
	tabContent.Position = UDim2.new(0, 0, 0, 0)
	tabContent.BackgroundTransparency = 1
	tabContent.BorderSizePixel = 0
	tabContent.Visible = (tabName == "HOME")
	tabContent.Parent = contentContainer

	-- ============================================================================
	-- CRIAR WRAPPER PARA CONTEÚDO / CREATE WRAPPER FOR CONTENT
	-- ============================================================================

	local contentWrapper = Instance.new("Frame")
	contentWrapper.Name = "ContentWrapper"
	contentWrapper.Size = UDim2.new(0.97, 0, 0.9, 0)
	contentWrapper.Position = UDim2.new(0.015, 0, 0.05, 0)
	contentWrapper.BackgroundColor3 = COLOR_CONTENT_BG
	contentWrapper.BorderSizePixel = 0
	contentWrapper.Parent = tabContent

	-- Rounded corners no wrapper / Rounded corners on wrapper
	local wrapperCorner = Instance.new("UICorner")
	wrapperCorner.CornerRadius = UDim.new(0, 8)
	wrapperCorner.Parent = contentWrapper

	-- Border no wrapper / Border on wrapper
	local wrapperStroke = Instance.new("UIStroke")
	wrapperStroke.Color = COLOR_NEON_PURPLE
	wrapperStroke.Thickness = 1
	wrapperStroke.Transparency = 0.3
	wrapperStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	wrapperStroke.Parent = contentWrapper

	-- ============================================================================
	-- CRIAR COLUNA ESQUERDA / CREATE LEFT COLUMN
	-- ============================================================================

	local leftColumn = Instance.new("Frame")
	leftColumn.Name = "LeftColumn"
	leftColumn.Size = UDim2.new(0.5, 0, 1, 0)
	leftColumn.Position = UDim2.new(0, 0, 0, 0)
	leftColumn.BackgroundTransparency = 1
	leftColumn.BorderSizePixel = 0
	leftColumn.Parent = contentWrapper

	-- Adicionar padding / Add padding
	local leftPadding = Instance.new("UIPadding")
	leftPadding.PaddingTop = UDim.new(0, 12)
	leftPadding.PaddingBottom = UDim.new(0, 12)
	leftPadding.PaddingLeft = UDim.new(0, 12)
	leftPadding.PaddingRight = UDim.new(0, 6)
	leftPadding.Parent = leftColumn

	-- ============================================================================
	-- CRIAR COLUNA DIREITA / CREATE RIGHT COLUMN
	-- ============================================================================

	local rightColumn = Instance.new("Frame")
	rightColumn.Name = "RightColumn"
	rightColumn.Size = UDim2.new(0.5, 0, 1, 0)
	rightColumn.Position = UDim2.new(0.5, 0, 0, 0)
	rightColumn.BackgroundTransparency = 1
	rightColumn.BorderSizePixel = 0
	rightColumn.Parent = contentWrapper

	-- Adicionar padding / Add padding
	local rightPadding = Instance.new("UIPadding")
	rightPadding.PaddingTop = UDim.new(0, 12)
	rightPadding.PaddingBottom = UDim.new(0, 12)
	rightPadding.PaddingLeft = UDim.new(0, 6)
	rightPadding.PaddingRight = UDim.new(0, 12)
	rightPadding.Parent = rightColumn

	-- ============================================================================
	-- CRIAR DIVISOR VERTICAL / CREATE VERTICAL DIVIDER
	-- ============================================================================

	local verticalDivider = Instance.new("Frame")
	verticalDivider.Name = "VerticalDivider"
	verticalDivider.Size = UDim2.new(0, 2, 0.9, 0)
	verticalDivider.Position = UDim2.new(0.5, 0, 0.05, 0)
	verticalDivider.BackgroundColor3 = COLOR_WHITE
	verticalDivider.BorderSizePixel = 0
	verticalDivider.BackgroundTransparency = 0.5
	verticalDivider.Parent = contentWrapper

	-- ============================================================================
	-- CRIAR TOGGLES / CREATE TOGGLES
	-- ============================================================================

	local tabData = tabContents[tabName]
	if tabData then
		for index, toggleName in ipairs(tabData.left) do
			createToggle(leftColumn, toggleName, (index - 1) * 30)
		end

		for index, toggleName in ipairs(tabData.right) do
			createToggle(rightColumn, toggleName, (index - 1) * 30)
		end
	end

	return tabContent
end

-- ============================================================================
-- CRIAR TODOS OS TAB CONTENTS / CREATE ALL TAB CONTENTS
-- ============================================================================

local tabContentFrames = {}
for _, tabName in ipairs(allTabs) do
	tabContentFrames[tabName] = createTabContent(tabName)
end

-- ============================================================================
-- DICIONÁRIO DE REFERÊNCIAS DAS ABAS / TABS REFERENCE DICTIONARY
-- ============================================================================

local tabReferences = {}

-- ============================================================================
-- FUNÇÃO PARA CRIAR ABA / FUNCTION TO CREATE TAB
-- ============================================================================

local function createTab(tabName, index)
	local yOffset = (index - 1) * 32
	
	-- Container principal da aba / Tab main container
	local tabFrame = Instance.new("Frame")
	tabFrame.Name = tabName .. "TabFrame"
	tabFrame.Size = UDim2.new(1, 0, 0, 28)
	tabFrame.Position = UDim2.new(0, 0, 0, yOffset)
	tabFrame.BackgroundTransparency = 1
	tabFrame.BorderSizePixel = 0
	tabFrame.Parent = tabsContainer
	
	-- TextButton clicável / Clickable TextButton
	local tabButton = Instance.new("TextButton")
	tabButton.Name = tabName .. "Button"
	tabButton.Text = tabName
	tabButton.TextColor3 = COLOR_WHITE
	tabButton.Font = Enum.Font.GothamBold
	tabButton.TextSize = 18
	tabButton.BackgroundTransparency = 1
	tabButton.BorderSizePixel = 0
	tabButton.Size = UDim2.new(0.85, 0, 1, 0)
	tabButton.Position = UDim2.new(0.08, 0, 0, 0)
	tabButton.TextXAlignment = Enum.TextXAlignment.Left
	tabButton.TextYAlignment = Enum.TextYAlignment.Center
	tabButton.Parent = tabFrame
	
	-- Traço roxo indicador / Purple indicator
	local indicator = Instance.new("Frame")
	indicator.Name = tabName .. "Indicator"
	indicator.Size = UDim2.new(0, 3, 0.6, 0)
	indicator.Position = UDim2.new(0, 0, 0.2, 0)
	indicator.BackgroundColor3 = COLOR_NEON_PURPLE
	indicator.BorderSizePixel = 0
	indicator.Visible = (tabName == "HOME")
	indicator.Parent = tabFrame
	
	-- Guardar referência / Store reference
	tabReferences[tabName] = {
		button = tabButton,
		indicator = indicator,
		frame = tabFrame
	}
	
	-- Evento ao clicar / Click event
	tabButton.MouseButton1Click:Connect(function()
		selectedTab = tabName
		
		-- Esconder todos os indicadores e conteúdos / Hide all indicators and contents
		for tabNameKey, tabRef in pairs(tabReferences) do
			tabRef.indicator.Visible = false
			if tabContentFrames[tabNameKey] then
				tabContentFrames[tabNameKey].Visible = false
			end
		end
		
		-- Mostrar indicador e conteúdo selecionado / Show selected indicator and content
		indicator.Visible = true
		if tabContentFrames[tabName] then
			tabContentFrames[tabName].Visible = true
		end
		
		print("[GS MENU] Aba selecionada: " .. tabName)
	end)
end

-- ============================================================================
-- CRIAR TODAS AS ABAS / CREATE ALL TABS
-- ============================================================================

for index, tabName in ipairs(allTabs) do
	createTab(tabName, index)
end

-- ============================================================================
-- SISTEMA DE ARRASTE / DRAG SYSTEM
-- ============================================================================

-- Iniciar arraste ao pressionar na barra / Start drag on header press
headerBar.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragState.isDragging = true
		dragState.dragStart = input.Position
		dragState.startPos = headerBar.Position
		
		-- Conectar ao movimento / Connect to input movement
		dragState.dragInput = input.Changed:Connect(function()
			if dragState.isDragging then
				local delta = input.Position - dragState.dragStart
				headerBar.Position = dragState.startPos + UDim2.new(0, delta.X, 0, delta.Y)
				contentMenu.Position = dragState.startPos + UDim2.new(0, delta.X, 0, delta.Y + 28)
				gapFrame.Position = dragState.startPos + UDim2.new(0, delta.X, 0, delta.Y + 20)
			end
		end)
	end
end)

-- Parar arraste / Stop drag
UserInputService.InputEnded:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		if dragState.isDragging then
			dragState.isDragging = false
			if dragState.dragInput then
				dragState.dragInput:Disconnect()
				dragState.dragInput = nil
			end
		end
	end
end)

-- ============================================================================
-- PRINT DE CONFIRMAÇÃO / CONFIRMATION PRINT
-- ============================================================================

print("[GS MENU] ✓ Menu inicializado com sucesso!")
print("[GS MENU] ✓ Sistema de Loadstring completo ativado!")
print("[GS MENU] ✓ Pronto para executar scripts!")
