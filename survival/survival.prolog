minutes_to_seconds(M,S) :- S is 60*M.
weeks_to_seconds(W,S) :- D is 7*W, days_to_seconds(D,S).
days_to_seconds(D,S) :- H is D*24, M is 60*H, S is 60*M.

% Can survive without adequate heat for 1 second 
survive_without(heat,1).

% Can survivie without air for 15 minutes
survive_without(air,X) :- minutes_to_seconds(15,X).

% Can survive without water for 7 days (3-5 days cited)
% http://en.wikipedia.org/wiki/Survival_skills#Water
% comes out to 604,800 seconds
survive_without(water,X) :- days_to_seconds(7,X).


% If Mahatma Gandhi can live on water for 21 days at age 74, then
% any average person could expect to do the same
% http://www.scientificamerican.com/article.cfm?id=how-long-can-a-person-sur
% comes out to 1,814,400 seconds
survive_without(food,X) :- weeks_to_seconds(3,X).

more_important(N1,N2,I) :-
	survive_without(N1,S1),
	survive_without(N2,S2),
	I is S2 / S1.

% Conclusions (based on survival levels, not necessarily optimal)
% ---------------------------------------------------------------
% heat is 1.8 million times more important than food
% air is 2000 times more important than food
% water is 3 times more important than food


% Given that the body is 70 percent water, and that every
% process in the body requires water, it is no surprise that water
% is many times more important than food.
