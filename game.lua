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
value_table = {}
my_case = {}


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
    value_table = values
    for i=1,25 do
        rnd = math.random(#values) --get random value entry
        cases[i] = values[rnd] --assign random value to next case
        table.remove(values, rnd) --remove the value in question
    end
end

function show_case(num) --show the values for a case
    print("You chose case " .. num .. ", which contains ".. cases[num])
    table.remove(cases, num)
end

function pick_case(num)
    my_case[num] = cases[num]
    table.remove(cases, num)
end

function print_remaining()
    case_string = "Cases remaining: "
    values_string = "Values remaining: "
    for i,v in pairs(cases) do
        case_string = case_string .. "["..v.."] "
    end
    for i,v in pairs(value_table) do
        values_string = values_string .. "["..i.."] "
    end
    print(case_string)
    print(value_string)
end

function game_loop()
    init_cases(50)
    io.write("Which case shall be yours? (1-25)> ")
    user_case = io.read()
    pick_case(user_case)
    while #cases > 2 do --last 3 cases, let's change the offering algorithm
        io.write("Choose a case to open> ")
        user_case = io.read()
        show_case(user_case)
        print_remaining()
    end
    print("Only 2 cases remain");
end

game_loop()
