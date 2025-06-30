
local plr = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local char = plr.Character or plr.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- GUI
local gui = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

-- Кнопка "Открыть"
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, 120, 0, 30)
openBtn.Position = UDim2.new(0, 10, 0.5, -15)
openBtn.Text = "ОТКРЫТЬ HUB"
openBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
openBtn.TextColor3 = Color3.new(1, 1, 1)
openBtn.Visible = true  -- по умолчанию видна, чтобы можно было открыть
openBtn.ZIndex = 2

-- Фрейм Хаба
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 320)
frame.Position = UDim2.new(0.3, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.Active = true
frame.Draggable = true
frame.Visible = false

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255, 0, 255)
stroke.Thickness = 2

-- Название
local sideTitle = Instance.new("TextLabel", frame)
sideTitle.Size = UDim2.new(1, 0, 0, 25)
sideTitle.Position = UDim2.new(0, 0, 0, 0)
sideTitle.BackgroundTransparency = 1
sideTitle.Text = "baganiy antiOder Scripters Hub☦️"
sideTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
sideTitle.Font = Enum.Font.GothamBold
sideTitle.TextScaled = true

-- Кнопка "Закрыть Хаб"
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0.4, 0, 0.1, 0)
closeBtn.Position = UDim2.new(0.3, 0, 0.9, 0)
closeBtn.Text = "ПРИКРЫТЬ ХАБ (ПОТОМ МОЖНО СНОВА ОТКРЫТЬ)"
closeBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextScaled = true

-- Кнопки управления

-- FLY
local flyBtn = Instance.new("TextButton", frame)
flyBtn.Size = UDim2.new(0.8, 0, 0.1, 0)
flyBtn.Position = UDim2.new(0.1, 0, 0.15, 0)
flyBtn.Text = "FLY"
flyBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
flyBtn.TextColor3 = Color3.new(1, 1, 1)
flyBtn.Font = Enum.Font.Gotham
flyBtn.TextScaled = true

-- NOCLIP
local noclipBtn = Instance.new("TextButton", frame)
noclipBtn.Size = UDim2.new(0.8, 0, 0.1, 0)
noclipBtn.Position = UDim2.new(0.1, 0, 0.3, 0)
noclipBtn.Text = "NOCLIP"
noclipBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
noclipBtn.TextColor3 = Color3.new(1, 1, 1)
noclipBtn.Font = Enum.Font.Gotham
noclipBtn.TextScaled = true

-- SPIN кнопка
local spinBtn = Instance.new("TextButton", frame)
spinBtn.Size = UDim2.new(0.4, 0, 0.1, 0)
spinBtn.Position = UDim2.new(0.3, 0, 0.45, 0)
spinBtn.Text = "SPIN"
spinBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
spinBtn.TextColor3 = Color3.new(1, 1, 1)
spinBtn.Font = Enum.Font.Gotham
spinBtn.TextScaled = true

-- Текст скорости вращения
local spinSpeedText = Instance.new("TextLabel", frame)
spinSpeedText.Size = UDim2.new(0.8, 0, 0.08, 0)
spinSpeedText.Position = UDim2.new(0.1, 0, 0.57, 0)
spinSpeedText.Text = "Текущая скорость: 100"
spinSpeedText.BackgroundTransparency = 1
spinSpeedText.TextColor3 = Color3.fromRGB(255, 255, 0)
spinSpeedText.Font = Enum.Font.GothamBold
spinSpeedText.TextScaled = true

-- Кнопки выбора скорости спина
local lightSpin = Instance.new("TextButton", frame)
lightSpin.Size = UDim2.new(0.25, 0, 0.1, 0)
lightSpin.Position = UDim2.new(0.05, 0, 0.7, 0)
lightSpin.Text = "Лёгкий"
lightSpin.BackgroundColor3 = Color3.fromRGB(50, 50, 100)
lightSpin.TextColor3 = Color3.new(1, 1, 1)
lightSpin.Font = Enum.Font.GothamBold
lightSpin.TextScaled = true

local mediumSpin = Instance.new("TextButton", frame)
mediumSpin.Size = UDim2.new(0.25, 0, 0.1, 0)
mediumSpin.Position = UDim2.new(0.375, 0, 0.7, 0)
mediumSpin.Text = "Средний"
mediumSpin.BackgroundColor3 = Color3.fromRGB(80, 80, 150)
mediumSpin.TextColor3 = Color3.new(1, 1, 1)
mediumSpin.Font = Enum.Font.GothamBold
mediumSpin.TextScaled = true

