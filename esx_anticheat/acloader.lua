local ProhibitedVariables = { -- Add as many as you want from mod menus you find! (Remove war menu if you use it!)
"fESX", "Plane", "TiagoMenu", "Outcasts666", "dexMenu", "Cience", "LynxEvo", "zzzt", "AKTeam",
"gaybuild", "ariesMenu", "WarMenu", "SwagMenu", "Dopamine", "Gatekeeper", "MIOddhwuie", "LeakerMenu", "oTable", "FendinX", "Crusader", "WADUI", "ihrug", "KZjx", "jd366213", "Ggggg", "udwdj", "KAKAAKAKAK",
 "llll4874", "werfvtghiouuiowrfetwerfio", "NyPremium", "scroll", "AlphaV", "FendinXMenu", "Biznes", "Ham", "HamHaxia", "dexMenu", "LynxRevo", "ShaniuMenu", "KoGuSzEk", "AlphaVeta", "InSec",
 "Deer", "e", "Lynx8", "MaestroMenu", "Motion", "MMenu", "LR", "BrutanPremium", "HamMafia", "GRubyMenu", "FantaMenuEvo", "LynxSeven", "HugeV",  "kaeogkeargmioergoeismgsdfg", "iushyiogsyriogyesnoiyhogisueoituoniseronguawoieugoneruioybgoiseryngiubesnyriugyoawfkjdfsghisuhrgiosehoigjseiorhgoisehgovdsfjkghsdoighoersbjosepjibesrbre"
}

local Enabled = true -- Change this to enable client mod menu checks!
function CheckVariables()
    for i, v in pairs(ProhibitedVariables) do
        if _G[v] ~= nil then
            TriggerServerEvent('cipeczka', '[MAC] - Injector Detected('..v..')')
        end
    end
end

 Citizen.CreateThread(function()
     while true do
           Citizen.Wait(30000)
        CheckVariables()
      end
end)