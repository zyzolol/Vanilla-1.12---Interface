local menu = CreateFrame('Frame', 'ufi_options', UIParent)
    menu:SetWidth(360) menu:SetHeight(370)
    menu:SetPoint('CENTER', UIParent)
    menu:SetBackdrop({bgFile   = [[Interface\Tooltips\UI-Tooltip-Background]],
                      edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]],
    				  insets   = {left = 11, right = 12, top = 12, bottom = 11}})
    menu:SetBackdropColor(0, 0, 0, .7)
    menu:SetBackdropBorderColor(.2, .2, .2)
    menu:SetMovable(true) menu:SetUserPlaced(true)
    menu:RegisterForDrag'LeftButton' menu:EnableMouse(true)
    menu:SetScript('OnDragStart', function() menu:StartMoving() end)
    menu:SetScript('OnDragStop', function() menu:StopMovingOrSizing() end)
    menu:Hide();

	menu.x = CreateFrame('Button', 'ufi_optionsCloseButton', menu, 'UIPanelCloseButton')
    menu.x:SetPoint('TOPRIGHT', -6, -6)
    menu.x:SetScript('OnClick', function() menu:Hide() end)

	menu.header = menu:CreateTexture(nil, 'ARTWORK')
    menu.header:SetWidth(256) menu.header:SetHeight(64)
    menu.header:SetPoint('TOP', menu, 0, 12)
    menu.header:SetTexture[[Interface\DialogFrame\UI-DialogBox-Header]]
    menu.header:SetVertexColor(.2, .2, .2)

	menu.header.t = menu:CreateFontString(nil, 'ARTWORK', 'GameFontNormal')
    menu.header.t:SetPoint('TOP', menu.header, 0, -14)
    menu.header.t:SetText'ufi options'

	menu.reload = CreateFrame('Button', 'ufi_optionsreload', menu, 'UIPanelButtonTemplate')
    menu.reload:SetWidth(100) menu.reload:SetHeight(20)
    menu.reload:SetText'Reload UI'
    menu.reload:SetFont(STANDARD_TEXT_FONT, 10)
    menu.reload:SetPoint('TOP', menu, 0, -420)
    menu.reload:Hide()

	function reload_request()
		menu.reload:Show();
		menu:SetHeight(470);
	end

	menu.reload.description = menu.reload:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.reload.description:SetPoint('TOP', menu.reload, 0, 30)
    menu.reload.description:SetWidth(200)
    menu.reload.description:SetText'Your new settings require a UI reload to take effect.'

	menu.reload:SetScript('OnClick', ReloadUI)

	menu.intro = menu:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    --menu.intro:SetTextColor(colour.r, colour.g, colour.b)
    menu.intro:SetPoint('TOP', menu, 0, -30)
    menu.intro:SetWidth(280)
    menu.intro:SetText'Hello! You are using |cffff6c6cUFI|r v0.99. This is a beta version so please report any issues to:'
	
	menu.uilink = CreateFrame('EditBox', 'ufi_uilink', menu, 'InputBoxTemplate')
    menu.uilink:SetFont(STANDARD_TEXT_FONT, 12)
    menu.uilink:SetWidth(250) 
	menu.uilink:SetHeight(10)
    menu.uilink:SetPoint('TOP', menu.intro, 'BOTTOM', 0, -10)
    menu.uilink:SetAutoFocus(false)
    --menu.uilink:SetScript('OnShow', function()
    menu.uilink:SetText'github.com/Ko0z/UnitFramesImproved_Vanilla'
    --end)
	-------------------------------------------------
	--classportraits checkbutton
	menu.classportrait = CreateFrame('CheckButton', 'ufi_classportraits', menu, 'UICheckButtonTemplate')
    menu.classportrait:SetHeight(20) menu.classportrait:SetWidth(20)
    menu.classportrait:SetPoint('TOPLEFT', menu, 20, -80)
	_G[menu.classportrait:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.classportrait:GetName()..'Text']:SetWidth(270)
    _G[menu.classportrait:GetName()..'Text']:SetPoint('LEFT', menu.classportrait, 'RIGHT', 4, 0)
    _G[menu.classportrait:GetName()..'Text']:SetText'Class Portraits'
	----------------------------------------------------
	--darkmode checkbutton
	menu.darkmode = CreateFrame('CheckButton', 'ufi_darkmode', menu, 'UICheckButtonTemplate')
    menu.darkmode:SetHeight(20) menu.darkmode:SetWidth(20)
    menu.darkmode:SetPoint('TOPLEFT', menu, 20, -100)
	_G[menu.darkmode:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.darkmode:GetName()..'Text']:SetWidth(270)
    _G[menu.darkmode:GetName()..'Text']:SetPoint('LEFT', menu.darkmode, 'RIGHT', 4, 0)
    _G[menu.darkmode:GetName()..'Text']:SetText'Dark Mode'
	----------------------------------------------------
	--name text outline checkbutton
	menu.textoutline = CreateFrame('CheckButton', 'ufi_textoutline', menu, 'UICheckButtonTemplate')
    menu.textoutline:SetHeight(20) menu.textoutline:SetWidth(20)
    menu.textoutline:SetPoint('TOPLEFT', menu, 20, -120)
	_G[menu.textoutline:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.textoutline:GetName()..'Text']:SetWidth(270)
    _G[menu.textoutline:GetName()..'Text']:SetPoint('LEFT', menu.textoutline, 'RIGHT', 4, 0)
    _G[menu.textoutline:GetName()..'Text']:SetText'Font Outline'
	-----------------------------------------------------
	--NPC Class Color checkbutton
	menu.npcclasscolor = CreateFrame('CheckButton', 'ufi_npcclasscolor', menu, 'UICheckButtonTemplate')
    menu.npcclasscolor:SetHeight(20) menu.npcclasscolor:SetWidth(20)
    menu.npcclasscolor:SetPoint('TOPLEFT', menu, 120, -80)
	_G[menu.npcclasscolor:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.npcclasscolor:GetName()..'Text']:SetWidth(270)
    _G[menu.npcclasscolor:GetName()..'Text']:SetPoint('LEFT', menu.npcclasscolor, 'RIGHT', 4, 0)
    _G[menu.npcclasscolor:GetName()..'Text']:SetText'NPC Class Colors'
	----------------------------------------------------
	--Player Class Color checkbutton
	menu.playerclasscolor = CreateFrame('CheckButton', 'ufi_playerclasscolor', menu, 'UICheckButtonTemplate')
    menu.playerclasscolor:SetHeight(20) menu.playerclasscolor:SetWidth(20)
    menu.playerclasscolor:SetPoint('TOPLEFT', menu, 120, -100)
	_G[menu.playerclasscolor:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.playerclasscolor:GetName()..'Text']:SetWidth(270)
    _G[menu.playerclasscolor:GetName()..'Text']:SetPoint('LEFT', menu.playerclasscolor, 'RIGHT', 4, 0)
    _G[menu.playerclasscolor:GetName()..'Text']:SetText'Player Class Color'
	----------------------------------------------------
	--Percentage checkbutton
	menu.percentage = CreateFrame('CheckButton', 'ufi_percentage', menu, 'UICheckButtonTemplate')
    menu.percentage:SetHeight(20) menu.percentage:SetWidth(20)
    menu.percentage:SetPoint('TOPLEFT', menu, 120, -120)
	_G[menu.percentage:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.percentage:GetName()..'Text']:SetWidth(270)
    _G[menu.percentage:GetName()..'Text']:SetPoint('LEFT', menu.percentage, 'RIGHT', 4, 0)
    _G[menu.percentage:GetName()..'Text']:SetText'Show Percentages'
	----------------------------------------------------
	--True Format over 10k checkbutton
	menu.trueformat = CreateFrame('CheckButton', 'ufi_trueformat', menu, 'UICheckButtonTemplate')
    menu.trueformat:SetHeight(20) menu.trueformat:SetWidth(20)
    menu.trueformat:SetPoint('TOPLEFT', menu, 240, -80)
	_G[menu.trueformat:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.trueformat:GetName()..'Text']:SetWidth(270)
    _G[menu.trueformat:GetName()..'Text']:SetPoint('LEFT', menu.trueformat, 'RIGHT', 4, 0)
    _G[menu.trueformat:GetName()..'Text']:SetText'Format HP<10k'
	----------------------------------------------------
	--Hide Pet Text checkbutton
	menu.hidepettext = CreateFrame('CheckButton', 'ufi_hidepettext', menu, 'UICheckButtonTemplate')
    menu.hidepettext:SetHeight(20) menu.hidepettext:SetWidth(20)
    menu.hidepettext:SetPoint('TOPLEFT', menu, 240, -100)
	_G[menu.hidepettext:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.hidepettext:GetName()..'Text']:SetWidth(270)
    _G[menu.hidepettext:GetName()..'Text']:SetPoint('LEFT', menu.hidepettext, 'RIGHT', 4, 0)
    _G[menu.hidepettext:GetName()..'Text']:SetText'Hide Pet Text'
	----------------------------------------------------
	--Flat Statusbars checkbutton
	menu.healthtexture = CreateFrame('CheckButton', 'ufi_healthtexture', menu, 'UICheckButtonTemplate')
    menu.healthtexture:SetHeight(20) menu.healthtexture:SetWidth(20)
    menu.healthtexture:SetPoint('TOPLEFT', menu, 240, -120)
	_G[menu.healthtexture:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.healthtexture:GetName()..'Text']:SetWidth(270)
    _G[menu.healthtexture:GetName()..'Text']:SetPoint('LEFT', menu.healthtexture, 'RIGHT', 4, 0)
    _G[menu.healthtexture:GetName()..'Text']:SetText'Flat Statusbars'
	----------------------------------------------------
	--Status glow hide checkbutton
	menu.statusglow = CreateFrame('CheckButton', 'ufi_statusglow', menu, 'UICheckButtonTemplate')
    menu.statusglow:SetHeight(20) menu.statusglow:SetWidth(20)
    menu.statusglow:SetPoint('TOPLEFT', menu, 20, -140)
	_G[menu.statusglow:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.statusglow:GetName()..'Text']:SetWidth(270)
    _G[menu.statusglow:GetName()..'Text']:SetPoint('LEFT', menu.statusglow, 'RIGHT', 4, 0)
    _G[menu.statusglow:GetName()..'Text']:SetText'Status Glow'
	-----------------------------------------------------
	--BUTTON
	
	menu.unlock = CreateFrame('Button', 'ufi_lock', menu, 'UIPanelButtonTemplate')
    menu.unlock:SetWidth(100) 
	menu.unlock:SetHeight(20)
    menu.unlock:SetText'Unlock/Lock'
    menu.unlock:SetFont(STANDARD_TEXT_FONT, 10)
    menu.unlock:SetPoint('TOPLEFT', menu, 25, -335)
	--menu.unlock:Disable();

	menu.resetdefault = CreateFrame('Button', 'ufi_resetdefault', menu, 'UIPanelButtonTemplate')
    menu.resetdefault:SetWidth(100) 
	menu.resetdefault:SetHeight(20)
    menu.resetdefault:SetText'Reset to default'
    menu.resetdefault:SetFont(STANDARD_TEXT_FONT, 10)
    menu.resetdefault:SetPoint('TOPRIGHT', menu, -25, -335)
	
	----------------------------------------------------
	-- Name Text X Slider
	menu.nametextX = CreateFrame('Slider', 'ufi_optionsnametextX', menu, 'OptionsSliderTemplate')
    menu.nametextX:SetWidth(200) 
	menu.nametextX:SetHeight(16)
    menu.nametextX:SetPoint('TOP', menu, 0, -180)
    menu.nametextX:SetMinMaxValues(-40, 40)
    menu.nametextX:SetValue(0)
    menu.nametextX:SetValueStep(1)
    menu.nametextX:SetScript('OnValueChanged', function()

        UnitFramesImprovedConfig.NameTextX = menu.nametextX:GetValue();

		PlayerName:SetPoint("CENTER", PlayerFrameHealthBar, "Center", UnitFramesImprovedConfig.NameTextX, UnitFramesImprovedConfig.NameTextY+5); 
		TargetName:SetPoint("CENTER", TargetFrameHealthBar, "Center", -UnitFramesImprovedConfig.NameTextX, UnitFramesImprovedConfig.NameTextY+5); 
    end)

    _G[menu.nametextX:GetName()..'Low']:SetText''
    _G[menu.nametextX:GetName()..'High']:SetText''
    _G[menu.nametextX:GetName()..'Text']:SetText'Name position X'
	-----------------------------------------------------
	-- Name Text Y Slider
	menu.nametextY = CreateFrame('Slider', 'ufi_optionsnametextY', menu, 'OptionsSliderTemplate')
    menu.nametextY:SetWidth(200) 
	menu.nametextY:SetHeight(16)
    menu.nametextY:SetPoint('TOP', menu, 0, -210)
    menu.nametextY:SetMinMaxValues(-40, 40)
    menu.nametextY:SetValue(0)
    menu.nametextY:SetValueStep(1)
    menu.nametextY:SetScript('OnValueChanged', function()

        UnitFramesImprovedConfig.NameTextY = menu.nametextY:GetValue();
		PlayerName:SetPoint("CENTER", PlayerFrameHealthBar, "Center", UnitFramesImprovedConfig.NameTextX, UnitFramesImprovedConfig.NameTextY+5); 
		TargetName:SetPoint("CENTER", TargetFrameHealthBar, "Center", -UnitFramesImprovedConfig.NameTextX, UnitFramesImprovedConfig.NameTextY+5); 
    end)

    _G[menu.nametextY:GetName()..'Low']:SetText''
    _G[menu.nametextY:GetName()..'High']:SetText''
    _G[menu.nametextY:GetName()..'Text']:SetText'Name position Y'
	-----------------------------------------------------------
	-- Name Font Size Slider
	menu.nametextfontsize = CreateFrame('Slider', 'ufi_optionsnametextfontsize', menu, 'OptionsSliderTemplate')
    menu.nametextfontsize:SetWidth(200) 
	menu.nametextfontsize:SetHeight(16)
    menu.nametextfontsize:SetPoint('TOP', menu, 0, -240)
    menu.nametextfontsize:SetMinMaxValues(7, 14)
    menu.nametextfontsize:SetValue(10)
    menu.nametextfontsize:SetValueStep(1)
    menu.nametextfontsize:SetScript('OnValueChanged', function()

        UnitFramesImprovedConfig.NameTextFontSize = menu.nametextfontsize:GetValue();
		if UnitFramesImprovedConfig.NameOutline == 1 then
			PlayerName:SetFont("Fonts\\FRIZQT__.TTF", UnitFramesImprovedConfig.NameTextFontSize, "OUTLINE");
			TargetName:SetFont("Fonts\\FRIZQT__.TTF", UnitFramesImprovedConfig.NameTextFontSize, "OUTLINE");
		else
			PlayerName:SetFont("Fonts\\FRIZQT__.TTF", UnitFramesImprovedConfig.NameTextFontSize);
			TargetName:SetFont("Fonts\\FRIZQT__.TTF", UnitFramesImprovedConfig.NameTextFontSize);
		end
    end)

    _G[menu.nametextfontsize:GetName()..'Low']:SetText''
    _G[menu.nametextfontsize:GetName()..'High']:SetText''
    _G[menu.nametextfontsize:GetName()..'Text']:SetText'Name Font Size'
	-----------------------------------------------------------
	-- HP/MP Font Size Slider
	menu.hpfontsize = CreateFrame('Slider', 'ufi_optionshpfontsize', menu, 'OptionsSliderTemplate')
    menu.hpfontsize:SetWidth(200) 
	menu.hpfontsize:SetHeight(16)
    menu.hpfontsize:SetPoint('TOP', menu, 0, -270)
    menu.hpfontsize:SetMinMaxValues(7, 14)
    menu.hpfontsize:SetValue(10)
    menu.hpfontsize:SetValueStep(1)
    menu.hpfontsize:SetScript('OnValueChanged', function()

        UnitFramesImprovedConfig.HPFontSize = menu.hpfontsize:GetValue();
		
		if UnitFramesImprovedConfig.NameOutline == 1 then
			PlayerFrameHealthBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize, 'OUTLINE');
			PlayerFrameManaBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize, 'OUTLINE');
			MobHealth3BlizzardHealthText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize, 'OUTLINE')
			MobHealth3BlizzardPowerText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize, 'OUTLINE')
			PetFrameHealthBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize, 'OUTLINE');
			PetFrameManaBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize, 'OUTLINE');
		else
			PlayerFrameHealthBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize);
			PlayerFrameManaBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize);
			MobHealth3BlizzardHealthText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize)
			MobHealth3BlizzardPowerText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize)
			PetFrameHealthBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize);
			PetFrameManaBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize);
		end
		
    end)

    _G[menu.hpfontsize:GetName()..'Low']:SetText''
    _G[menu.hpfontsize:GetName()..'High']:SetText''
    _G[menu.hpfontsize:GetName()..'Text']:SetText'HP/MP Font Size'
	-----------------------------------------------------------
	-- OnClick Button functions
	menu.classportrait:SetScript('OnClick', function()
        if this:GetChecked() == 1 then 
			UnitFramesImprovedConfig.ClassPortrait = true;
			reload_request();
		else 
			UnitFramesImprovedConfig.ClassPortrait = false;
			reload_request();
		end
    end)

	menu.darkmode:SetScript('OnClick', function()
        if this:GetChecked() == 1 then 
			UnitFramesImprovedConfig.DarkMode = true;
			UNITFRAMESIMPROVED_UI_COLOR = {r = .3, g = .3, b = .3}
			UnitFramesImproved_DarkMode();
			--reload_request();
		else 
			UnitFramesImprovedConfig.DarkMode = false;
			UNITFRAMESIMPROVED_UI_COLOR = {r = 1, g = 1, b = 1}
			UnitFramesImproved_DarkMode();
			--reload_request();
		end
    end)

	menu.textoutline:SetScript('OnClick', function()
        if this:GetChecked() == 1 then 
			UnitFramesImprovedConfig.NameOutline = 1;
			PlayerName:SetFont("Fonts\\FRIZQT__.TTF", UnitFramesImprovedConfig.NameTextFontSize, "OUTLINE");
			TargetName:SetFont("Fonts\\FRIZQT__.TTF", UnitFramesImprovedConfig.NameTextFontSize, "OUTLINE");
			PlayerFrameHealthBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize, 'OUTLINE');
			PlayerFrameManaBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize, 'OUTLINE');
			PetName:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE");
			PetFrameHealthBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize, 'OUTLINE');
			PetFrameManaBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize, 'OUTLINE');
			MobHealth3BlizzardHealthText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize, 'OUTLINE')
			MobHealth3BlizzardPowerText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize, 'OUTLINE') 
		else 
			UnitFramesImprovedConfig.NameOutline = 0;
			PlayerName:SetFont("Fonts\\FRIZQT__.TTF", UnitFramesImprovedConfig.NameTextFontSize);
			TargetName:SetFont("Fonts\\FRIZQT__.TTF", UnitFramesImprovedConfig.NameTextFontSize);
			PlayerFrameHealthBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize);
			PlayerFrameManaBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize);
			PetName:SetFont("Fonts\\FRIZQT__.TTF", 10);
			PetFrameHealthBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize);
			PetFrameManaBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize);
			MobHealth3BlizzardHealthText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize)
			MobHealth3BlizzardPowerText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize) 
		end
    end)

	menu.npcclasscolor:SetScript('OnClick', function()
        if this:GetChecked() == 1 then 
			UnitFramesImprovedConfig.NPCClassColor = 1;
		else 
			UnitFramesImprovedConfig.NPCClassColor = 0;
		end
    end)

	menu.playerclasscolor:SetScript('OnClick', function()
        if this:GetChecked() == 1 then 
			UnitFramesImprovedConfig.PlayerClassColor = 1;
			PlayerFrameHealthBar:SetStatusBarColor(UnitColor("player"));
			--UnitFramesImproved_ColorUpdate();
		else 
			UnitFramesImprovedConfig.PlayerClassColor = 0;
			PlayerFrameHealthBar:SetStatusBarColor(0,1,0);
			--UnitFramesImproved_ColorUpdate();
		end
    end)

	menu.percentage:SetScript('OnClick', function()
        if this:GetChecked() == 1 then 
			UnitFramesImprovedConfig.Percentage = 1;
			TextStatusBar_UpdateTextString(PlayerFrame.healthbar);
			TextStatusBar_UpdateTextString(PlayerFrame.manabar);
			TextStatusBar_UpdateTextString(PetFrame.healthbar);
			TextStatusBar_UpdateTextString(PetFrame.manabar);
			MH3Blizz:HealthUpdate();
			MH3Blizz:PowerUpdate();
		else 
			UnitFramesImprovedConfig.Percentage = 0;
			TextStatusBar_UpdateTextString(PlayerFrame.healthbar);
			TextStatusBar_UpdateTextString(PlayerFrame.manabar);
			TextStatusBar_UpdateTextString(PetFrame.healthbar);
			TextStatusBar_UpdateTextString(PetFrame.manabar);
			MH3Blizz:HealthUpdate();
			MH3Blizz:PowerUpdate();
		end
    end)

	menu.trueformat:SetScript('OnClick', function()
        if this:GetChecked() == 1 then 
			UnitFramesImprovedConfig.TrueFormat = 1;
			TextStatusBar_UpdateTextString(PlayerFrame.healthbar);
			TextStatusBar_UpdateTextString(PlayerFrame.manabar);
			TextStatusBar_UpdateTextString(PetFrame.healthbar);
			TextStatusBar_UpdateTextString(PetFrame.manabar);
			MH3Blizz:HealthUpdate();
			MH3Blizz:PowerUpdate();
		else 
			UnitFramesImprovedConfig.TrueFormat = 0;
			TextStatusBar_UpdateTextString(PlayerFrame.healthbar);
			TextStatusBar_UpdateTextString(PlayerFrame.manabar);
			TextStatusBar_UpdateTextString(PetFrame.healthbar);
			TextStatusBar_UpdateTextString(PetFrame.manabar);
			MH3Blizz:HealthUpdate();
			MH3Blizz:PowerUpdate();
		end
    end)

	menu.hidepettext:SetScript('OnClick', function()
        if this:GetChecked() == 1 then 
			UnitFramesImprovedConfig.HidePetText = 1;
			TextStatusBar_UpdateTextString(PetFrame.healthbar);
			TextStatusBar_UpdateTextString(PetFrame.manabar);
		else 
			UnitFramesImprovedConfig.HidePetText = 0;
			TextStatusBar_UpdateTextString(PetFrame.healthbar);
			TextStatusBar_UpdateTextString(PetFrame.manabar);
		end
    end)

	menu.healthtexture:SetScript('OnClick', function()
        if this:GetChecked() == 1 then 
			UnitFramesImprovedConfig.HealthTexture = 1;
			UnitFramesImproved_HealthBarTexture(FLAT_TEXTURE);
		else 
			UnitFramesImprovedConfig.HealthTexture = 0;
			UnitFramesImproved_HealthBarTexture(ORIG_TEXTURE);
		end
    end)

	menu.statusglow:SetScript('OnClick', function()
        if this:GetChecked() == 1 then 
			UnitFramesImprovedConfig.StatusGlow = 1;
			PlayerStatusTexture:SetTexture("Interface\\Addons\\UnitFramesImproved_Vanilla\\Textures\\UI-Player-Status");
			PetAttackModeTexture:SetTexture(PET_ATTACK_TEXTURE);
		else 
			UnitFramesImprovedConfig.StatusGlow = 0;
			PetAttackModeTexture:SetTexture(nil);
			PlayerStatusTexture:SetTexture(nil);
		end
    end)

	menu.resetdefault:SetScript('OnClick', function()
        StaticPopup_Show("DEFAULT_RELOAD");
    end)

	local ufi_locked = true;
	menu.unlock:SetScript('OnClick', function()
        if ufi_locked == true then
			local function PlayerDragStart()
			PlayerFrame:StartMoving();
			end
			local function PlayerDragStop()
				PlayerFrame:StopMovingOrSizing();
			end
			local function TargetDragStart()
				TargetFrame:StartMoving();
			end
			local function TargetDragStop()
				TargetFrame:StopMovingOrSizing();
			end
			PlayerFrame:SetClampedToScreen(true);
			TargetFrame:SetClampedToScreen(true);
			PlayerFrame:SetMovable(true);
			PlayerFrame:EnableMouse(true);
			PlayerFrame:RegisterForDrag("LeftButton");
			PlayerFrame:SetScript("OnDragStart", PlayerDragStart);
			PlayerFrame:SetScript("OnDragStop", PlayerDragStop);
			ufi_chattext( fontRed.. ' PlayerFrame Unlocked' );
			TargetFrame:SetMovable(true);
			TargetFrame:EnableMouse(true);
			TargetFrame:RegisterForDrag("LeftButton");
			TargetFrame:SetScript("OnDragStart", TargetDragStart);
			TargetFrame:SetScript("OnDragStop", TargetDragStop);
			ufi_chattext( fontRed.. ' TargetFrame Unlocked' );
			PlayerFrameTexture:SetVertexColor(0, 1, 0);
			TargetFrameTexture:SetVertexColor(0, 1, 0);
			ufi_locked = false;
			return
		else
			PlayerFrame:SetClampedToScreen(false);
			TargetFrame:SetClampedToScreen(false);
			if UnitFramesImprovedConfig.DarkMode == true then
				PlayerFrameTexture:SetVertexColor(UNITFRAMESIMPROVED_UI_COLOR.r, UNITFRAMESIMPROVED_UI_COLOR.g, UNITFRAMESIMPROVED_UI_COLOR.b)
				TargetFrameTexture:SetVertexColor(UNITFRAMESIMPROVED_UI_COLOR.r, UNITFRAMESIMPROVED_UI_COLOR.g, UNITFRAMESIMPROVED_UI_COLOR.b)
			else
				PlayerFrameTexture:SetVertexColor(1, 1, 1);
				TargetFrameTexture:SetVertexColor(1, 1, 1);
			end
			PlayerFrame:StopMovingOrSizing();
			TargetFrame:StopMovingOrSizing();
			PlayerFrame:SetScript("OnDragStart", nil);
			PlayerFrame:SetScript("OnDragStop", nil);
			TargetFrame:SetScript("OnDragStart", nil);
			TargetFrame:SetScript("OnDragStop", nil);
			PlayerFrame:IsUserPlaced(true);
			TargetFrame:IsUserPlaced(true);
			ufi_chattext( fontLightGreen.. ' PlayerFrame Locked' )
			ufi_chattext( fontLightGreen.. ' TargetFrame Locked' )
			ufi_locked = true;
			return
		end
    end)

	------------------------------------------------------------
	local f = CreateFrame'Frame'
    f:RegisterEvent'PLAYER_ENTERING_WORLD'
    f:SetScript('OnEvent', function()
        
        if UnitFramesImprovedConfig.ClassPortrait == true then 
			menu.classportrait:SetChecked(true) 
		else 
			menu.classportrait:SetChecked(false) 
		end

		if UnitFramesImprovedConfig.DarkMode == true then 
			menu.darkmode:SetChecked(true) 
		else 
			menu.darkmode:SetChecked(false) 
		end

		if UnitFramesImprovedConfig.NameOutline == 1 then 
			menu.textoutline:SetChecked(true) 
		else 
			menu.textoutline:SetChecked(false) 
		end

		if UnitFramesImprovedConfig.NPCClassColor == 1 then 
			menu.npcclasscolor:SetChecked(true) 
		else 
			menu.npcclasscolor:SetChecked(false) 
		end

		if UnitFramesImprovedConfig.PlayerClassColor == 1 then 
			menu.playerclasscolor:SetChecked(true) 
		else 
			menu.playerclasscolor:SetChecked(false) 
		end

		if UnitFramesImprovedConfig.Percentage == 1 then 
			menu.percentage:SetChecked(true) 
		else 
			menu.percentage:SetChecked(false) 
		end

		if UnitFramesImprovedConfig.TrueFormat == 1 then 
			menu.trueformat:SetChecked(true) 
		else 
			menu.trueformat:SetChecked(false) 
		end

		if UnitFramesImprovedConfig.HidePetText == 1 then 
			menu.hidepettext:SetChecked(true) 
		else 
			menu.hidepettext:SetChecked(false) 
		end

		if UnitFramesImprovedConfig.HealthTexture == 1 then 
			menu.healthtexture:SetChecked(true) 
		else 
			menu.healthtexture:SetChecked(false) 
		end

		if UnitFramesImprovedConfig.StatusGlow == 1 then 
			menu.statusglow:SetChecked(true) 
		else 
			menu.statusglow:SetChecked(false) 
		end

		if UnitFramesImprovedConfig.NameTextX then
			menu.nametextX:SetValue(UnitFramesImprovedConfig.NameTextX)
		else 
			menu.nametextX:SetValue(0)
		end

		if UnitFramesImprovedConfig.NameTextY then
			menu.nametextY:SetValue(UnitFramesImprovedConfig.NameTextY)
		else 
			menu.nametextY:SetValue(0)
		end

		if UnitFramesImprovedConfig.NameTextFontSize then
			menu.nametextfontsize:SetValue(UnitFramesImprovedConfig.NameTextFontSize)
		else 
			menu.nametextfontsize:SetValue(11)
		end

		if UnitFramesImprovedConfig.HPFontSize then
			menu.hpfontsize:SetValue(UnitFramesImprovedConfig.HPFontSize)
		else 
			menu.hpfontsize:SetValue(10)
		end

		PlayerName:SetPoint("CENTER", PlayerFrameHealthBar, "Center", UnitFramesImprovedConfig.NameTextX, UnitFramesImprovedConfig.NameTextY+5);
		TargetName:SetPoint("CENTER", TargetFrameHealthBar, "Center", -UnitFramesImprovedConfig.NameTextX, UnitFramesImprovedConfig.NameTextY+5); 

		if UnitFramesImprovedConfig.NameOutline == 1 then
			PlayerName:SetFont("Fonts\\FRIZQT__.TTF", UnitFramesImprovedConfig.NameTextFontSize, "OUTLINE");
			TargetName:SetFont("Fonts\\FRIZQT__.TTF", UnitFramesImprovedConfig.NameTextFontSize, "OUTLINE");
			PetName:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE");
		else
			PlayerName:SetFont("Fonts\\FRIZQT__.TTF", UnitFramesImprovedConfig.NameTextFontSize);
			TargetName:SetFont("Fonts\\FRIZQT__.TTF", UnitFramesImprovedConfig.NameTextFontSize);
			PetName:SetFont("Fonts\\FRIZQT__.TTF", 10);
		end

		if ufi_modui == true then
			menu.darkmode:Disable();
			menu.unlock:Disable();
			menu.playerclasscolor:Disable();
			menu.percentage:Disable();
			menu.healthtexture:Disable();
			_G[menu.darkmode:GetName()..'Text']:SetText'|cffff6c6cmodUI locked|r'
			_G[menu.playerclasscolor:GetName()..'Text']:SetText'|cffff6c6cmodUI locked|r'
			_G[menu.percentage:GetName()..'Text']:SetText'|cffff6c6cmodUI locked|r'
			_G[menu.healthtexture:GetName()..'Text']:SetText'|cffff6c6cmodUI locked|r'
		else
			if UnitFramesImprovedConfig.NameOutline == 1 then
				PlayerFrameHealthBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize, 'OUTLINE');
				-- GREEN HP
				--PlayerFrameHealthBarText:SetVertexColor(0, 1, 0);
				PlayerFrameManaBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize, 'OUTLINE');
				PetFrameHealthBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize, 'OUTLINE');
				PetFrameManaBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize, 'OUTLINE');
			else
				PlayerFrameHealthBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize);
				-- GREEN HP
				--PlayerFrameHealthBarText:SetVertexColor(0, 1, 0);
				PlayerFrameManaBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize);
				PetFrameHealthBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize);
				PetFrameManaBarText:SetFont(STANDARD_TEXT_FONT, UnitFramesImprovedConfig.HPFontSize);
			end
			PlayerFrameHealthBarText:SetJustifyV'MIDDLE'
			PlayerFrameManaBarText:SetJustifyV'MIDDLE'
			PetFrameHealthBarText:SetJustifyV'MIDDLE'
			PetFrameManaBarText:SetJustifyV'MIDDLE'
		end

    end)
	-------------------------------------------------------------------------
	StaticPopupDialogs["DEFAULT_RELOAD"] = {
	text = "Are you sure you want to reset defualt settings?",
	button1 = "Yes and Reload UI",
	button2 = "Ignore",
	OnAccept = function()
		UnitFramesImprovedConfig.ClassPortrait = false
		UnitFramesImprovedConfig.DarkMode = false
		UnitFramesImprovedConfig.NameTextX = 0		
		UnitFramesImprovedConfig.NameTextY = 0
		UnitFramesImprovedConfig.NameTextFontSize = 11
		UnitFramesImprovedConfig.HPFontSize = 10
		UnitFramesImprovedConfig.NameOutline = 1
		UnitFramesImprovedConfig.NPCClassColor = 0
		UnitFramesImprovedConfig.PlayerClassColor = 1
		UnitFramesImprovedConfig.Percentage = 1
		UnitFramesImprovedConfig.TrueFormat = 1
		UnitFramesImprovedConfig.HidePetText = 0
		UnitFramesImprovedConfig.HealthTexture = 0
		UnitFramesImprovedConfig.StatusGlow = 1
		ReloadUI();
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true
}

	fontLightBlue = "|cff00e0ff"
	fontLightGreen = "|cff60ff60"
	fontLightRed = "|cffff8080"
	fontRed = "|cffff0000"
	fontOrange = "|cffff7000"
	fontWhite = "|cffffffff"
	fontGreen = "|cff00ff00"

	SLASH_UFI_OPTIONS1 = '/ufi'
    SlashCmdList['UFI_OPTIONS'] = function(arg)
        if menu:IsShown() then menu:Hide() else menu:Show() end
    end

	