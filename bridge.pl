% whoIsCrossing([ [indiana_jonesj,5], [girl_friend,10], [father,20], [side_kick,25] ]).
 whoIsCrossing2([ [a,1], [b,2], [c,5], [d,8] ]).

% You can call this as follows: whoIsCrossing(Who), cross_bridge(Who, 60, Plan).
% or whoIsCrossing2(Who), cross_bridge(Who, 15, Plan).
% both of those should succeed and produce plans
% reduce the time limit even by 1 and no plan should be produced

cross_bridge(WhoIsCrossing, TimeLimit, Plan ):- %main
    go_right(WhoIsCrossing, [], TimeLimit, [], Plan).


go_right(LeftSide, RightSide, TimeLimit, WorkingPlan, Plan):- %move to the right
    % select(LeftSide, Walker),
    % get_time(Walker, Time),

    % select(LeftSide, Walker, Time),
    % TimeLimit is TimeLimit - Time,
    % delete(LeftSide, [Walker, Time], NewLeftList),
    % append([Walker, Time], RightSide, RightSide),
    % append([Walker, Time], WorkingPlan, WorkingPlan),
    % go_left(NewLeftList, RightSide, TimeLimit, WorkingPlan, Plan).
    TimeLimit > 0,
    select(LeftSide, Walker1, Time1),
    delete(LeftSide, [Walker1, Time1], NewLeftSide),
    append([[Walker1, Time1]], RightSide, NewRightSide),
    % append([[Walker1, Time1]], WorkingPlan, NewWorkingPlan),

    select(NewLeftSide, Walker2, Time2),
    delete(NewLeftSide, [Walker2, Time2], NewNewLeftSide),
    append([[Walker2, Time2]], NewRightSide, NewNewRightSide),
    append([[Walker1, and, Walker2, goright]], WorkingPlan, NewWorkingPlan),
    (Time1 > Time2
        -> Time is Time1
        ; Time is Time2),
    NewTimeLimit is TimeLimit - Time,
    go_left(NewNewLeftSide, NewNewRightSide, NewTimeLimit, NewWorkingPlan, Plan).
    

go_left([], _, TimeLimit, WorkingPlan, WorkingPlan):-
    TimeLimit >= 0.


go_left(LeftSide, RightSide, TimeLimit, WorkingPlan, Plan):- %move to the left
    TimeLimit > 0,
    select(RightSide, Walker, Time),
    NewTimeLimit is TimeLimit - Time,
    delete(RightSide, [Walker, Time], NewRightSide),
    append([[Walker, Time]], LeftSide, NewLeftSide),
    append([[Walker, goleft]], WorkingPlan, NewWorkingPlan),
    go_right(NewLeftSide, NewRightSide, NewTimeLimit, NewWorkingPlan, Plan).

select(List, Walker, Time):- %select who is going to the left
    member(TWalker, List),
    get_walker(TWalker, Walker),
    get_time(TWalker, Time).
    
get_time([_, Time], Time).

get_walker([Walker, _], Walker).
% select(WhoIsCrossing, LeftSide, RigthSide). %select who is going to the right

