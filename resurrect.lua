local scriptName = 'felwood_54'

local waitBeforeRevive = 10 --overwritten
local waitBeforeReviveIfPVEDeath = 10
local waitBeforeReviveIfPVPDeath = 300

local waypoints = {
   [1] = { 3806.5395507813, -1600.2913818359, 218.83123779297 },
    [2] = { 3803.3322753906, -1593.3157958984, 218.27326965332 },
    [3] = { 3800.5979003906, -1588.7020263672, 217.22230529785 },
    [4] = { 3797.7514648438, -1584.0633544922, 216.16157531738 },
    [5] = { 3795.0495605469, -1579.4215087891, 215.23223876953 },
    [6] = { 3792.6787109375, -1574.0350341797, 214.75202941895 },
    [7] = { 3790.8486328125, -1568.7982177734, 213.57888793945 },
    [8] = { 3789.0583496094, -1563.6585693359, 211.9956817627 },
    [9] = { 3786.2788085938, -1558.9891357422, 210.83102416992 },
    [10] = { 3784.2958984375, -1553.5772705078, 209.98999023438 },
    [11] = { 3781.7917480469, -1548.8305664063, 209.25752258301 },
    [12] = { 3779.0568847656, -1544.3177490234, 208.46730041504 },
    [13] = { 3777.1928710938, -1539.2136230469, 207.87162780762 },
    [14] = { 3775.1547851563, -1533.6329345703, 207.03364562988 },
    [15] = { 3772.6147460938, -1528.7875976563, 206.1535949707 },
    [16] = { 3770.8068847656, -1523.8399658203, 205.3313293457 },
    [17] = { 3768.8562011719, -1518.5627441406, 204.62683105469 },
    [18] = { 3767.0056152344, -1513.5562744141, 204.00854492188 },
    [19] = { 3765.130859375, -1508.4842529297, 203.49241638184 },
    [20] = { 3763.2133789063, -1503.2972412109, 203.38668823242 },
    [21] = { 3761.1813964844, -1498.1259765625, 203.08544921875 },
    [22] = { 3759.0908203125, -1492.85546875, 200.60754394531 },
    [23] = { 3757.4736328125, -1487.6448974609, 199.9493560791 },
    [24] = { 3756.6770019531, -1482.1107177734, 198.71133422852 },
    [25] = { 3756.9958496094, -1476.4991455078, 198.24264526367 },
    [26] = { 3759.2783203125, -1471.7369384766, 198.36459350586 },
    [27] = { 3762.2983398438, -1467.2092285156, 198.4771270752 },
    [28] = { 3765.3530273438, -1462.6311035156, 198.60679626465 },
    [29] = { 3768.3366699219, -1458.1597900391, 198.6678314209 },
    [30] = { 3771.2331542969, -1453.6561279297, 198.74113464355 },
    [31] = { 3774.0756835938, -1449.1284179688, 198.98036193848 },
    [32] = { 3776.8562011719, -1444.5015869141, 199.18467712402 },
    [33] = { 3778.642578125, -1439.2451171875, 199.58656311035 },
    [34] = { 3779.6877441406, -1433.9931640625, 200.21296691895 },
    [35] = { 3780.732421875, -1428.7231445313, 201.05667114258 },
    [36] = { 3781.7705078125, -1423.4875488281, 201.70547485352 },
    [37] = { 3782.8305664063, -1418.1403808594, 202.09790039063 },
    [38] = { 3783.9467773438, -1412.5100097656, 202.37164306641 },
    [39] = { 3785.1003417969, -1406.6907958984, 202.46186828613 },
    [40] = { 3786.248046875, -1400.9848632813, 202.64012145996 },
    [41] = { 3787.337890625, -1395.5989990234, 202.7154083252 },
    [42] = { 3788.1882324219, -1390.6583251953, 202.5714263916 },
    [43] = { 3789.0561523438, -1385.4007568359, 202.36045837402 },
    [44] = { 3789.9780273438, -1379.8150634766, 202.33001708984 },
    [45] = { 3790.9184570313, -1374.1171875, 202.82675170898 },
    [46] = { 3791.8146972656, -1368.6868896484, 203.1961517334 },
    [47] = { 3792.7224121094, -1363.1875, 203.07592773438 },
    [48] = { 3793.6171875, -1357.7658691406, 202.87316894531 },
    [49] = { 3794.5349121094, -1352.2060546875, 202.93685913086 },
    [50] = { 3795.4340820313, -1346.7585449219, 203.04530334473 },
    [51] = { 3796.357421875, -1341.1641845703, 203.04731750488 },
    [52] = { 3797.3171386719, -1335.5231933594, 202.90837097168 },
    [53] = { 3797.7702636719, -1329.8990478516, 202.81231689453 },
    [54] = { 3798.1840820313, -1323.9985351563, 202.8180847168 },
    [55] = { 3798.1381835938, -1318.2897949219, 202.93193054199 },
    [56] = { 3797.1267089844, -1312.3778076172, 203.13175964355 },
    [57] = { 3795.6962890625, -1306.97265625, 203.39730834961 },
    [58] = { 3794.2822265625, -1301.6535644531, 204.01887512207 },
    [59] = { 3791.7197265625, -1297.3850097656, 205.22039794922 },
    [60] = { 3790.3146972656, -1292.0998535156, 206.38377380371 },
    [61] = { 3788.5712890625, -1287.1546630859, 206.93487548828 },
    [62] = { 3785.7580566406, -1282.5690917969, 206.94784545898 },
    [63] = { 3781.6350097656, -1276.1867675781, 206.79301452637 },
    [64] = { 3779.2763671875, -1271.6000976563, 207.11024475098 },
    [65] = { 3777.7456054688, -1265.8413085938, 207.97451782227 },
    [66] = { 3776.31640625, -1260.5936279297, 208.7825012207 },
    [67] = { 3774.373046875, -1255.4245605469, 209.31312561035 },
    [68] = { 3772.4387207031, -1250.3748779297, 209.63327026367 },
    [69] = { 3770.4792480469, -1245.1291503906, 209.71965026855 },
    [70] = { 3768.6408691406, -1239.9694824219, 209.56718444824 },
    [71] = { 3767.3981933594, -1234.7110595703, 209.44450378418 },
    [72] = { 3766.5942382813, -1229.5494384766, 209.52619934082 },
    [73] = { 3762.1550292969, -1226.5711669922, 209.37211608887 },
    [74] = { 3757.6176757813, -1223.5816650391, 209.2425994873 },
    [75] = { 3753.033203125, -1220.6000976563, 209.25569152832 },
    [76] = { 3748.529296875, -1217.6708984375, 209.54415893555 },
    [77] = { 3743.9816894531, -1214.7132568359, 210.02005004883 },
    [78] = { 3740.8625488281, -1210.6475830078, 210.44505310059 },
    [79] = { 3737.7268066406, -1206.6369628906, 210.5419921875 },
    [80] = { 3735.7468261719, -1201.5788574219, 210.53916931152 },
    [81] = { 3733.2155761719, -1196.7835693359, 210.17958068848 },
    [82] = { 3730.4614257813, -1192.048828125, 209.54866027832 },
    [83] = { 3727.7248535156, -1187.3443603516, 208.75459289551 },
    [84] = { 3725.02734375, -1182.6779785156, 208.1028137207 },
    [85] = { 3722.4001464844, -1177.9127197266, 207.73834228516 },
    [86] = { 3720.5561523438, -1172.8291015625, 207.57379150391 },
    [87] = { 3719.5764160156, -1167.2231445313, 207.50180053711 },
    [88] = { 3719.9633789063, -1161.7630615234, 207.51277160645 },
    [89] = { 3720.5939941406, -1156.4013671875, 207.67240905762 },
    [90] = { 3721.2885742188, -1151.0130615234, 208.04568481445 },
    [91] = { 3722.4689941406, -1145.3695068359, 208.41291809082 },
    [92] = { 3723.9802246094, -1139.9744873047, 208.56303405762 },
    [93] = { 3726.2048339844, -1134.607421875, 208.77236938477 },
    [94] = { 3728.2565917969, -1129.1671142578, 209.38009643555 },
    [95] = { 3730.3129882813, -1123.7144775391, 210.5767364502 },
    [96] = { 3732.2058105469, -1118.6958007813, 211.91717529297 },
    [97] = { 3734.1540527344, -1113.5297851563, 213.08126831055 },
    [98] = { 3736.1950683594, -1108.1180419922, 213.87963867188 },
    [99] = { 3738.0847167969, -1103.1075439453, 214.47499084473 },
    [100] = { 3740.1904296875, -1097.5239257813, 215.49006652832 },
    [101] = { 3742.1818847656, -1092.2437744141, 216.88298034668 },
    [102] = { 3744.1333007813, -1087.0695800781, 218.33619689941 },
    [103] = { 3746.1279296875, -1081.7806396484, 219.59599304199 },
    [104] = { 3747.9682617188, -1076.7346191406, 220.41513061523 },
    [105] = { 3750.8063964844, -1072.4895019531, 221.30641174316 },
    [106] = { 3752.236328125, -1067.3424072266, 222.29389953613 },
    [107] = { 3752.810546875, -1061.6927490234, 223.33660888672 },
    [108] = { 3754.4597167969, -1056.2277832031, 224.62246704102 },
    [109] = { 3756.3947753906, -1051.2703857422, 225.8005065918 },
    [110] = { 3758.5793457031, -1046.3642578125, 226.81781005859 },
    [111] = { 3759.7875976563, -1041.1280517578, 227.56770324707 },
    [112] = { 3761.3198242188, -1035.8388671875, 228.30676269531 },
    [113] = { 3763.0559082031, -1030.3309326172, 229.49308776855 },
    [114] = { 3764.8139648438, -1025.1063232422, 231.27815246582 },
    [115] = { 3766.7492675781, -1019.5727539063, 233.2325592041 },
    [116] = { 3768.966796875, -1014.0192260742, 234.40216064453 },
    [117] = { 3771.7180175781, -1009.382019043, 234.90354919434 },
    [118] = { 3774.9057617188, -1005.0939331055, 235.5336151123 },
    [119] = { 3778.3149414063, -1000.7286987305, 237.06988525391 },
    [120] = { 3781.2185058594, -996.94641113281, 239.50099182129 },
    [121] = { 3784.0805664063, -993.03411865234, 241.82972717285 },
    [122] = { 3787.4453125, -988.37426757813, 244.3508605957 },
    [123] = { 3790.5200195313, -983.79986572266, 245.73112487793 },
    [124] = { 3793.9389648438, -978.9833984375, 246.89143371582 },
    [125] = { 3797.2707519531, -974.69964599609, 248.07106018066 },
    [126] = { 3801.1408691406, -970.15765380859, 250.27847290039 },
    [127] = { 3805.0969238281, -965.93432617188, 253.15126037598 },
    [128] = { 3809.7231445313, -962.67163085938, 255.0599822998 },
    [129] = { 3814.47265625, -960.98449707031, 254.65534973145 },
    [130] = { 3817.96875, -956.90417480469, 257.51815795898 },
    [131] = { 3821.5759277344, -952.66223144531, 260.55905151367 },
    [132] = { 3829.2250976563, -952.22161865234, 259.55191040039 },
    [133] = { 3834.6645507813, -952.68933105469, 258.25323486328 },
    [134] = { 3840.1291503906, -953.05993652344, 257.560546875 },
    [135] = { 3845.4653320313, -953.32458496094, 257.40142822266 },
    [136] = { 3850.4833984375, -954.36676025391, 256.98168945313 },
    [137] = { 3855.2114257813, -956.25946044922, 256.39855957031 },
    [138] = { 3860.6120605469, -954.76770019531, 255.92153930664 },
    [139] = { 3865.4997558594, -952.63244628906, 256.2685546875 },
    [140] = { 3871.2463378906, -951.05639648438, 258.46127319336 },
    [141] = { 3876.5202636719, -949.61004638672, 259.89810180664 },
    [142] = { 3880.1989746094, -945.28967285156, 261.47689819336 },
    [143] = { 3884.2014160156, -941.21368408203, 262.52523803711 },
    [144] = { 3888.3227539063, -937.51391601563, 263.25024414063 },
    [145] = { 3893.8037109375, -936.83489990234, 262.91159057617 },
    [146] = { 3899.2604980469, -935.03668212891, 262.32992553711 },
    [147] = { 3904.3447265625, -932.75140380859, 261.43203735352 },
    [148] = { 3909.4641113281, -929.73736572266, 262.60153198242 },
    [149] = { 3914.3303222656, -926.20434570313, 264.78897094727 },
    [150] = { 3917.7817382813, -922.13806152344, 266.26928710938 },
    [151] = { 3919.7570800781, -917.03839111328, 267.19415283203 },
    [152] = { 3921.4770507813, -911.74377441406, 268.90396118164 },
    [153] = { 3922.490234375, -906.03509521484, 270.59045410156 },
    [154] = { 3921.8811035156, -900.65911865234, 271.65512084961 },
    [155] = { 3918.0275878906, -896.9462890625, 272.41934204102 },
    [156] = { 3913.6118164063, -894.13739013672, 273.38940429688 },
    [157] = { 3909.73046875, -890.13720703125, 274.79055786133 },
    [158] = { 3905.5383300781, -883.82366943359, 276.51254272461 },
    [159] = { 3902.4094238281, -879.82788085938, 277.42343139648 },
    [160] = { 3901.44921875, -878.6015625, 277.7209777832 },

}