local hardSpin = Instance.new("TextButton", frame)
hardSpin.Size = UDim2.new(0.25, 0, 0.1, 0)
hardSpin.Position = UDim2.new(0.7, 0, 0.7, 0)
hardSpin.Text = "Жёсткий"
hardSpin.


BackgroundColor3 = Color3.fromRGB(120, 120, 200)
hardSpin.TextColor3 = Color3.new(1, 1, 1)
hardSpin.Font = Enum.Font.GothamBold
hardSpin.TextScaled = true

-- Переменные управления
local flying = false
local noclip = false
local speed = 50

local spinning = false
local spinSpeed = 100
local spinBodyAngularVelocity = nil

local vel = Instance.new("BodyVelocity")
vel.MaxForce = Vector3.new(1e5, 1e5, 1e5)
vel.P = 1250
vel.Velocity = Vector3.zero

local dir = {
    W = false, A = false, S = false, D = false,
    Up = false, Down = false
}

-- Функции полёта
local function flyLoop()
    while flying do
        if not char or not hrp then
            char = plr.Character or plr.CharacterAdded:Wait()
            hrp = char:WaitForChild("HumanoidRootPart")
            vel.Parent = hrp
        end
        local cam = workspace.CurrentCamera
        local move = Vector3.zero
        if dir.W then move += cam.CFrame.LookVector end
        if dir.S then move -= cam.CFrame.LookVector end
        if dir.A then move -= cam.CFrame.RightVector end
        if dir.D then move += cam.CFrame.RightVector end
        if dir.Up then move += Vector3.new(0,1,0) end
        if dir.Down then move -= Vector3.new(0,1,0) end

        if move.Magnitude > 0 then
            vel.Velocity = move.Unit * speed
        else
            vel.Velocity = Vector3.zero
        end

        task.wait()
    end
end

flyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    if flying then
        vel.Parent = hrp
        flyBtn.Text = "UNFLY"
        task.spawn(flyLoop)
    else
        vel.Parent = nil
        flyBtn.Text = "FLY"
    end
end)

-- Ноуклип
RunService.Stepped:Connect(function()
    if noclip and plr.Character then
        for _, part in pairs(plr.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end)

noclipBtn.MouseButton1Click:Connect(function()
    noclip = not noclip
    noclipBtn.Text = noclip and "UNCLIP" or "NOCLIP"
end)

-- Спин функции
local function startSpin()
    if spinning then return end
    spinning = true
    if not hrp then return end
    spinBodyAngularVelocity = Instance.new("BodyAngularVelocity")
    spinBodyAngularVelocity.MaxTorque = Vector3.new(0, math.huge, 0)
    spinBodyAngularVelocity.AngularVelocity = Vector3.new(0, math.rad(spinSpeed), 0)
    spinBodyAngularVelocity.Parent = hrp
end

local function stopSpin()
    spinning = false
    if spinBodyAngularVelocity then
        spinBodyAngularVelocity:Destroy()
        spinBodyAngularVelocity = nil
    end
end

spinBtn.MouseButton1Click:Connect(function()
    if spinning then
        stopSpin()
        spinBtn.Text = "SPIN"
    else
        startSpin()
        spinBtn.Text = "STOP SPIN"
    end
end)

local function setSpinSpeed(speedValue)
    spinSpeed = speedValue
    spinSpeedText.Text = "Текущая скорость: " .. tostring(speedValue)
    if spinBodyAngularVelocity then
        spinBodyAngularVelocity.AngularVelocity = Vector3.new(0, math.rad(spinSpeed), 0)
    end
end

lightSpin.MouseButton1Click:Connect(function()
    setSpinSpeed(100)
end)

mediumSpin.MouseButton1Click:Connect(function()
    setSpinSpeed(1000)
end)

hardSpin.MouseButton1Click:Connect(function()
    setSpinSpeed(2500)
end)

-- Кнопки открытия и закрытия хаба
openBtn.MouseButton1Click:Connect(function()
    frame.Visible = true
    openBtn.Visible = false
end)

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    openBtn.Visible = true
end)

-- Обработка ввода клавиш для движения при полёте
UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    local code = input.KeyCode
    if code == Enum.KeyCode.W then dir.W = true end
    if code == Enum.KeyCode.A then dir.A = true end
    if code == Enum.KeyCode.S then dir.S = true end
    if code == Enum.KeyCode.D then dir.D = true end
    if code == Enum.KeyCode.Space then dir.Up = true end
    if code == Enum.KeyCode.LeftShift then dir.Down = true end
