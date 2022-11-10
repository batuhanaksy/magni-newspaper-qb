if Config.Version == "new" then
    QBCore = exports['qb-core']:GetCoreObject()
else 
    QBCore = nil
    TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
end

QBCore.Functions.CreateCallback('magni-newspaper:server:page', function(_, cb)
    if Config.SQL == "oxmysql" then
        local result = MySQL.query.await('SELECT * FROM magni_newspaper')
        if result[1] ~= nil then
            cb(result)
        else
            cb(nil)
        end
    elseif Config.SQL == "ghmattimysql" then
        local result = exports.ghmattimysql:executeSync('SELECT * FROM magni_newspaper')
        if result[1] ~= nil then
            cb(result)
        else
            cb(nil)
        end
    end
end)

QBCore.Commands.Add("editnewspaper", "Edit Newspaper", {}, false, function(source, _)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == Config.Job then
        TriggerClientEvent("magni-newspaper:open", source)
    else
        TriggerClientEvent('QBCore:Notify', source, 'Wrong Job', 'error', 5000)
    end
end)

QBCore.Functions.CreateUseableItem("newspaper", function(source, item)
    if Config.Item then 
        local src = source
        TriggerClientEvent("magni-newspaper:open2", src)
    end
end)


RegisterServerEvent("magni-newspaper:firstpage")
AddEventHandler("magni-newspaper:firstpage", function(data)
    if Config.SQL == "oxmysql" then
        MySQL.update('UPDATE magni_newspaper SET firstpage_header = ?, firstpage = ?, firstpagephoto = ?,time = ?', {data.fpheader, data.fpnews,data.fpphoto,data.time})
    elseif Config.SQL == "ghmattimysql" then
        exports.ghmattimysql:execute('UPDATE magni_newspaper SET thirdpage_header = ?, thirdpage = ?, thirdpagephoto = ?,time = ?', {data.tpheader, data.tpnews, data.tpphoto,data.time})
    end
end)

RegisterServerEvent("magni-newspaper:secondpage")
AddEventHandler("magni-newspaper:secondpage", function(data)
    if Config.SQL == "oxmysql" then
        MySQL.update('UPDATE magni_newspaper SET secondpage_header = ?, secondpage = ?, secondpagephoto = ?,time = ?', {data.spheader, data.spnews,data.spphoto,data.time})
    elseif Config.SQL == "ghmattimysql" then
        exports.ghmattimysql:execute('UPDATE magni_newspaper SET thirdpage_header = ?, thirdpage = ?, thirdpagephoto = ?,time = ?', {data.tpheader, data.tpnews, data.tpphoto,data.time})
    end
end)

RegisterServerEvent("magni-newspaper:thirdpage")
AddEventHandler("magni-newspaper:thirdpage", function(data)
    if Config.SQL == "oxmysql" then
        MySQL.update('UPDATE magni_newspaper SET thirdpage_header = ?, thirdpage = ?, thirdpagephoto = ?,time = ?', {data.tpheader, data.tpnews, data.tpphoto,data.time})
    elseif Config.SQL == "ghmattimysql" then
        exports.ghmattimysql:execute('UPDATE magni_newspaper SET thirdpage_header = ?, thirdpage = ?, thirdpagephoto = ?,time = ?', {data.tpheader, data.tpnews, data.tpphoto,data.time})
    end
end)