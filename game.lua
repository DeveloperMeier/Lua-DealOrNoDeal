#! /usr/bin/lua

--DeveloperMeier's Deal or No Deal game
-- @Author: Colby Meier
-- @Purpose: Open source deal or no deal engine
-- @Written: 12/07/2013
-- @Version: 0.0.1
----------------------------------------------------

--Global variables
raffle_list = {}
cases = {}

--[[
function add_to_raffle(name)
    table.insert(raffle_list, name)    
end

function remove_from_raffle(name)
    raffle_list[name] = nil
end
]]

function init_cases(range_bottom, range_top, increment)
    avail_cases = {}
    if range_top - range_bottom ~= increment*25 then
        print("Please make sure there are 25 cases supplied")
        os.exit(1)
    end
    for i=1,25 do
        avail_cases[i] = true
    end
    set_cases = 0;
    while (set_cases <= 25) do
        for i=range_bottom, range_top, increment do
            rnd = math.random(25)
            if (avail_cases[rnd]) then --Make sure we haven't assigned this case already
                cases[rnd] = i
                avail_cases[rnd] = false
                set_cases= set_cases + 1
                print("Setting cases["..rnd.."] to value: " .. cases[rnd])
            end
        end
    end
end

function show_case(num)
    print("You chose case " .. num .. ", which contains ".. cases[num])
end

init_cases(100, 600, 20)

for i=1, 25 do
    show_case(i)
end
