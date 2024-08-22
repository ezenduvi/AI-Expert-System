% Initial state: all items are on the east shore (e)
initial_state(state(e, e, e, e)).

% Goal state: all items are on the west shore (w)
goal_state(state(w, w, w, w)).

% State transition rules
rule(transport(state(X, X, Wolf, Cabbage), state(Y, Y, Wolf, Cabbage))) :- newLocation(X, Y). % Move farmer and goat
rule(transport(state(X, Goat, X, Cabbage), state(Y, Goat, Y, Cabbage))) :- newLocation(X, Y). % Move farmer and wolf
rule(transport(state(X, Goat, Wolf, X), state(Y, Goat, Wolf, Y))) :- newLocation(X, Y). % Move farmer and cabbage
rule(transport(state(X, Goat, Wolf, Cabbage), state(Y, Goat, Wolf, Cabbage))) :- newLocation(X, Y). % Move farmer alone

% Define newLocations, when e's new location is w and w's new location is e
newLocation(e, w).
newLocation(w, e).

% Illegal states (conflicts)
illegal(state(F, G, W, C)) :-
    (G = W, F \= G) ;  % Goat and Wolf together without Farmer
    (G = C, F \= G).   % Goat and Cabbage together without Farmer