local waypointsCount = table.getn(waypoints)

local function DetermineResTime()
	local objCount = GetObjectCount()
	for i = 1, objCount do
		local obj = GetObjectWithIndex(i)
		if UnitIsEnemy("player", obj) and UnitIsPlayer(obj) and UnitIsDead(obj) == false and GetDistanceBetweenObjects("player", obj) < 50 then
			waitBeforeRevive = waitBeforeReviveIfPVPDeath
			return
		end
	end
	waitBeforeRevive = waitBeforeReviveIfPVEDeath
end
DetermineResTime()

local pulseDelay = 0.2
local startDelay = waitBeforeRevive
local bPrint = false

local frame = CreateFrame("Frame")
local bRun = true
local canPulseAt = (GetTime() + startDelay) + pulseDelay

local pathIdx = 1
local losFlags =  bit.bor(0x10, 0x100)
local proximalTolerance = 4

local bSkipFarPoints = false
local bReLoop = false

local rndMax = 50

local function DbgPrint(str)
	if bPrint == true then
		print(str)
		WriteFile('_Kkona/Debug.txt', str..'\n', true)
	end
end




local function ShouldExit()
	--Needs to be called within OnUpdate itself
	if bAtEnd then
		bRun=false
		DbgPrint("Setting bRun to FALSE")
	end
	
	if bRun == false then
		local exitMacro = '.loadfile _Kkona\\'..scriptName..'\\main.lua'
		DbgPrint("Starting main.lua from resurrect.lua")
		RunMacroText(exitMacro)
		frame:SetScript("OnUpdate", nil)
	end
