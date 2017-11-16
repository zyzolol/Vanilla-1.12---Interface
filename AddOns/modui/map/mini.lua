

    local modZoom = function()
        if not arg1 then return end
        if arg1 > 0 and Minimap:GetZoom() < 5 then
            Minimap:SetZoom(Minimap:GetZoom() + 1)
        elseif arg1 < 0 and Minimap:GetZoom() > 0 then
            Minimap:SetZoom(Minimap:GetZoom() - 1)
        end
    end

    local f = CreateFrame('Frame', nil, Minimap)
    f:EnableMouse(false)
    f:SetPoint('TOPLEFT', Minimap)
    f:SetPoint('BOTTOMRIGHT', Minimap)
    f:EnableMouseWheel(true)
    f:SetScript('OnMouseWheel', modZoom)

    for _, v in pairs({
        MinimapBorderTop,
        MinimapToggleButton,
        MinimapZoomIn,
	    MinimapZoomOut
    }) do
        v:Hide()
    end

    MiniMapTrackingFrame:SetFrameStrata'MEDIUM'
    MiniMapTrackingFrame:ClearAllPoints()
    MiniMapTrackingFrame:SetPoint('BOTTOM', -19, -19)
    MiniMapTrackingFrame:SetScript('OnShow', function()
        GameTimeFrame:ClearAllPoints() GameTimeFrame:SetPoint('BOTTOM', 33, 8)
    end)
    MiniMapTrackingFrame:SetScript('OnHide', function()
        GameTimeFrame:ClearAllPoints() GameTimeFrame:SetPoint('BOTTOM', 12, 10)
    end)

    MiniMapMailFrame:ClearAllPoints()
    MiniMapMailFrame:SetPoint('TOPRIGHT', 0, -10)

    MinimapZoneText:ClearAllPoints()
    MinimapZoneText:SetPoint('TOP', Minimap, 0, 17)

    GameTimeFrame:SetScale(.76)
    GameTimeFrame:ClearAllPoints() GameTimeFrame:SetPoint('BOTTOM', 12, 10)

    --
