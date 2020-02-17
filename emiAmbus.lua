_addon.version = '0.0.1'
_addon.name = 'emiAmbus'
_addon.author = 'yyoshisaur'
_addon.commands = {'emiambus','eamb',}

require('luau')
local packets = require('packets')

local roe_ambus = {
    vol_one = 3998,
    vol_one_daily = 3758,
    vol_two = 3999,
    vol_two_daily = 3759,
    weekly = 3760,
    monthly = 3995,
}

function start_roe(quest)
    local  p = packets.new('outgoing', 0x10C, {
        ['RoE Quest'] = quest,
    })
    packets.inject(p)
end

function cancel_roe(quest)
    local  p = packets.new('outgoing', 0x10D, {
        ['RoE Quest'] = quest,
    })
    packets.inject(p)
end

local cancel_cmd = L{'cancel', 'c'}
local vol_one_cmd = L{'one', '1'}
local vol_two_cmd = L{'two', '2'}
local daily_cmd = L{'daily', 'd'}
local weekly_cmd = L{'weekly', 'w'}
local monthly_cmd = L{'monthly', 'm'}
windower.register_event('addon command', function (...)
    local args = {...}
    
    if cancel_cmd:contains(args[1]) then
        if  vol_one_cmd:contains(args[2]) then
            if daily_cmd:contains(args[3]) then
                log('Cancel RoE Quest Ambuscade Primer Volume One (D)')
                cancel_roe(roe_ambus.vol_one_daily)
            else
                log('Cancel RoE Quest Ambuscade Primer Volume One')
                cancel_roe(roe_ambus.vol_one)
            end
        elseif vol_two_cmd:contains(args[2])  then
            if daily_cmd:contains(args[3]) then
                log('Cancel RoE Quest Ambuscade Primer Volume Two (D)')
                cancel_roe(roe_ambus.vol_two_daily)
            else
                log('Cancel RoE Quest Ambuscade Primer Volume Two')
                cancel_roe(roe_ambus.vol_two)
            end
        elseif weekly_cmd:contains(args[2]) then
            log('Cancel RoE Quest Ambuscade Weekly')
            cancel_roe(roe_ambus.weekly)
        elseif monthly_cmd:contains(args[2]) then
            log('Cancel RoE Quest Intense Ambuscade Monthly')
            cancel_roe(roe_ambus.monthly)
        end
    else
        if  vol_one_cmd:contains(args[1]) then
            if daily_cmd:contains(args[2]) then
                log('Start RoE Quest Ambuscade Primer Volume One (D)')
                start_roe(roe_ambus.vol_one_daily)
            else
                log('Start RoE Quest Ambuscade Primer Volume One')
                start_roe(roe_ambus.vol_one)
            end
        elseif vol_two_cmd:contains(args[1])  then
            if daily_cmd:contains(args[2]) then
                log('Start RoE Quest Ambuscade Primer Volume Two (D)')
                start_roe(roe_ambus.vol_two_daily)
            else
                log('Start RoE Quest Ambuscade Primer Volume Two')
                start_roe(roe_ambus.vol_two)
            end
        elseif weekly_cmd:contains(args[1]) then
            log('Start RoE Quest Ambuscade Weekly')
            start_roe(roe_ambus.weekly)
        elseif monthly_cmd:contains(args[1]) then
            log('Start RoE Quest Intense Ambuscade Monthly')
            start_roe(roe_ambus.monthly)
        end
    end
end)