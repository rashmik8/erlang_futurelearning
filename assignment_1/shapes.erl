%%Author: Rashmi Krishnan

-module(shapes).

-export([perimeter/1, area/1, enclose/1]).

%%Perimeter of square
%%For square, given center{_X,_Y} and side S.
perimeter({square,{_X,_Y},S})	->
			4*S;

%%Perimeter of circle
%%For circle, given center{_X,_Y} and radius R.
perimeter({circle,{_X,_Y},R})	->
			math:pi()*2*R;

%%Perimeter of rectangle
%%For rectangle, given center{_X,_Y}, height H and width W.
perimeter({rectangle,{_X,_Y},H,W})	->
				2*(H+W);

%%Perimeter of triangle
%%For a triangle, given vertex{_X,_Y} opposite largest side of triangle and sides A, B, and C.
perimeter({triangle,{_X,_Y},A,B,C})   ->
				    A+B+C.

%%Area of square
area({square,{_X,_Y},S})	->
				S*S;
%%Area of circle
area({circle,{_X,_Y},R})	->
				math:pi()*R*R;
%%Area of rectangle
area({rectangle,{_X,_Y},H,W})	->				
				H*W;
%%Area of triangle
area({triangle,{_X,_Y},A,B,C})	    ->
				    S = (A+B+C)/2,
				    math:sqrt(S*(S-A)*(S-B)*(S-C)).

%%enclose function for circle, square, rectangle, triangle
%%square is a special type of rectangle so makes sense to return the square as rectangle with equal sides.
%%similarly rectangle enclosing a circle is also a square.
enclose({circle,{_X,_Y},R})	    ->
				    {rectangle,{_X,_Y},R};
enclose({square,{_X,_Y},S})	    ->
				    {rectangle,{_X,_Y},S,S};
enclose({rectangle,{_X,_Y},H,W})	    ->
				    {rectangle,{_X,_Y},H,W};
enclose({triangle,{_X,_Y},A,B,C})	    ->
				    H=(area({triangle,{_X,_Y},A,B,C})*2) / A, % here we can assume any side to be the base.
				    				       % The area of rectangle enclosing the triangle will remain the same.
				    {rectangle,{_X,_Y},H,A}.  % here A is the base or width and H is the height of the new rectangle

%%%%%%%%%%%%%%%%%%%%%%
%% TESTS BELOW

% 2> shapes:enclose({triangle,{1,1},3,4,5}).
% {rectangle,{1,1},4.0,3}
% 3> shapes:area({rectangle,{1,1},4.0,3}).
% 12.0
% 4> shapes:enclose({triangle,{1,1},5,3,4}).  
% {rectangle,{1,1},2.4,5}
% 5> shapes:area({rectangle,{1,1},2.4,5}).
% 12.0
% 6> shapes:perimeter({rectangle,{1,1},2.4,5}).