%%Author: Rashmi Krishnan

%% Given: Positive integer N
%%Note that recbits() and tailrecbits() do not check for N>=0, that is handled by bits/1.

-module(bits).

-export([bits/1]).

%%recursion form of calculating bits
recbits(0)		   ->
			   0;
recbits(N)		   ->
			   (N rem 2) + recbits(N div 2). % recursively divide by 2 till value is 0 or 1.

%%To run corresponding recursion version, comment and uncomment appropriate lines

%%call recbits function here
%%bits(N)	when N>=0		  ->
%%			  recbits(N).

%%call tailrecbits here
bits(N)	when N>=0		  ->
			  tailrecbits(N,0).

%call tailbits for tail recursion of above function
tailrecbits(0,P)   ->
		   P;	%when 0, we have reached the end
tailrecbits(N,P)   ->		  % add 1 when remainder is 1 and 0 when remainder is 0
		   tailrecbits((N div 2),(N rem 2)+P).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TESTS BELOW

% 1> bits:bits(0).
% 0
% 2> bits:bits(1).
% 1
% 3> bits:bits(2).
% 1
% 4> bits:bits(4).
% 1
% 5> bits:bits(3).
% 2
% 6> bits:bits(7).
% 3
% 7> bits:bits(14).
% 3
% 8> bits:bits(15).
% 4
% 9> bits:bits(255).
% 8