end)

UIS.InputEnded:Connect(function(input)



local code = input.KeyCode
    if code == Enum.KeyCode.W then dir.W = false end
    if code == Enum.KeyCode.A then dir.A = false end
    if code == Enum.KeyCode.S then dir.S = false end
    if code == Enum.KeyCode.D then dir.D = false end
    if code == Enum.KeyCode.Space then dir.Up = false end
    if code == Enum.KeyCode.LeftShift then dir.Down = false end
end) -- Автоматическая прокрутка всего содержимого внутри frame
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 0.88, 0)
scrollFrame.Position = UDim2.new(0, 0, 0.12, 0)
scrollFrame.CanvasSize = UDim2.new(0, 0, 3, 0)
scrollFrame.ScrollBarThickness = 6
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollFrame.ClipsDescendants = true
scrollFrame.Parent = frame

-- Переносим все старые кнопки (кроме openBtn и frame) в scrollFrame
for _, child in pairs(frame:GetChildren()) do
 if child:IsA("TextButton") and child ~= closeBtn then
  child.Parent = scrollFrame
 end
 if child:IsA("TextLabel") and child ~= sideTitle then
  child.Parent = scrollFrame
 end
end

-- Переместим closeBtn и sideTitle вверх, чтобы остались в frame
closeBtn.Position = UDim2.new(0.3, 0, 0.94, 0)
sideTitle.Position = UDim2.new(0, 0, 0, 0)

-- Бесконечный прыжок
local infJumpBtn = Instance.new("TextButton", scrollFrame)
infJumpBtn.Size = UDim2.new(0.8, 0, 0.1, 0)
infJumpBtn.Position = UDim2.new(0.1, 0, 1.2, 0)
infJumpBtn.Text = "Бесконечный прыжок"
infJumpBtn.BackgroundColor3 = Color3.fromRGB(30, 100, 30)
infJumpBtn.TextColor3 = Color3.new(1, 1, 1)
infJumpBtn.Font = Enum.Font.GothamBold
infJumpBtn.TextScaled = true

local infJumpEnabled = false
local jumpConnection = nil

infJumpBtn.MouseButton1Click:Connect(function()
    infJumpEnabled = not infJumpEnabled
    infJumpBtn.Text = infJumpEnabled and "Отключить прыжок" or "Бесконечный прыжок"

    if infJumpEnabled then
        jumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
            local char = plr.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    else
        if jumpConnection then
            jumpConnection:Disconnect()
            jumpConnection = nil
        end
    end
end) -- Кнопка "Закрыть навсегда"
local foreverCloseBtn = Instance.new("TextButton", frame)
foreverCloseBtn.Size = UDim2.new(0.4, 0, 0.08, 0)
foreverCloseBtn.Position = UDim2.new(0.3, 0, 0.82, 0)
foreverCloseBtn.Text = "ЗАКРЫТЬ НАВСЕГДА ⚠️"
foreverCloseBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
foreverCloseBtn.TextColor3 = Color3.new(1, 1, 1)
foreverCloseBtn.Font = Enum.Font.GothamBold
foreverCloseBtn.TextScaled = true

foreverCloseBtn.MouseButton1Click:Connect(function()
    gui:Destroy() -- полностью удаляет весь GUI
end) 

-- Блок с Player List, TP и Fling

local playerListFrame = Instance.new("Frame")
playerListFrame.Size = UDim2.new(0.95, 0, 1.5, 0)  -- чуть выше по высоте для прокрутки
playerListFrame.Position = UDim2.new(0.025, 0, 1.35, 0)
playerListFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
playerListFrame.BorderSizePixel = 0
playerListFrame.Parent = scrollFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 25)
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextScaled = true
titleLabel.Text = "tp to player hack"
titleLabel.Parent = playerListFrame

local listFrame = Instance.new("ScrollingFrame")
listFrame.Size = UDim2.new(1, 0, 0.7, 0)
listFrame.Position = UDim2.new(0, 0, 0, 30)
listFrame.CanvasSize = UDim2.new(0, 0, 5, 0)
listFrame.ScrollBarThickness = 6
listFrame.BackgroundTransparency = 1
listFrame.BorderSizePixel = 0
listFrame.Parent = playerListFrame

local layout = Instance.new("UIListLayout")
layout.Parent = listFrame
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 5)

