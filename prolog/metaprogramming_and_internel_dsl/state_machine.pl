% State Machine Definition
accept([], FinalState, FinalState).

accept([FirstEvent|RestEvents], Current, FinalState) :-
    transition(Current, FirstEvent, Target),
    accept(RestEvents, Target, FinalState).


% Configration
transition(idle, doorClose, active).
transition(active, lightOn, waitingForDrawerOpen).
transition(active, drawerOpen, waitingForLightOn).
transition(waitingForDrawerOpen, drawerOpen, unlockPannel).
transition(waitingFOrLightOn, lightOn, unlockPannel).
