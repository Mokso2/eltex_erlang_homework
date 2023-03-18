rr("person.hrl").  
Persons = [
#person{id = 1, name = "Bob", age = 23, gender = male},
#person{id = 2, name = "Kate", age = 20, gender = female},
#person{id = 3, name = "Jack", age = 34, gender = male},
#person{id = 4, name = "Nate", age = 54, gender = female}].

[#person{id = 1,name = "Bob",age = 23,gender = male},
#person{id = 2,name = "Kate",age = 20,gender = female},
#person{id = 3,name = "Jack",age = 34,gender = male},
#person{id = 4,name = "Nate",age = 54,gender = female}]
 
persons:filter(fun(#person{age = Age}) -> Age >= 30 end, Persons).  
[#person{id = 3,name = "Jack",age = 34,gender = male},   
#person{id = 4,name = "Nate",age = 54,gender = female}]    

persons:filter(fun(#person{gender = Gender}) -> Gender =:= male end, Persons).   
[#person{id = 1,name = "Bob",age = 23,gender = male},    
#person{id = 3,name = "Jack",age = 34,gender = male}]    
 
persons:any(fun(#person{gender = Gender}) -> Gender =:= female end, Persons).    
persons:all(fun(#person{age = Age}) -> Age >= 20 end, Persons).     
true    

persons:all(fun(#person{age = Age}) -> Age =< 30 end, Persons).    
false   

UpdateJackAge = fun(#person{name = "Jack", age = Age} = Person) ->   
Person#person{age = Age + 1};   
(Person) ->    
Person  
end.  
#Fun<erl_eval.7.126501267>     
persons:update(UpdateJackAge, Persons).   
[#person{id = 1,name = "Bob",age = 23,gender = male},   
 #person{id = 2,name = "Kate",age = 20,gender = female},   
 #person{id = 3,name = "Jack",age = 35,gender = male},   
 #person{id = 4,name = "Nate",age = 54,gender = female}]    
 
 UpdateFemaleAge = 
fun (#person{gender = female, age = Age} = Person) -> Person#person{age = Age - 1};
(Person) ->   
Person  
end.   
#Fun<erl_eval.7.126501267>   
persons:update(UpdateFemaleAge, Persons).   
[#person{id = 1,name = "Bob",age = 23,gender = male},   
 #person{id = 2,name = "Kate",age = 19,gender = female},   
 #person{id = 3,name = "Jack",age = 34,gender = male},    
 #person{id = 4,name = "Nate",age = 53,gender = female}]    
 
 persons:get_average_age(Persons).   
{ok,32.75}    
persons:get_average_age([]).        
{error,badarg}   

33> [X || X <- lists:seq(1,10), X rem 3 =:= 0].   
[3,6,9]    

[X*X || X <- [1, "hello", 100, boo, "boo", 9], is_integer(X)].   
[1,10000,81]    
 
exceptions:catch_all(fun() -> 1/0 end).   
Action #Fun<erl_eval.21.126501267> failed, reason badarith   
error   
exceptions:catch_all(fun() -> throw(custom_exceptions) end).   
Action #Fun<erl_eval.21.126501267> failed, reason custom_exceptions     
throw   
exceptions:catch_all(fun() -> exit(killed) end).   
Action #Fun<erl_eval.21.126501267> failed, reason killed    
exit   
exceptions:catch_all(fun() -> erlang:error(runtime_exception) end).    
Action #Fun<erl_eval.21.126501267> failed, reason runtime_exception     
error      
   