local selectedPlayer = nil

local function refreshPlayerList()
    -- Удаляем старые кнопки
    for _, child in pairs(listFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    -- Создаем кнопку для каждого игрока
    for i, pl in pairs(game.Players:GetPlayers()) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -10, 0, 30)
        btn.Position = UDim2.new(0, 5, 0, 0) -- неважно, UIListLayout сделает позицию
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.Gotham
        btn.TextScaled = true
        btn.Text = pl.Name
        btn.Parent = listFrame

        btn.MouseButton1Click:Connect(function()
            -- Убираем выделение с остальных
            for _, otherBtn in pairs(listFrame:GetChildren()) do
                if otherBtn:IsA("TextButton") then
                    otherBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                end
            end
            -- Выделяем этот
            btn.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
            selectedPlayer = pl
        end)
    end
    -- Обновляем размер canvas под количество игроков
    local count = #game.Players:GetPlayers()
    listFrame.CanvasSize = UDim2.new(0, 0, 0, count * 35)
end

refreshPlayerList()

-- Кнопка обновить список
local refreshBtn = Instance.new("TextButton")
refreshBtn.Size = UDim2.new(0.95, 0, 0, 30)
refreshBtn.Position = UDim2.new(0.025, 0, 0.72, 0)
refreshBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
refreshBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
refreshBtn.Font = Enum.Font.GothamBold
refreshBtn.TextScaled = true
refreshBtn.Text = "Обновить список"
refreshBtn.Parent = playerListFrame

refreshBtn.MouseButton1Click:Connect(function()
    refreshPlayerList()
end)

-- Кнопка TP to player
local tpBtn = Instance.new("TextButton")
tpBtn.Size = UDim2.new(0.95, 0, 0, 30)
tpBtn.Position = UDim2.new(0.025, 0, 0.78, 0)
tpBtn.BackgroundColor3 = Color3.fromRGB(30, 100, 30)
tpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
tpBtn.Font = Enum.Font.GothamBold
tpBtn.TextScaled = true
tpBtn.Text = "TP to player"
tpBtn.Parent = playerListFrame

tpBtn.MouseButton1Click:Connect(function()
    if selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
        hrp.CFrame = selectedPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
    else
        tpBtn.Text = "Игрок не выбран или не в игре!"
        task.delay(2, function()
            tpBtn.Text = "TP to player"
        end)
    end
end)

-- Тумблер Fling
local flingEnabled = false

local flingToggle = Instance.new("TextButton")
flingToggle.Size = UDim2.new(0.95, 0, 0, 30)
flingToggle.Position = UDim2.new(0.025, 0, 0.84, 0)
flingToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
flingToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
flingToggle.Font = Enum.Font.GothamBold
flingToggle.TextScaled = true
flingToggle.Text = "FLING OFF"
flingToggle.Parent = playerListFrame

local flingConnection = nil

flingToggle.MouseButton1Click:Connect(function()
    flingEnabled = not flingEnabled
    flingToggle.Text = flingEnabled and "FLING ON" or "FLING OFF"

    if flingEnabled then
        flingConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
                hrp.CFrame = selectedPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
            end
        end)
    else
        if flingConnection then
            flingConnection:Disconnect()
            flingConnection = nil
        end
    end
end)

-- Инструкция под кнопками
local helpLabel = Instance.new("TextLabel")
helpLabel.Size = UDim2.new(0.95, 0, 0, 40)
helpLabel.Position = UDim2.new(0.025, 0, 0.90, 0)
helpLabel.BackgroundTransparency = 1
helpLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
helpLabel.Font = Enum.Font.GothamBold
helpLabel.TextScaled = true
helpLabel.Text = "Чтобы использовать флинг, сядьте в машину/корабль и включите тумблер"
helpLabel.Parent = playerListFrame 

-- Блок "Подозрительные фразы в чате (antiOder)"
local suspiciousFrame = Instance.new("Frame")
suspiciousFrame.Size = UDim2.new(0.95, 0, 0, 140)
suspiciousFrame.Position = UDim2.new(0.025, 0, 2.9, 0)
suspiciousFrame.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
suspiciousFrame.BorderSizePixel = 2
suspiciousFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
suspiciousFrame.Parent = scrollFrame

local susTitle = Instance.new("TextLabel", suspiciousFrame)
susTitle.Size = UDim2.new(1, 0, 0, 20)
susTitle.Text = "фразы которые часто произносят одеры(счетчик обхода фильтра чата)"
susTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
susTitle.Font = Enum.Font.GothamBold
susTitle.TextScaled = true
susTitle.BackgroundTransparency = 1

