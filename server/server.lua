ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterServerEvent('ytzdev-jobs:itemal')
AddEventHandler('ytzdev-jobs:itemal', function(source, ItemName, count, removeItem, ilkitem, ilkitemcount)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem = xPlayer.getInventoryItem(ilkitem)

    if removeItem == true then
        if xPlayer.canCarryItem(ItemName, count) then
            if xItem.count >= ilkitemcount then
            xPlayer.removeInventoryItem(ilkitem, ilkitemcount)
            xPlayer.addInventoryItem(ItemName, count) 
            else
                xPlayer.showNotification("Bu Eşyadan Üstünüzde Yeterli Miktar Mevcut Değil [" ..string.upper(ilkitem).. "] üstünüzde olması gereken miktar"..ilkitemcount)
            end
        else
            xPlayer.showNotification("Bu eşya'dan üstünüze alamazsınız. "..ItemName)
        end
    end

    if removeItem == false then
        if xPlayer.canCarryItem(ItemName, count) then
            xPlayer.addInventoryItem(ItemName, count) 
        else
            xPlayer.showNotification("Bu Eşyayı Taşıyamazsınız : "..ItemName)
        end
    end
end)

RegisterServerEvent('ytzdev-jobs:satis')
AddEventHandler('ytzdev-jobs:satis', function(source, itemName, itemPrice, types)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem = xPlayer.getInventoryItem(itemName)
    local amounts = xItem.count * itemPrice

    if xItem.count > 0 then
        if checkLimit(src, types, amounts) == true then
            xPlayer.addInventoryItem('cash', xItem.count * itemPrice)
            xPlayer.removeInventoryItem(itemName, xItem.count)
            xPlayer.showNotification("Bunu Sattın Ve [" ..string.upper(xItem.name).. "] Bu Kadar Para Kazandın "..xItem.count * itemPrice)
            TriggerClientEvent('textstatus', src, true)
        elseif checkLimit(src, types, amounts) == false then
            xPlayer.showNotification("Günlük limitin doldu")
            TriggerClientEvent('textstatus', src, true)
        end
    else
        xPlayer.showNotification("Üstünde Yeterli Sayıda ["..string.upper(xItem.name).."] Yok")
        TriggerClientEvent('textstatus', src, true)
    end
end)


ESX.RegisterServerCallback("ytzdev-jobs:getmoney", function(source, cb, requestmoney)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= requestmoney then
        cb(true)
    else
        cb(false)
    end
end)

-- Yapımcı: ZhoNNz Bey'in esx_jobs'a uyarladığı günlük limit sistemiden aldım. 
checkLimit = function(source, types, amount)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if types == "anameslek" then
        local result = MySQL.Sync.fetchAll("SELECT anamesleklimit FROM users WHERE identifier = @identifier", {
            ["@identifier"] = xPlayer.identifier,
        })
        if result[1].anamesleklimit >= Config.anamesleklimit or result[1].anamesleklimit + amount >= Config.anamesleklimit then
            return false
        else
            MySQL.Async.execute("UPDATE users SET anamesleklimit = @anamesleklimit WHERE identifier = @identifier", {
                ["@anamesleklimit"] = result[1].anamesleklimit + amount,
                ["@identifier"] = xPlayer.identifier
            })
            return true
        end
        else
        local result = MySQL.Sync.fetchAll("SELECT yanmesleklimit FROM users WHERE identifier = @identifier", {
            ["@identifier"] = xPlayer.identifier,
        })
        if result[1].yanmesleklimit >= Config.yanmesleklimit or result[1].yanmesleklimit + amount >= Config.yanmesleklimit then 
            return false
        else
            MySQL.Async.execute("UPDATE users SET yanmesleklimit = @yanmesleklimit WHERE identifier = @identifier", {
                ["@yanmesleklimit"] = result[1].yanmesleklimit + amount, 
                ["@identifier"] = xPlayer.identifier
            })
            return true
        end
    end
end

resetLimit = function()
    local sqlresult = MySQL.Sync.fetchAll("SELECT * FROM users")
    for i = 1, #sqlresult, 1 do
        MySQL.Async.execute("UPDATE users SET anamesleklimit = @anamesleklimit, yanmesleklimit = @yanmesleklimit WHERE identifier = @identifier", {
            ["@anamesleklimit"] = 0,
            ["@yanmesleklimit"] = 0,
            ["@identifier"] = sqlresult[i].identifier
        })
    end
    print("^8GÜNLÜK LİMİT SIFIRLANDI^0")
end


TriggerEvent('cron:runAt', 00, 00, resetLimit)
