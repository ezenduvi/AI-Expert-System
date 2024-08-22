% Load and run the knowledge base
run :-
    write('Enter the knowledge base file name: '), read(File),
    consult(File),
    initial_state(Start),
    goal_state(Goal),
    solve_all(Start, Goal).

solve_all(Start, Goal) :-
    search(Start, Goal, SolutionReversed),
    reverse(SolutionReversed, Solution),
    display_solution(Solution),
    ask_for_more(Continue),
    (Continue == no -> true ; fail). % Stop if user says no, else continue searching
solve_all(_, _) :- 
    write('No more solutions or search stopped by the user.'), nl.

ask_for_more(Continue) :-
    write('Do you want to see another solution? (yes/no): '), read(Continue),
    (Continue == yes ; Continue == no), !. % Ensure valid response and stop backtracking

%DFS-based search strategy to track and display rules
search(Start, Goal, Solution) :-
    dfs(Start, Goal, [Start-"Initial state"], Solution).

dfs(State, State, Path, Path).
dfs(State, Goal, Visited, Path) :-
    rule(transport(State, NextState)),
    \+ memberchk(NextState-_, Visited),  % Ensure the next state hasn't been visited
    \+ illegal(NextState),
    RuleText = rule(transport(State, NextState)), % Construct rule text
    dfs(NextState, Goal, [NextState-RuleText|Visited], Path).

% Display solutions including the rules used for each transition
display_solution(Path) :-
    write('Solution Path: '), nl,
    display_transitions(Path).

display_transitions([_]).
display_transitions([State1-_, State2|Tail]) :-
    format("Moving from ~w to ~w", [State1, State2]), nl,
    display_transitions([State2|Tail]).