local susLog = Instance.new("TextLabel", suspiciousFrame)
susLog.Size = UDim2.new(1, -10, 1, -25)
susLog.Position = UDim2.new(0, 5, 0, 22)
susLog.TextColor3 = Color3.fromRGB(255, 100, 100)
susLog.Font = Enum.Font.Code
susLog.TextXAlignment = Enum.TextXAlignment.Left
susLog.TextYAlignment = Enum.TextYAlignment.Top
susLog.TextWrapped = true
susLog.TextScaled = false
susLog.BackgroundTransparency = 1
susLog.Text = ""
susLog.TextSize = 14

-- Список подозрительных фраз (русский сленг и обходы)
local suspiciousPhrases = {
    -- базовые запрещённые слова
    "раздевайся", "раз;дева;й;ся", "р;а;з;д;е;в;а;й;с;я", "р а з д е в а й с я",
    "секс", "с е к с", "с;е;к;с", "сэкс", "с э к с",
    "69", "шлюха", "ш л ю х а", "ш;л;ю;х;а",
    "блядь", "б л я д ь", "б;л;я;д;ь",
    "девочка", "д е в о ч к а", "д;е;в;о;ч;к;а",
    "парень", "п а р е н ь", "п;а;р;е;н;ь",
    "девушка", "д е в у ш к а", "д;е;в;у;ш;к;а",
    "соси", "с о с и", "с;о;с;и",
    "ебать", "ёбать", "е б а т ь", "е;б;а;т;ь",
    "пизда", "п и з д а", "п;и;з;д;а",
    "гoвнo", "говно", "г о в н о",
    "иди на хуй", "иди нахуй", "и д и н а х у й", "и;д;и;н;а;х;у;й",
    "хуй", "х у й", "х;у;й",
    "член", "ч л е н", "ч;л;е;н",
    "залупа", "з а л у п а", "з;а;л;у;п;а",
    "попка", "п о п к а", "п;о;п;к;а",
    "пригласить в секс", "пригласить в с е к с",
    -- сленг и часто используемые слова
    "ле ле ле", "le le le", "ле", "le",  -- detect 3 и более
    "rawr", "uwu", "daddy", "baby",
    "па;ра", "пара",
    "секc", "сеkс", "seggs",
    "ищу мальчика", "мой мальчик",
    "ищу девочку",
    "се;кс", "с;е;к;с",
    -- ещё обходы
    "р а з д е в а й с я", "р;а;з;д;е;в;а;й;с;я", "р а з д е в а й с я",
    "л е л е л е", "л;е;л;е;л;е",
    "па;ра", "па;ра", "п;а;р;а",
}

-- Функция очистки сообщения от пробелов и обходных символов
local function cleanMessage(msg)
    return msg:lower():gsub("[%s;%.%-_]", "")
end

local function logSuspicious(name, message)
    local newLine = name .. ": " .. message
    susLog.Text = newLine .. "\n" .. susLog.Text
end

local function checkMsg(plr, msg)
    local lowerMsg = msg:lower()
    local cleanedMsg = cleanMessage(msg)

    -- Проверяем подозрительные фразы по очищенному сообщению
    for _, phrase in pairs(suspiciousPhrases) do
        if string.find(cleanedMsg, phrase) then
            logSuspicious(plr.Name, msg)
            return
        end
    end

    -- Проверяем подряд идущие "le"
    local leCount = 0
    for _ in string.gmatch(lowerMsg, "le") do
        leCount += 1
    end
    if leCount >= 3 then
        logSuspicious(plr.Name, msg)
        return
    end
end

-- Подключаемся к уже в игре игрокам
for _, player in pairs(game.Players:GetPlayers()) do
    player.Chatted:Connect(function(msg)
        checkMsg(player, msg)
    end)
end

-- Подключаемся к новым игрокам
game.Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(msg)
        checkMsg(player, msg)
    end)
end) 

local function detectExecutor()
    if type(getexecutorname) == "function" then
        local name = getexecutorname()
        if type(name) == "string" and name ~= "" then
            if name == "Synapse X" then
                return "Synapse X"
            elseif name == "Fluxus" then
                return "Fluxus"
            elseif name == "JJSPloit" then
                return "JJSPloit"
            elseif name == "Delta" then
                return "Delta"
            elseif name == "BagSploit" then
                return "BagSploit"
            else
                return name
            end
        end
    end

    if syn and syn.request then
        return "Synapse X"
    elseif fluxus and fluxus.queue_on_teleport then
        return "Fluxus"
    elseif getgenv and getgenv().IsJJSPloit then
        return "JJSPloit"
    elseif delta and delta.loadstring then
        return "Delta"
    else
        return "Unknown"
    end
