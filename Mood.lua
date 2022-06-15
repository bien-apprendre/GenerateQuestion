require("module")

local function Mood(Sentence)
	SetText(Sentence)
	DepStruct=CallService(GetText(),"dep")
	AddStructure(DepStruct,"dep")
	
	SegStruct=CallService(GetText(),"segment")
	AddStructure(SegStruct,"segment")

	Relate("Tab_Event")
	RunFSA("Event")
end

local function GenerateQuestion()
	Relations=GetRelations('ST=Event')
    for i,R in pairs(Relations) do
		Relation=GetWord(R["U1"]).." "..GetWord(R["U2"]).."("..R["R"]..")"
		RoleType = R["R"]
		-- print(RoleType)
		if RoleType == 'A0' then
			KVs=GetRelationKVs(R["U1"],R["U2"],R["R"],'Cat')
			Unit = R["U2"]
			A0 = GetWord(Unit)
			UnitTo = GetUnitKV(Unit,"To")
			Words = GetText(UnitTo+1,-1)
			for i=1,#KVs do
				TypeWord = KVs[i]
				if TypeWord=="people" then
					Question = '谁'..Words..'？'
					print('问题：',Question)
					print('答案：',A0)
				elseif TypeWord=="nr" then
					Question = '谁'..Words..'？'
					print('问题：',Question)
					print('答案：',A0)
				elseif TypeWord=="r" then
					Question = '谁'..Words..'？'
					print('问题：',Question)
					print('答案：',A0)
				elseif TypeWord=="ns" then
					Question = '哪里'..Words..'？'
					print('问题：',Question)
					print('答案：',A0)
				else
					Question = '什么'..Words..'？'
					print('问题：',Question)
					print('答案：',A0)
				end
			end
		elseif RoleType == 'A1' then
			KVs=GetRelationKVs(R["U1"],R["U2"],R["R"],'Cat')
			Unit = R["U2"]
			A1 = GetWord(Unit)
			UnitFrom = GetUnitKV(Unit,"From")
			Words = GetText(0,UnitFrom-1)
			for i=1,#KVs do
				TypeWord = KVs[i]
				if TypeWord=="people" then
					Question = Words..'谁？'
					print('问题：',Question)
					print('答案：',A1)
				elseif TypeWord=="nr" then
					Question = Words..'谁？'
					print('问题：',Question)
					print('答案：',A1)
				elseif TypeWord=="r" then
					Question = Words..'谁？'
					print('问题：',Question)
					print('答案：',A1)
				elseif TypeWord=="ns" then
					Question = Words..'哪里？'
					print('问题：',Question)
					print('答案：',A1)
				else
					Question = Words..'什么？'
					print('问题：',Question)
					print('答案：',A1)
				end
			end
		elseif RoleType == 'Mod' then
			KVs=GetRelationKVs(R["U1"],R["U2"],R["R"],'Mood')
			Unit = R["U2"]
			Mod = GetWord(Unit)
			UnitTo = GetUnitKV(Unit,"To")
			UnitFrom = GetUnitKV(Unit,"From")
			PreWords = GetText(0,UnitFrom-1)
			LastWords = GetText(UnitTo+1,-1)
			for i=1,#KVs do
				TypeWord = KVs[i]
				if TypeWord=="Time" then
					Question = PreWords..'什么时候'..LastWords..'？'
					print('问题：',Question)
					print('答案：',Mod)
				elseif TypeWord=="Degree" then
					Question = PreWords..'有多'..LastWords..'？'
					print('问题：',Question)
					print('答案：',Mod)
				elseif TypeWord=="Number" then
					Question = PreWords..'有多少'..LastWords..'？'
					print('问题：',Question)
					print('答案：',Mod)
				elseif TypeWord=="Scope" then
					Question = PreWords..'什么范围'..LastWords..'？'
					print('问题：',Question)
					print('答案：',Mod)
				elseif TypeWord=="Manner" then
					Question = PreWords..'怎么样'..LastWords..'？'
					print('问题：',Question)
					print('答案：',Mod)
				elseif TypeWord=="Reason" then
					Question = PreWords..'怎么'..LastWords..'？'
					print('问题：',Question)
					print('答案：',Mod)
				elseif TypeWord=="Reason" then
					Question = PreWords..'因为什么'..LastWords..'？'
					print('问题：',Question)
					print('答案：',Mod)
				else
					Question = Words..'什么？'
					print('问题：',Question)
					print('答案：',Mod)
				end
			end
		elseif RoleType == 'Fram' then
			KVs=GetRelationKVs(R["U1"],R["U2"],R["R"],'Mood')
			Unit = R["U2"]
			Mod = GetWord(Unit)
			UnitTo = GetUnitKV(Unit,"To")
			UnitFrom = GetUnitKV(Unit,"From")
			PreWords = GetText(0,UnitFrom-1)
			LastWords = GetText(UnitTo+2,-1)
			for i=1,#KVs do
				TypeWord = KVs[i]
				if TypeWord=="Place" then
					Question = PreWords..'在哪里'..LastWords..'？'
					print('问题：',Question)
					print('答案：',Mod)
				elseif TypeWord=="Neighbor" then
					Question = PreWords..'跟谁'..LastWords..'？'
					print('问题：',Question)
					print('答案：',Mod)
				elseif TypeWord=="Materials" then
					Question = PreWords..'用什么'..LastWords..'？'
					print('问题：',Question)
					print('答案：',Mod)
				elseif TypeWord=="Tools" then
					Question = PreWords..'用什么'..LastWords..'？'
					print('问题：',Question)
					print('答案：',Mod)
				elseif TypeWord=="Reason" then
					Question = PreWords..'因为什么'..LastWords..'？'
					print('问题：',Question)
					print('答案：',Mod)
				elseif TypeWord=="Purpose" then
					Question = PreWords..'为了什么'..LastWords..'？'
					print('问题：',Question)
					print('答案：',Mod)
				elseif TypeWord=="Source" then
					Question = PreWords..'从哪里'..LastWords..'？'
					print('问题：',Question)
					print('答案：',Mod)
				elseif TypeWord=="Golas" then
					Question = PreWords..'为谁'..LastWords..'？'
					print('问题：',Question)
					print('答案：',Mod)
				elseif TypeWord=="Foundation" then
					Question = PreWords..'依据什么'..LastWords..'？'
					print('问题：',Question)
					print('答案：',Mod)
				else
					Question = Words..'什么？'
					print('问题：',Question)
					print('答案：',Mod)
				end
			end
		end
    end
end

local function Demo(Inp,Out)
    IN = io.open(Inp ,"r")
    local Line = IN:read("*l") 
    while(Line ~= nil)
    do
		Mood(Line)
		GenerateQuestion()
		-- module.PrintLog()
		-- module.PrintUnit()
        Line = IN:read("*l") 
    end
    io.close(IN)
end


Demo("Input.txt","ret.txt")