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
					Question = '˭'..Words..'��'
					print('���⣺',Question)
					print('�𰸣�',A0)
				elseif TypeWord=="nr" then
					Question = '˭'..Words..'��'
					print('���⣺',Question)
					print('�𰸣�',A0)
				elseif TypeWord=="r" then
					Question = '˭'..Words..'��'
					print('���⣺',Question)
					print('�𰸣�',A0)
				elseif TypeWord=="ns" then
					Question = '����'..Words..'��'
					print('���⣺',Question)
					print('�𰸣�',A0)
				else
					Question = 'ʲô'..Words..'��'
					print('���⣺',Question)
					print('�𰸣�',A0)
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
					Question = Words..'˭��'
					print('���⣺',Question)
					print('�𰸣�',A1)
				elseif TypeWord=="nr" then
					Question = Words..'˭��'
					print('���⣺',Question)
					print('�𰸣�',A1)
				elseif TypeWord=="r" then
					Question = Words..'˭��'
					print('���⣺',Question)
					print('�𰸣�',A1)
				elseif TypeWord=="ns" then
					Question = Words..'���'
					print('���⣺',Question)
					print('�𰸣�',A1)
				else
					Question = Words..'ʲô��'
					print('���⣺',Question)
					print('�𰸣�',A1)
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
					Question = PreWords..'ʲôʱ��'..LastWords..'��'
					print('���⣺',Question)
					print('�𰸣�',Mod)
				elseif TypeWord=="Degree" then
					Question = PreWords..'�ж�'..LastWords..'��'
					print('���⣺',Question)
					print('�𰸣�',Mod)
				elseif TypeWord=="Number" then
					Question = PreWords..'�ж���'..LastWords..'��'
					print('���⣺',Question)
					print('�𰸣�',Mod)
				elseif TypeWord=="Scope" then
					Question = PreWords..'ʲô��Χ'..LastWords..'��'
					print('���⣺',Question)
					print('�𰸣�',Mod)
				elseif TypeWord=="Manner" then
					Question = PreWords..'��ô��'..LastWords..'��'
					print('���⣺',Question)
					print('�𰸣�',Mod)
				elseif TypeWord=="Reason" then
					Question = PreWords..'��ô'..LastWords..'��'
					print('���⣺',Question)
					print('�𰸣�',Mod)
				elseif TypeWord=="Reason" then
					Question = PreWords..'��Ϊʲô'..LastWords..'��'
					print('���⣺',Question)
					print('�𰸣�',Mod)
				else
					Question = Words..'ʲô��'
					print('���⣺',Question)
					print('�𰸣�',Mod)
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
					Question = PreWords..'������'..LastWords..'��'
					print('���⣺',Question)
					print('�𰸣�',Mod)
				elseif TypeWord=="Neighbor" then
					Question = PreWords..'��˭'..LastWords..'��'
					print('���⣺',Question)
					print('�𰸣�',Mod)
				elseif TypeWord=="Materials" then
					Question = PreWords..'��ʲô'..LastWords..'��'
					print('���⣺',Question)
					print('�𰸣�',Mod)
				elseif TypeWord=="Tools" then
					Question = PreWords..'��ʲô'..LastWords..'��'
					print('���⣺',Question)
					print('�𰸣�',Mod)
				elseif TypeWord=="Reason" then
					Question = PreWords..'��Ϊʲô'..LastWords..'��'
					print('���⣺',Question)
					print('�𰸣�',Mod)
				elseif TypeWord=="Purpose" then
					Question = PreWords..'Ϊ��ʲô'..LastWords..'��'
					print('���⣺',Question)
					print('�𰸣�',Mod)
				elseif TypeWord=="Source" then
					Question = PreWords..'������'..LastWords..'��'
					print('���⣺',Question)
					print('�𰸣�',Mod)
				elseif TypeWord=="Golas" then
					Question = PreWords..'Ϊ˭'..LastWords..'��'
					print('���⣺',Question)
					print('�𰸣�',Mod)
				elseif TypeWord=="Foundation" then
					Question = PreWords..'����ʲô'..LastWords..'��'
					print('���⣺',Question)
					print('�𰸣�',Mod)
				else
					Question = Words..'ʲô��'
					print('���⣺',Question)
					print('�𰸣�',Mod)
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