end

-- Получаем имя эксплойта
local executorName = detectExecutor()

-- 👇 Создание окна с текстом "Player executor: ..."
local executorFrame = Instance.new("Frame", gui)
executorFrame.Size = UDim2.new(0, 300, 0, 50)
executorFrame.Position = UDim2.new(0.5, -150, 0.1, 0)
executorFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
executorFrame.BorderSizePixel = 2
executorFrame.BorderColor3 = Color3.fromRGB(255, 0, 255)
executorFrame.ZIndex = 10
executorFrame.BackgroundTransparency = 1 -- для анимации

local executorLabel = Instance.new("TextLabel", executorFrame)
executorLabel.Size = UDim2.new(1, 0, 1, 0)
executorLabel.BackgroundTransparency = 1
executorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
executorLabel.Font = Enum.Font.GothamBold
executorLabel.TextScaled = true
executorLabel.Text = "Player executor: "..executorName
executorLabel.ZIndex = 11
executorLabel.TextTransparency = 1 -- для анимации

-- Скрываем хаб и кнопку открытия пока не пришло время
frame.Visible = false
openBtn.Visible = false

-- Анимация "всплытия" надписи
local fadeTime = 0.5
local steps = 20
for i = 1, steps do
    executorFrame.BackgroundTransparency = executorFrame.BackgroundTransparency - (1 / steps)
    executorLabel.TextTransparency = executorLabel.TextTransparency - (1 / steps)
    task.wait(fadeTime / steps)
end

-- Пауза
task.wait(2)

-- Анимация исчезновения
for i = 1, steps do
    executorFrame.BackgroundTransparency = executorFrame.BackgroundTransparency + (1 / steps)
    executorLabel.TextTransparency = executorLabel.TextTransparency + (1 / steps)
    task.wait(fadeTime / steps)
end

-- Удаляем надпись
executorFrame:Destroy()

-- Показываем хаб и кнопку закрытия
frame.Visible = true

-- Кнопка "Закрыть Хаб" возвращает кнопку открытия
closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    openBtn.Visible = true
end)



-- 📛 Бейдж "по фэншую" в угол экрана
local function ShowBadge(text, iconId)
 local gui = Instance.new("ScreenGui", game.CoreGui)
 gui.Name = "BaganiyBadgeNotify"

 local frame = Instance.new("Frame")
 frame.Size = UDim2.new(0, 320, 0, 60)
 frame.Position = UDim2.new(1, -330, 1, 10)
 frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
 frame.AnchorPoint = Vector2.new(0, 1)
 frame.BorderSizePixel = 0
 frame.Parent = gui

 local uicorner = Instance.new("UICorner", frame)
 uicorner.CornerRadius = UDim.new(0, 8)

 local icon = Instance.new("ImageLabel", frame)
 icon.Size = UDim2.new(0, 50, 0, 50)
 icon.Position = UDim2.new(0, 5, 0.5, -25)
 icon.BackgroundTransparency = 1
 icon.Image = iconId or "rbxassetid://129895744043184"
 icon.ScaleType = Enum.ScaleType.Fit

 local label = Instance.new("TextLabel", frame)
 label.Position = UDim2.new(0, 60, 0, 0)
 label.Size = UDim2.new(1, -65, 1, 0)
 label.BackgroundTransparency = 1
 label.TextColor3 = Color3.new(1, 1, 1)
 label.Font = Enum.Font.GothamSemibold
 label.TextScaled = true
 label.Text = text
 label.TextXAlignment = Enum.TextXAlignment.Left
 label.TextYAlignment = Enum.TextYAlignment.Center

 -- Появление
 frame:TweenPosition(UDim2.new(1, -330, 1, -10), "Out", "Back", 0.5)

 -- Удаление
 task.delay(5, function()
  frame:TweenPosition(UDim2.new(1, -330, 1, 60), "In", "Sine", 0.4)
  task.wait(0.4)
  gui:Destroy()
 end)
end

-- Вызов:
ShowBadge("✅ by baganiy antioders, Scripters hub for enjoy!", "rbxassetid://129895744043184")
