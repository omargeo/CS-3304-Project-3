whoIsCrossing([ [indian_jonesj,5], [girl_friend,10], [father,20], [side_kick,25] ]).
whoIsCrossing2([ [a,1], [b,2], [c,5], [d,8] ]).


make_go_now() :- consult(bridge), go().

go() :- open("output.txt",write,Out),
	really_go_now(Out),
	write(Out, "\n"),
	fail.

go().


really_go_now(Out) :-
	whoIsCrossing(Who), cross_bridge(Who, 60, Plan ), write(Out, Plan).

really_go_now(Out) :-
	whoIsCrossing2(Who2), cross_bridge(Who2, 15, Plan ), write( Out, Plan).
