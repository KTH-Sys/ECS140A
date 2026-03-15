% Kyaw Thi Ha - 925502337
% ECS140A - HW5

-module(hw5).
-export([myelem/2, myremoveduplicates/1, myintersection/2, mylast/1, myreverse/1,
         myreplaceall/3, process_task/1, process_task_list/1, map_tasks/2,
          filter_tasks_by_type/2, count_by_type/2, sum_results/1]).

% Part One
% 1) myremoveduplicates
myelem(_, []) -> false;
myelem(Item, [Item|_]) -> true;
myelem(Item, [_|Ys]) -> myelem(Item, Ys).

myremoveduplicates([]) -> [];
myremoveduplicates([H|T]) ->
    case myelem(H, T) of
        true  -> myremoveduplicates(T);
        false -> [H | myremoveduplicates(T)]
    end.

% 2) myintersection
myintersection([], _) -> [];
myintersection(_, []) -> [];
myintersection([H|T], L2) ->
    case myelem(H, L2) of
        true  -> [H | myintersection(T, L2)];
        false -> myintersection(T, L2)
    end.

% 3) mylast
mylast([]) -> [];
mylast([X]) -> [X];
mylast([_|T]) -> mylast(T).

% 4) myreverse
myreverse(L) -> myreverse(L, []).
myreverse([], Acc) -> Acc;
myreverse([H|T], Acc) -> myreverse(T, [H|Acc]).

% 5) myreplaceall 
myreplaceall(_, _, []) -> [];
myreplaceall(New, Old, [Old|T]) -> [New | myreplaceall(New, Old, T)];
myreplaceall(New, Old, [H|T])   -> [H   | myreplaceall(New, Old, T)].

% Part Two - A
%process_task
process_task({compute, Number})   -> Number * Number;
process_task({double, Number})    -> Number * 2;
process_task({increment, Number}) -> Number + 1;
process_task({negate, Number})    -> -Number;
process_task(_)                   -> {error, unknown_task}.
 
% process_task_list
process_task_list([]) -> [];
process_task_list([H|T]) -> [process_task(H) | process_task_list(T)].

% Part Two - B
% map_tasks/2 
map_tasks(Fun, TaskList) ->
    lists:map(fun({Type, Data}) -> {Type, Fun(Data)} end, TaskList).
 
%filter_tasks_by_type/2 
filter_tasks_by_type(TaskType, TaskList) ->
    [Task || Task = {Type, _} <- TaskList, Type == TaskType].
 
% count_by_type/2 
count_by_type(TaskType, TaskList) ->
    length(filter_tasks_by_type(TaskType, TaskList)).
 
% sum_results/1 
sum_results(TaskList) ->
    lists:foldl(fun(Task, Acc) -> process_task(Task) + Acc end, 0, TaskList).

