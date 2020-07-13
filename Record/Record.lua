local playerCasting, playerCombat, playerMoving, playerLooting = false, false, false, false
local pulse = nil
local pulseDelay = 0.3

local bStopRecAtOrigin = true -- stop recording if we loop back to start

local iFrame = CreateFrame("BUTTON", "GatherFrame", UIParent)
local iStatus = iFrame:CreateFontString("StatusText", "OVERLAY")
iStatus:SetFont("Fonts\\FRIZQT__.TTF", 14)
	
iFrame:RegisterEvent("PLAYER_LOGIN")
iFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
iFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
iFrame:RegisterEvent("PLAYER_STARTED_MOVING")
iFrame:RegisterEvent("PLAYER_STOPPED_MOVING")
iFrame:RegisterEvent("LOOT_OPENED")
iFrame:RegisterEvent("LOOT_CLOSED")
iFrame:RegisterUnitEvent("UNIT_SPELLCAST_START")
iFrame:RegisterUnitEvent("UNIT_SPELLCAST_STOP")

local enabled = false
local startTime = nil
local xBefore, yBefore, zBefore = 0,0,0
local xStart, yStart, zStart = 0,0,0

local distanceTol = 2.5
local recordingPath = false
local fileName = nil

local idx = 0

local function Init()
	idx = 0
	xBefore, yBefore, zBefore = 0,0,0
	startTime = GetTime()
	fileName = 'LUA\\Path_'..startTime..'.lua'
end

local function EndRec()
	enabled=false
	WriteFile(fileName, '\n}\n\nlocal waypointsCount = table.getn(waypoints)', true)
	idx = 0
end

iFrame:SetScript(
  "OnEvent",
  function(self, event, ...)
    local arg1, arg2, arg3 = ...
    if event == "PLAYER_LOGIN" then
	  if startTime == nil then
		print('Path Recording Plugin LOADED.')
		print(' * Make sure you have a folder called LUA in WoW directory! * ')
	  end

      iFrame:SetWidth(80)
      iFrame:SetHeight(50)
      iFrame:SetPoint(
        "CENTER",
        UIParent,
        "TOP",
        2,
        -20
      )
      iFrame:SetMovable(true)
      iFrame:EnableMouse(true)
      -- iFrame:RegisterForClicks("RightButtonUp")
      -- iFrame:SetScript(
        -- "OnClick",
        -- function(self, button, down)
          -- if enabled == false then
            -- enabled = true
          -- else
            -- enabled = false
          -- end
        -- end
      -- )
      GatherFrame:SetScript(
        "OnMouseDown",
        function(self, button)
          if button == "LeftButton" and not self.isMoving then
            self:StartMoving()
            self.isMoving = true
          end
        end
      )
      GatherFrame:SetScript(
        "OnMouseUp",
        function(self, button)
		  if enabled == false then
		    Init()
            enabled = true
          else
            enabled = false
			EndRec()
          end
		
          if button == "LeftButton" and self.isMoving then
            self:StopMovingOrSizing()
            self.isMoving = false
          end
        end
      )
	  
      iStatus:SetFontObject(GameFontNormalSmall)
      iStatus:SetJustifyH("CENTER")
      iStatus:SetPoint("CENTER", GatherFrame, "CENTER", 0, 0)
      iStatus:SetText("Recording |cffff0000Disabled")

    elseif event == "PLAYER_REGEN_ENABLED" then
      playerCombat = false
    elseif event == "PLAYER_REGEN_DISABLED" then
      playerCombat = true
    elseif event == "PLAYER_STARTED_MOVING" then
      playerMoving = true
    elseif event == "PLAYER_STOPPED_MOVING" then
      playerMoving = false
    elseif event == "LOOT_OPENED" then
      playerLooting = true
    elseif event == "LOOT_CLOSED" then
      playerLooting = false
      pulse = GetTime() + 1
    elseif event == "UNIT_SPELLCAST_START" then
      if arg1 == "player" then
        playerCasting = true
      end
    elseif event == "UNIT_SPELLCAST_STOP" then
      if arg1 == "player" then
        playerCasting = false
        pulse = GetTime() + 1
      end
    end
  end
)

local function PulseRecording()
	local x,y,z = ObjectPosition("player")
	local distanceTraveled = math.sqrt(((x - xBefore) ^ 2) + ((y - yBefore) ^ 2) + ((z - zBefore) ^ 2))
	
	if xBefore == 0 and yBefore == 0 and zBefore == 0 then
		idx = 0
		WriteFile(fileName, 'local waypoints = {\n\n', true)
		
		xStart=x
		yStart=y
		zStart=z
	end
	if distanceTraveled > distanceTol then
		idx = idx + 1
		local line = '    ['..idx..'] = { '..x..', '..y..', '..z..' },\n'
		WriteFile(fileName, line, true)
		print('Added Waypoint ['..idx..']')
		xBefore=x
		yBefore=y
		zBefore=z
		
		--If proximal to start and we recorded some points just stop recording
		if bStopRecAtOrigin == true and idx > 3 then
			local distFromStart = math.sqrt(((x - xStart) ^ 2) + ((y - yStart) ^ 2) + ((z - zStart) ^ 2))
			if distFromStart <= distanceTol then
			    enabled = false
				EndRec()
			end
		end
	end
end

iFrame:SetScript(
  "OnUpdate",
  function(self, elapsed)
	--print('.')
    if enabled and not playerLooting and not playerCasting then
      if pulse == nil then
        pulse = GetTime()
      end
	  
	  -- 1s is typically added to pulse on loot_closed and spellcast_stop
      if GetTime() > pulse then
		PulseRecording()
        pulse = GetTime() + pulseDelay
      end
    end
	
    if enabled then
      iStatus:SetText("Recording |cFF00FF00Enabled")
	else
	  iStatus:SetText("Recording |cffff0000Disabled")
	  --skinOrLootUnit = nil
    end

  end
)