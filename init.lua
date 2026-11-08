if game:GetService("CoreGui"):FindFirstChild("CyberDrachunhub") then
    game:GetService("CoreGui"):FindFirstChild("CyberDrachunhub"):Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "CyberDrachunhub"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

-- Главное меню (Цвет и закругления оригинального Pulse Hub)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.fromOffset(580, 350)
mainFrame.Position = UDim2.new(0.5, -290, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(24, 20, 18)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 14)
mainCorner.Parent = mainFrame

-- Левая панель вкладок
local leftPanel = Instance.new("Frame")
leftPanel.Name = "LeftPanel"
leftPanel.Size = UDim2.new(0, 150, 1, 0)
leftPanel.BackgroundColor3 = Color3.fromRGB(18, 15, 14)
leftPanel.BorderSizePixel = 0
leftPanel.Parent = mainFrame

local leftCorner = Instance.new("UICorner")
leftCorner.CornerRadius = UDim.new(0, 14)
leftCorner.Parent = leftPanel

local hubTitle = Instance.new("TextLabel")
hubTitle.Size = UDim2.new(1, 0, 0, 35)
hubTitle.Position = UDim2.new(0, 0, 0, 10)
hubTitle.BackgroundTransparency = 1
hubTitle.Text = "CyberDrachun"
hubTitle.TextColor3 = Color3.fromRGB(255, 120, 50)
hubTitle.TextSize = 18
hubTitle.Font = Enum.Font.SourceSansBold
hubTitle.Parent = leftPanel

local hubSubtitle = Instance.new("TextLabel")
hubSubtitle.Size = UDim2.new(1, 0, 0, 15)
hubSubtitle.Position = UDim2.new(0, 0, 0, 35)
hubSubtitle.BackgroundTransparency = 1
hubSubtitle.Text = "Murder Mystery 2"
hubSubtitle.TextColor3 = Color3.fromRGB(120, 110, 105)
hubSubtitle.TextSize = 11
hubSubtitle.Font = Enum.Font.SourceSans
hubSubtitle.Parent = leftPanel

local tabsScroll = Instance.new("ScrollingFrame")
tabsScroll.Size = UDim2.new(1, -10, 1, -65)
tabsScroll.Position = UDim2.new(0, 5, 0, 60)
tabsScroll.BackgroundTransparency = 1
tabsScroll.BorderSizePixel = 0
tabsScroll.ScrollBarThickness = 0
tabsScroll.Parent = leftPanel

local tabsLayout = Instance.new("UIListLayout")
tabsLayout.Parent = tabsScroll
tabsLayout.Padding = UDim.new(0, 4)

-- Верхняя панель
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, -150, 0, 50)
topBar.Position = UDim2.new(0, 150, 0, 0)
topBar.BackgroundTransparency = 1
topBar.Parent = mainFrame

local activeTabTitle = Instance.new("TextLabel")
activeTabTitle.Position = UDim2.new(0, 20, 0, 12)
activeTabTitle.Size = UDim2.new(0, 200, 0, 25)
activeTabTitle.BackgroundTransparency = 1
activeTabTitle.Text = "Убийца"
activeTabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
activeTabTitle.TextSize = 20
activeTabTitle.Font = Enum.Font.SourceSansBold
activeTabTitle.TextXAlignment = Enum.TextXAlignment.Left
activeTabTitle.Parent = topBar

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.fromOffset(24, 24)
closeButton.Position = UDim2.new(1, -34, 0, 14)
closeButton.BackgroundColor3 = Color3.fromRGB(40, 34, 30)
closeButton.Text = "×"
closeButton.TextColor3 = Color3.fromRGB(180, 180, 180)
closeButton.TextSize = 18
closeButton.Font = Enum.Font.SourceSansBold
closeButton.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 12)
closeCorner.Parent = closeButton
closeButton.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Основной контейнер контента справа
local contentArea = Instance.new("Frame")
contentArea.Name = "ContentArea"
contentArea.Size = UDim2.new(1, -170, 1, -65)
contentArea.Position = UDim2.new(0, 160, 0, 55)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainFrame

-- ФУНКЦИИ ГЕНЕРАЦИИ БЛОКОВ
local currentPages = {}

local function createPage(tabName)
    local page = Instance.new("ScrollingFrame")
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 3
    page.ScrollBarImageColor3 = Color3.fromRGB(255, 120, 50)
    page.Visible = false
    page.Parent = contentArea
    
    local layout = Instance.new("UIGridLayout")
    layout.Parent = page
    layout.CellSize = UDim2.new(0.48, 0, 0, 130)
    layout.CellPadding = UDim2.new(0.04, 0, 0, 12)
    
    currentPages[tabName] = page
    return page
