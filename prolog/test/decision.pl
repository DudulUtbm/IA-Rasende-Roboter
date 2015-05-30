/*


  D�finition de l'IA du joueur artificiel de Rasende Roboter


*/

:- use_module(library('clp/bounds')).
:- use_module(library('clp/clp_distinct')).

:- module( decision, [
	init/1,
	move/2
] ).


% initialisation des varaibles globales 
init(_).


% Base de connaissances 
% o� sont plac�s les murs et les target ?
% Target [Scenario,liste des targets (dans l'ordre)]

target([0,0,0,0],[[7,5],[6,1],[9,10],[13,5],[6,13],[11,2],[5,4],[1,10],[14,13],[4,9],[9,1],[9,14],[1,3],[12,9],[2,14],[2,5],[10,7]]).
target([0,0,0,1],[[7,5],[6,1],[12,9],[13,5],[6,13],[11,2],[5,4],[1,10],[14,13],[4,9],[9,1],[9,12],[1,3],[11,14],[2,14],[2,5],[10,7]]).
target([0,0,1,0],[[7,5],[6,1],[9,10],[13,5],[3,9],[11,2],[5,4],[6,14],[14,13],[1,13],[9,1],[9,14],[1,3],[12,9],[5,11],[2,5],[10,7]]).
target([0,0,1,1],[[7,5],[6,1],[12,9],[13,5],[3,9],[11,2],[5,4],[6,14],[14,13],[1,13],[9,1],[9,12],[1,3],[11,14],[5,11],[2,5],[10,7]]).
target([0,1,0,0],[[7,5],[6,1],[9,10],[11,2],[6,13],[13,6],[5,4],[1,10],[14,13],[4,9],[10,7],[9,14],[1,3],[12,9],[2,14],[2,5],[14,1]]).
target([0,1,0,1],[[7,5],[6,1],[12,9],[11,2],[6,13],[13,6],[5,4],[1,10],[14,13],[4,9],[10,7],[9,12],[1,3],[11,14],[2,14],[2,5],[14,1]]).
target([0,1,1,0],[[7,5],[6,1],[9,10],[11,2],[3,9],[13,6],[5,4],[6,14],[14,13],[1,13],[10,7],[9,14],[1,3],[12,9],[5,11],[2,5],[14,1]]).
target([0,1,1,1],[[7,5],[6,1],[12,9],[11,2],[3,9],[13,6],[5,4],[6,14],[14,13],[1,13],[10,7],[9,12],[1,3],[11,14],[5,11],[2,5],[14,1]]).
target([1,0,0,0],[[3,7],[5,6],[9,10],[13,5],[6,13],[11,2],[1,3],[1,10],[14,13],[4,9],[9,1],[9,14],[6,4],[12,9],[2,14],[2,1],[10,7]]).
target([1,0,0,1],[[3,7],[5,6],[12,9],[13,5],[6,13],[11,2],[1,3],[1,10],[14,13],[4,9],[9,1],[9,12],[6,4],[11,14],[2,14],[2,1],[10,7]]).
target([1,0,1,0],[[3,7],[5,6],[9,10],[13,5],[3,9],[11,2],[1,3],[6,14],[14,13],[1,13],[9,1],[9,14],[6,4],[12,9],[5,11],[2,1],[10,7]]).
target([1,0,1,1],[[3,7],[5,6],[12,9],[13,5],[3,9],[11,2],[1,3],[6,14],[14,13],[1,13],[9,1],[9,12],[6,4],[11,14],[5,11],[2,1],[10,7]]).
target([1,1,0,0],[[3,7],[5,6],[9,10],[11,2],[6,13],[13,6],[1,3],[1,10],[14,13],[4,9],[10,7],[9,14],[6,4],[12,9],[2,14],[2,1],[14,1]]).
target([1,1,0,1],[[3,7],[5,6],[12,9],[11,2],[6,13],[13,6],[1,3],[1,10],[14,13],[4,9],[10,7],[9,12],[6,4],[11,14],[2,14],[2,1],[14,1]]).
target([1,1,1,0],[[3,7],[5,6],[9,10],[11,2],[3,9],[13,6],[1,3],[6,14],[14,13],[1,13],[10,7],[9,14],[6,4],[12,9],[5,11],[2,1],[14,1]]).
target([1,1,1,1],[[3,7],[5,6],[12,9],[11,2],[3,9],[13,6],[1,3],[6,14],[14,13],[1,13],[10,7],[9,12],[6,4],[11,14],[5,11],[2,1],[14,1]]).

% murhaut [Scenario,liste des murs]
murdroite().
murdroite([0,0,0,0], [[3,0],[10,0],[9,1],[5,1],[11,2],[1,3],[2,5],[4,4],[7,5],[12,5],[12,9],[9,7],[6,7],[6,8],[8,7],[8,8],[8,10],[3,9],[1,10],[2,14],[3,15],[5,13],[8,14],[10,15],[14,13]]).
murdroite([0,0,0,1], [[3,0],[5,1],[9,1],[10,0],[11,2],[1,3],[4,4],[12,5],[7,5],[2,5],[6,7],[6,8],[8,7],[8,8],[9,7],[12,9],[3,9],[1,10],[5,13],[2,14],[3,15],[8,12],[11,14],[13,13],[13,15]]).
murdroite([0,0,1,0], [[3,0],[5,1],[9,1],[10,0],[11,2],[1,3],[4,4],[2,5],[12,5],[9,7],[8,7],[8,8],[6,7],[6,8],[3,9],[4,11],[0,13],[4,15],[6,14],[8,14],[10,15],[8,10],[12,9],[14,13],[7,5]]).
murdroite([0,0,1,1], [[3,0],[10,0],[9,1],[5,1],[1,3],[4,4],[2,5],[7,5],[11,2],[12,5],[9,7],[8,7],[8,8],[6,7],[6,8],[12,9],[3,9],[4,11],[0,13],[4,15],[6,14],[8,12],[13,13],[13,15],[11,14]]).
murdroite([0,1,0,0], [[3,0],[9,0],[13,1],[10,2],[5,1],[1,3],[4,4],[2,5],[7,5],[10,7],[13,6],[8,7],[8,8],[6,7],[6,8],[3,9],[1,10],[2,14],[3,15],[5,13],[8,14],[10,15],[8,10],[14,13],[12,9]]).
murdroite([0,1,0,1], [[3,0],[9,0],[13,1],[10,2],[5,1],[1,3],[4,4],[2,5],[7,5],[6,7],[6,8],[8,7],[8,8],[10,7],[13,6],[12,9],[13,13],[13,15],[11,14],[8,12],[5,13],[3,15],[2,14],[1,10],[3,9]]).
murdroite([0,1,1,0], [[3,0],[5,1],[9,0],[10,2],[13,1],[1,3],[2,5],[4,4],[7,5],[6,7],[6,8],[8,7],[8,8],[10,7],[13,6],[12,9],[8,10],[3,9],[4,11],[0,13],[6,14],[8,14],[14,13],[4,15],[10,15]]).
murdroite([0,1,1,1], [[3,0],[5,1],[9,0],[10,2],[13,1],[13,6],[10,7],[12,9],[8,7],[8,8],[6,7],[6,8],[7,5],[4,4],[1,3],[2,5],[3,9],[4,11],[0,13],[6,14],[8,12],[11,14],[13,13],[13,15],[4,15]]).
murdroite([1,0,0,0], [[4,0],[10,0],[11,2],[12,5],[5,4],[2,1],[0,3],[6,7],[6,8],[5,6],[8,7],[8,8],[3,7],[3,9],[1,10],[2,14],[3,15],[5,13],[10,15],[8,14],[14,13],[12,9],[8,10],[9,7],[9,1]]).
murdroite([1,0,0,1], [[4,0],[2,1],[0,3],[5,4],[5,6],[3,7],[3,9],[1,10],[2,14],[3,15],[5,13],[8,12],[6,8],[6,7],[8,7],[8,8],[9,7],[9,1],[10,0],[11,2],[12,5],[12,9],[13,13],[13,15],[11,14]]).
murdroite([1,0,1,0], [[4,0],[10,0],[9,1],[11,2],[12,5],[5,4],[2,1],[0,3],[3,7],[5,6],[6,7],[6,8],[8,7],[8,8],[9,7],[12,9],[8,10],[4,11],[3,9],[0,13],[4,15],[6,14],[8,14],[10,15],[14,13]]).
murdroite([1,0,1,1], [[4,0],[10,0],[9,1],[11,2],[12,5],[5,4],[5,6],[0,3],[3,7],[3,9],[0,13],[4,11],[6,14],[8,12],[13,13],[13,15],[11,14],[12,9],[9,7],[8,7],[8,8],[6,7],[6,8],[4,15],[2,1]]).
murdroite([1,1,0,0], [[4,0],[9,0],[10,2],[13,1],[13,6],[10,7],[8,7],[8,8],[6,7],[6,8],[5,6],[5,4],[0,3],[3,7],[3,9],[1,10],[2,14],[3,15],[5,13],[8,14],[10,15],[14,13],[12,9],[8,10],[2,1]]).
murdroite([1,1,0,1], [[4,0],[9,0],[10,2],[13,1],[13,6],[10,7],[5,4],[0,3],[5,6],[3,7],[3,9],[1,10],[2,14],[3,15],[5,13],[8,12],[11,14],[13,15],[13,13],[12,9],[6,7],[6,8],[8,7],[8,8],[2,1]]).
murdroite([1,1,1,0], [[4,0],[2,1],[0,3],[5,4],[5,6],[3,7],[3,9],[0,13],[4,15],[6,14],[4,11],[8,10],[8,14],[10,15],[14,13],[12,9],[10,7],[13,6],[13,1],[10,2],[9,0],[6,7],[6,8],[8,7],[8,8]]).
murdroite([1,1,1,1], [[2,1],[4,0],[0,3],[5,4],[5,6],[9,0],[10,2],[13,1],[13,6],[10,7],[12,9],[13,13],[13,15],[11,14],[8,12],[6,14],[4,15],[4,11],[3,9],[0,13],[3,7],[6,7],[6,8],[8,7],[8,8]]).


% murdroite [Scenario,liste des murs]
murhaut().

murhaut([0,0,0,0], [[0,3],[0,6],[1,2],[6,1],[9,0],[11,2],[15,3],[13,5],[15,9],[10,6],[12,8],[7,5],[5,3],[2,5],[4,9],[9,10],[14,13],[9,13],[6,12],[2,14],[1,9],[7,6],[8,6],[7,8],[8,8]]).
murhaut([0,0,0,1], [[9,0],[15,1],[6,1],[11,2],[15,3],[5,3],[0,3],[1,2],[2,5],[7,5],[13,5],[10,6],[8,6],[7,6],[0,6],[7,8],[8,8],[12,8],[4,9],[1,9],[2,14],[6,12],[9,11],[11,14],[14,13]]).
murhaut([0,0,1,0], [[6,1],[9,0],[11,2],[15,3],[13,5],[7,5],[5,3],[1,2],[0,2],[2,5],[0,6],[7,6],[8,6],[7,8],[8,8],[9,10],[15,9],[12,8],[10,6],[14,13],[9,13],[6,13],[5,10],[3,9],[1,13]]).
murhaut([0,0,1,1], [[6,1],[9,0],[11,2],[15,1],[15,3],[5,3],[1,2],[0,2],[0,6],[2,5],[7,5],[13,5],[10,6],[8,6],[7,6],[7,8],[8,8],[12,8],[9,11],[5,10],[3,9],[14,13],[11,14],[6,13],[1,13]]).
murhaut([0,1,0,0], [[6,1],[11,2],[14,0],[15,3],[7,5],[5,3],[1,2],[0,3],[0,6],[2,5],[4,9],[1,9],[7,6],[8,6],[7,8],[8,8],[10,6],[12,8],[15,9],[13,6],[14,13],[9,10],[9,13],[6,12],[2,14]]).
murhaut([0,1,0,1], [[6,1],[14,0],[15,1],[15,3],[11,2],[13,6],[10,6],[8,6],[7,6],[7,8],[8,8],[7,5],[5,3],[2,5],[1,2],[0,3],[0,6],[4,9],[1,9],[2,14],[6,12],[9,11],[11,14],[14,13],[12,8]]).
murhaut([0,1,1,0], [[0,2],[1,2],[6,1],[11,2],[14,0],[15,3],[10,6],[13,6],[7,5],[5,3],[2,5],[0,6],[7,6],[8,6],[7,8],[8,8],[9,10],[3,9],[5,10],[1,13],[6,13],[9,13],[15,9],[12,8],[14,13]]).
murhaut([0,1,1,1], [[0,2],[1,2],[6,1],[5,3],[11,2],[15,1],[15,3],[14,0],[13,6],[10,6],[8,6],[7,6],[7,5],[7,8],[8,8],[12,8],[14,13],[11,14],[9,11],[5,10],[6,13],[1,13],[3,9],[0,6],[2,5]]).
murhaut([1,0,0,0], [[0,3],[1,3],[0,4],[2,1],[6,3],[9,0],[11,2],[15,3],[13,5],[12,8],[15,9],[10,6],[8,6],[7,6],[7,8],[8,8],[9,10],[4,9],[5,5],[3,7],[1,9],[2,14],[6,12],[9,13],[14,13]]).
murhaut([1,0,0,1], [[2,1],[0,3],[1,3],[0,4],[6,3],[9,0],[15,1],[15,3],[11,2],[13,5],[10,6],[12,8],[7,6],[8,6],[7,8],[8,8],[5,5],[4,9],[3,7],[1,9],[2,14],[6,12],[9,11],[14,13],[11,14]]).
murhaut([1,0,1,0], [[0,2],[1,3],[2,1],[6,3],[9,0],[11,2],[15,3],[13,5],[15,9],[12,8],[10,6],[8,6],[7,6],[7,8],[8,8],[5,5],[0,4],[3,7],[3,9],[5,10],[1,13],[6,13],[9,13],[9,10],[14,13]]).
murhaut([1,0,1,1], [[2,1],[0,2],[1,3],[0,4],[6,3],[5,5],[3,7],[3,9],[1,13],[5,10],[6,13],[9,11],[11,14],[14,13],[12,8],[10,6],[13,5],[15,3],[15,1],[11,2],[9,0],[8,6],[7,6],[7,8],[8,8]]).
murhaut([1,1,0,0], [[2,1],[0,3],[1,3],[0,4],[6,3],[5,5],[7,6],[8,6],[7,8],[8,8],[10,6],[13,6],[15,3],[14,0],[11,2],[15,9],[12,8],[9,10],[14,13],[9,13],[6,12],[4,9],[2,14],[1,9],[3,7]]).
murhaut([1,1,0,1], [[0,3],[1,3],[0,4],[2,1],[6,3],[11,2],[15,1],[15,3],[14,0],[13,6],[10,6],[12,8],[14,13],[11,14],[9,11],[6,12],[4,9],[1,9],[2,14],[3,7],[5,5],[7,6],[8,6],[7,8],[8,8]]).
murhaut([1,1,1,0], [[7,8],[8,8],[7,6],[8,6],[2,1],[0,2],[1,3],[0,4],[6,3],[11,2],[14,0],[15,3],[15,9],[12,8],[13,6],[10,6],[14,13],[9,13],[9,10],[6,13],[5,10],[1,13],[3,7],[3,9],[5,5]]).
murhaut([1,1,1,1], [[0,2],[1,3],[2,1],[6,3],[0,4],[3,7],[5,5],[3,9],[5,10],[1,13],[6,13],[9,11],[11,14],[14,13],[12,8],[10,6],[13,6],[15,3],[15,1],[14,0],[11,2],[7,6],[8,6],[7,8],[8,8]]).


/*
  move( +L, -ActionId )
  
L est constitu� de 13 �l�ments : (TL,TR,BL,BR, TargetId, BlueRobotPosition, GreenRobotPosition,
YellowRobotPosition, RedRobotPosition ).

TL,TR,BL,BR permettent de d�crire la configuration du plateau de jeu.

TargetId indique le num�ro de la cible (0-16). En fonction de la cible ce n'est pas toujours le m�me robot qui doit l'atteindre.
0 -> tous les robots
1-4 -> bleu
5-8 -> vert
9-12 -> jaune
13-16 -> rouge

lune,planete,�toile,soleil

ColorRobotPosition indique les coordonn�es (x,y) de robot.

ActionId est un liste qui g�re les mouvements. Elle fonctionne comme suit : 

Movements
 = [R1,D1, R2,D2, ..., Rn,Dn]
 
- chaque Ri repr�sente le robot � d�placer, selon la codification ci-dessous :
* 0 : robot bleu
* 1 : robot vert
* 2 : robot jaune
* 3 : robot rouge

� chaque Di repr�sente la direction que devra suivre le robot Ri, selon la codification ci-
dessous :
* 1 : droite
* 2 : haut
* 3 : gauche
* 4 : bas

|o| Il y a un cut � la fin de chaque move(). 

*/
/*
%test de mouvements
move( [_,_,_,_,1|_],[0,1]):-!,
move( [_,_,_,_,2|_],[0,2]):-!.
move( [_,_,_,_,3|_],[0,3]):-!.
move( [_,_,_,_,4|_],[0,4]):-!.
move( [_,_,_,_,5|_],[1,1]):-!.
move( [_,_,_,_,6|_],[1,2]):-!.
move( [_,_,_,_,7|_],[1,3]):-!.
move( [_,_,_,_,8|_],[1,4]):-!.
move( [_,_,_,_,9|_],[2,1]):-!.
move( [_,_,_,_,10|_],[2,2]):-!.
move( [_,_,_,_,11|_],[2,3]):-!.
move( [_,_,_,_,12|_],[2,4]):-!.
move( [_,_,_,_,13|_],[3,1]):-!.
move( [_,_,_,_,14|_],[3,2]):-!.
move( [_,_,_,_,15|_],[3,3]):-!.
move( [_,_,_,_,16|_],[3,4]):-!.*/

move([_,_,_,_,TargetId|_],[Robot,1]):-Robot is floor((TargetId-1)/4).

% Examples
% move( [0,0,0,0,  1, 4,0 | _], [0,4,0,1,0,4,0,1,0,2,0,3,0,2,0,3] ) :- !.
% ETAT INITIAL : (0,0,0,0) -> configuration basique.
% TARGET : 1. (robot bleu).
% POSITION ROBOT : bleu(4,0).
% SEQUENCE DE COUPS : robot bleu : bas,droite,bas,droite,haut,gauche,haut,gauche.

% move( [0,0,0,0,  2, 6,1 | _], [0,1,0,4] ) :- !.
% ETAT INITIAL : (0,0,0,0) -> configuration basique.
% TARGET : 2.  (robot bleu).
% POSITION ROBOT : bleu(6,1).
% SEQUENCE DE COUPS : robot bleu : droite,bas.

% move( [0,0,0,0, 14, _,_, _,_, _,_, 5,15], [3,3,3,2,3,3,3,4] ) :- !.
% ETAT INITIAL : (0,0,0,0) -> configuration basique.
% TARGET : 14. (robot rouge).
% POSITION ROBOT : rouge(5,15).
% SEQUENCE DE COUPS : robot rouge : gauche,haut,gauche,bas.

% move( _, [] ) :- !.
%        ^
%        |
%        Action: next configuration

 move([TL,TR,BL,BR, TargetId, BlueRobotPosition, GreenRobotPosition,
YellowRobotPosition, RedRobotPosition ],ActionId):-
%	Calculer l'ID du robot qui doit atteindre la cible.
 			Robot is floor((TargetId-1)/4), robotC(Robot,CoordR, BlueRobotPosition, GreenRobotPosition,
YellowRobotPosition, RedRobotPosition),
%	Calculer les coordonn�es de la target
			target([TL,TR,BL,BR],L),list_get(L,N,CoordT),
			
				
				
robotC(-1,Coor,BlueRobotPosition,_,_,_):- Coor is BlueRobotPosition.					
robotC(0,Coor,BlueRobotPosition,_,_,_):- Coor is BlueRobotPosition.				
robotC(1,Coor,_,GreenRobotPosition,_,_):- Coor is GreenRobotPosition.
robotC(2,Coor,_,_,YellowRobotPosition,_):- Coor is YellowRobotPosition.
robotC(3,Coor,_,_,_,RedRobotPosition):- Coor is RedRobotPosition.		

		
				