end


local function CalculateDistance(x1,y1,z1,x2,y2,z2)
	return math.sqrt(((x1 - x2) ^ 2) + ((y1 - y2)  ^ 2) + ((z1 - z2) ^ 2))
end


local function SetIDXToClosest()
	local px, py, pz = ObjectPosition("player")
	local moveToIdx = 1
	local moveToDist = 9999999
	local foundSomething = false
	
	
	for i = 1, waypointsCount, 1 do
		local xyz = waypoints[i]
		if xyz ~= nil then
			local dist = CalculateDistance(px,py,pz,xyz[1],xyz[2],xyz[3])
		
			if dist <= moveToDist then					
				if TraceLine(px, py, pz+2.5, xyz[1], xyz[2], xyz[3]+2.5,losFlags) == nil then
					foundSomething=true
					moveToIdx = i
					moveToDist = dist
				end
			end
		end
	end

	if foundSomething then
		pathIdx=moveToIdx
		DbgPrint("Starting at Ressurect path at idx "..pathIdx)
	end
end

local firstTick=true

local function StrictPathFollow()
	if firstTick == true then
		firstTick = false
		SetIDXToClosest()
	end
	
	local px, py, pz = ObjectPosition("player")
	local xyz = waypoints[pathIdx] --return is imp to always assign next xyz correctly
	
	if xyz ~= nil then
		--Add Class Specific
		--!Move this to last (after movement!!!)
		if xyz[4] ~= nil then
			--Define 4th Param Stuff
		end
	
		local dist = CalculateDistance(px,py,pz,xyz[1],xyz[2],xyz[3])
		--print(' = DIST: '..dist)
		if dist <= proximalTolerance then
			if pathIdx < waypointsCount then
				pathIdx = pathIdx + 1
				DbgPrint('Moving to RES idx {'..pathIdx..'/'..waypointsCount..'}')
				return
			else
				bAtEnd = true
			end
		end
	end	
		
	--Check if Stuck
	if pathIdx == lastIdx then
		lastIdxCount = lastIdxCount + 1
		stuckTime = stuckTime + pulseDelay
	else
		stuckTime  = 0
		lastIdxCount = 0
	end

	--Skip if stuck (forced) but never skip last post so as to trigger the appropriate fail safes
	--using counter in the form of lastIdxCount is mehhh coz doesnt give indication of time stuck (we vary pulseDelay all the time)
	if lastIdxCount > 35 and (pathIdx < waypointsCount-2) then
		local stuckStr  = 'Appears to be STUCK: at idx='..pathIdx
		print(stuckStr)
		WriteFile('_Kkona/Stuck.txt', stuckStr..'\n', true)
		--local prevIdx = pathIdx
		--pathIdx = 1
		--FindNextBestPoint()
		SendKey(' ')
		pathIdx = pathIdx + 1
		bAtEnd = pathIdx > waypointsCount
		if bAtEnd then
		end
		return
	end
		
	if pathIdx < 1 then
		pathIdx = 1
	elseif pathIdx > waypointsCount then
		pathIdx = waypointsCount
		bAtEnd=true
	end

		
	--Move
	local rnd = (math.random(-rndMax,rndMax)/100)
	local moveToXYZ = waypoints[pathIdx]
	if moveToXYZ ~= nil then
		dX=moveToXYZ[1]+rnd
		dY=moveToXYZ[2]+rnd
		dZ=moveToXYZ[3]+rnd
	end

	local distToNext = CalculateDistance(px,py,pz,moveToXYZ[1],moveToXYZ[2],moveToXYZ[3])
	if bSkipFarPoints == false or (bSkipFarPoints and distToNext < 50) then
		if bIgnoreLOS == true or TraceLine(px, py, pz+2.5, moveToXYZ[1], moveToXYZ[2], moveToXYZ[3]+2.5, losFlags) == nil then
			MoveTo(moveToXYZ[1]+rnd, moveToXYZ[2]+rnd, moveToXYZ[3]+rnd)
		end	
	else
		if bSkipFarPoints then
			DbgPrint('*Skipping* to RES idx {'..pathIdx..'/'..waypointsCount..'}')
			pathIdx = pathIdx + 1
			bAtEnd = pathIdx > waypointsCount
			return
		else
			DbgPrint('*Waiting* for player to be close to path...')
		end
	end
	
	lastIdx = pathIdx