end

local function createCard(page, titleText)
    local card = Instance.new("Frame")
    card.BackgroundColor3 = Color3.fromRGB(32, 26, 24)
    card.BorderSizePixel = 0
    card.Parent = page
    
    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 10)
    cardCorner.Parent = card
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -10, 0, 25)
    title.Position = UDim2.new(0, 10, 0, 5)
    title.BackgroundTransparency = 1
    title.Text = titleText
    title.TextColor3 = Color3.fromRGB(230, 220, 215)
    title.TextSize = 13
    title.Font = Enum.Font.SourceSansBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = card
    
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 1, -30)
    container.Position = UDim2.new(0, 0, 0, 30)
    container.BackgroundTransparency = 1
    container.Parent = card
    
    local listLayout = Instance.new("UIListLayout")
    listLayout.Parent = container
    listLayout.Padding = UDim.new(0, 4)
    
    return container
end

local function addToggle(cardContainer, text, defaultState)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 28)
    row.BackgroundTransparency = 1
    row.Parent = cardContainer
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(170, 160, 155)
    label.TextSize = 12
    label.Font = Enum.Font.SourceSans
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = row
    
    local switch = Instance.new("TextButton")
    switch.Size = UDim2.fromOffset(36, 18)
    switch.Position = UDim2.new(1, -46, 0.5, -9)
    switch.BackgroundColor3 = defaultState and Color3.fromRGB(255, 120, 50) or Color3.fromRGB(50, 42, 38)
    switch.Text = ""
    switch.Parent = row
    
    local swCorner = Instance.new("UICorner")
    swCorner.CornerRadius = UDim.new(1, 0)
    swCorner.Parent = switch
    
    local circle = Instance.new("Frame")
    circle.Size = UDim2.fromOffset(14, 14)
    circle.Position = defaultState and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
    circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    circle.BorderSizePixel = 0
    circle.Parent = switch
    
    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(1, 0)
    circleCorner.Parent = circle
    
    local active = defaultState
    switch.MouseButton1Click:Connect(function()
        active = not active
        if active then
            switch.BackgroundColor3 = Color3.fromRGB(255, 120, 50)
            circle.Position = UDim2.new(1, -16, 0.5, -7)
        else
            switch.BackgroundColor3 = Color3.fromRGB(50, 42, 38)
            circle.Position = UDim2.new(0, 2, 0.5, -7)
        end
    end)
end

-- НАПОЛНЕНИЕ СТРУКТУРЫ СТРАНИЦ
local pageMurder = createPage("Убийца")
local cKillAura = createCard(pageMurder, "Аура убийства")
addToggle(cKillAura, "Аура убийства", false)
addToggle(cKillAura, "Убить всех", false)

local pageSheriff = createPage("Шериф")
local cAimbot = createCard(pageSheriff, "Аимбот")
addToggle(cAimbot, "Показывать круг FOV", true)
addToggle(cAimbot, "Сайлент аим", false)

local pagePlayer = createPage("Игрок")
local cSpeed = createCard(pagePlayer, "Скорость и прыжок")
addToggle(cSpeed, "Бесконечные прыжки", false)
addToggle(cSpeed, "Полет", false)

local pageVisual = createPage("Визуал")
local cEsp = createCard(pageVisual, "Метки")
addToggle(cEsp, "Включить ESP", false)
addToggle(cEsp, "Убийца", false)
addToggle(cEsp, "Шериф", false)

-- Функция сборки левых вкладок меню
local function createMenuTab(name)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundTransparency = 1
    btn.Text = "   " .. name
    btn.TextColor3 = Color3.fromRGB(150, 140, 135)
    btn.TextSize = 14
    btn.Font = Enum.Font.SourceSansBold
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = tabsScroll

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        activeTabTitle.Text = name
        for tName, page in pairs(currentPages) do
            page.Visible = (tName == name)
        end
        for _, child in ipairs(tabsScroll:GetChildren()) do
            if child:IsA("TextButton") then
                child.BackgroundTransparency = 1
                child.TextColor3 = Color3.fromRGB(150, 140, 135)
            end
        end
        btn.BackgroundTransparency = 0
        btn.BackgroundColor3 = Color3.fromRGB(36, 30, 28)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
end

local tabs = {"Убийца", "Шериф", "Игрок", "Визуал", "Телепорт", "Фарм", "Тролл", "Анимации", "Музыка", "Чат", "Pulse юзеры", "Телефон", "Настройки"}
for _, name in ipairs(tabs) do
    createMenuTab(name)
end

if currentPages["Убийца"] then currentPages["Убийца"].Visible = true end
