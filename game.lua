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
values = {}


function add_to_raffle(name) -- optional raffle procedure
    table.insert(raffle_list, name)    
end

function remove_from_raffle(name)
    raffle_list[name] = nil
end


function init_cases(increment) --set initial case values
    for i=1,25 do --25 total cases
        table.insert(values, increment*i) --insert values into a 'values' table
    end
    for i=1,25 do
        rnd = math.random(#values) --get random value entry
        cases[i] = values[rnd] --assign random value to next case
        table.remove(values, rnd) --remove the value in question
    end
end

function show_case(num) --show the values for a case
    print("You chose case " .. num .. ", which contains ".. cases[num])
end

init_cases(120) --sample data