end


local function ResurrectPulse()
	local name = ObjectName("player")
	local objCount = GetObjectCount()
	local px,py,pz = ObjectPosition("player")
	
	for i = 1, objCount do
		local obj = GetObjectWithIndex(i)
		if UnitIsCorpse(obj) then
			local oname = ObjectName(obj)
			if name == oname then
				local dist = GetDistanceBetweenObjects("player",obj)
				local cx,cy,cz = ObjectPosition(obj)
				-- if dist < 80 and TraceLine(px, py, pz+2.5, cx,cy,cz+2.5,losFlags) == nil then
					-- MoveTo(cx,cy,cz)
					-- return true
				-- end
				if dist < 35 then
					if GetCorpseRecoveryDelay() <= 0 then
						RetrieveCorpse()
						bAtEnd = true
						return true
					else
						Sleepy(5)
						return true
					end
				end
			end
		end
	end
	
	return false
end

local function Pulse()
	if UnitIsDeadOrGhost("player") and ResurrectPulse() == false then
		StrictPathFollow()
	else
		bAtEnd = true
	end
end

local function CanPulse()
  local timeNow = GetTime()
  if timeNow >= canPulseAt then
	canPulseAt = timeNow + pulseDelay
    return true
  else
	return false
  end
end

local function Sleepy(secs)
	local timeNow = GetTime()
	
	if canPulseAt > timeNow then --since this func may be used several times in 1 cycle
		local overheadWait = canPulseAt-timeNow;
		canPulseAt = timeNow + overheadWait + secs
	else
		canPulseAt = overheadWait + secs
	end
end

local popMeTime = GetTime() + (startDelay/10)
local releasedSpirit = false

DbgPrint('Starting Corpse Run in '..startDelay..' seconds...')
DbgPrint('Popping Spirit in in '..(startDelay/10)..' seconds...')

frame:SetScript(
  "OnUpdate",
  function(self, elapsed)
	if releasedSpirit == false and (GetTime() > popMeTime) then
		LibDraw.clearCanvas()
		releasedSpirit = true
		RepopMe()
		DbgPrint("Popping Spirit!")
		bRun=true
		bAtEnd=false
	end
	if CanPulse() == true then	
		Pulse()
		ShouldExit()
	end
end)

