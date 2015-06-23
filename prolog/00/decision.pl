/*


  D�finition de l'IA du joueur artificiel de Rasende Roboter


*/


:- module( decision, [
	init/1,
	move/2
] ).


% initialisation des varaibles globales 
init(_).


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

|o| Il y a un cut � la fin de chaque move. 

*/



% Examples
move( [0,0,0,0,  1, 4,0 | _], [0,4,0,1,0,4,0,1,0,2,0,3,0,2,0,3] ) :- !.
% ETAT INITIAL : (0,0,0,0) -> configuration basique.
% TARGET : 1. (robot bleu).
% POSITION ROBOT : bleu(4,0).
% SEQUENCE DE COUPS : robot bleu : bas,droite,bas,droite,haut,gauche,haut,gauche.

move( [0,0,0,0,  2, 6,1 | _], [0,1,0,4] ) :- !.
% ETAT INITIAL : (0,0,0,0) -> configuration basique.
% TARGET : 2.  (robot bleu).
% POSITION ROBOT : bleu(6,1).
% SEQUENCE DE COUPS : robot bleu : droite,bas.

move( [0,0,0,0, 14, _,_, _,_, _,_, 5,15], [3,3,3,2,3,3,3,4] ) :- !.
% ETAT INITIAL : (0,0,0,0) -> configuration basique.
% TARGET : 14. (robot rouge).
% POSITION ROBOT : rouge(5,15).
% SEQUENCE DE COUPS : robot rouge : gauche,haut,gauche,bas.

move( _, [] ) :- !.
%        ^
%        |
%        Action: next configuration
