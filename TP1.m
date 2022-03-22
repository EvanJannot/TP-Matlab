%% 1 - GENERALITE 

A = [1 2 3 ; 4 5 6 ; 7 8 9 ];   % Créer une matrice

B=inv(A);                       % Inverse une matrice
disp(B);

C=det(A);                       % Calcul le déterminant d'une matrice
disp(C);

D=A';                           % Calcul la transposée d'une matrice

disp(A);                        %Affiche l'élément

E = A(1,2);                     %Elément de la ligne 1, colonne 2

F = A(1,:);                     %Tous les éléments de la ligne 1

G = A(:,1);                     %Tous les éléments de la colonne 1   
disp(G);

% x(1:5) -> éléments 1 à 5 du vecteur x
% x(:) -> éléments du vecteur x

%% 2 - FONCTIONS %%

%clc -> Efface la fenêtre de commande
%close all -> Ferme les figures
%clf -> Ferme la figure désignée
%clear all -> efface le workspace 

%whos -> Affiche l'espace de traval
%size -> Retourne la dimension d'une matrice
%length -> Retourne la taille d'un vecteur

%round -> Arrondi la valeur
%ceil -> Arrondi tous les éléments d'un vecteur/matrice

%zeros -> Créé une matrice de 0
%ones -> Créé une matrice de 1
%eye -> Matrice identité 

%& -> ET logique
%| -> OU logique 

%% 3 - FONCTIONS GRAPHIQUES 

%figure(i) -> Créé la figure n°i
%plot(t,y) -> représentation temporelle

%title -> Titre la figure
%xlabel -> Légende abscisse
%ylabel -> Légende ordonnée
%gird -> Grille dans l'arrière plan

t=linspace(0, 5*pi); %Elément espacés linéairement

%Figure 1
F1 = figure(1); 

plot(t,sin(t)); %Fonction sinus
title('Fonction sinus');
xlabel('Temps (t)');
ylabel('sin(t)');
grid;

%Figure 2
F2 = figure(2);

plot(t,cos(t)); %Fonction cosinus
title('Fonction cosinus');
xlabel('Temps (t)');
ylabel('cos(t)');
grid;

%Figure 3
F3 = figure(3);
W=logspace(-1,2,100); %Elément espacés linéairement avec échelle logarithmique

%Définition de l'intégrateur
G=1./W; %Le . sert a effectuer l'opération sur chaque élément pour des vecteurs

GdB = 20*log10(G); %On calcul le module de l'intégrateur en dB

p=-90*ones(1,100); %On calcule l'argument

subplot(2,1,1) %On sépare en 2 figures

semilogx(W,GdB) %La première représente le gain avec une échelle logarithmique
grid;

subplot(2,1,2) %La deuxième l'argument

semilogx(W,p)
grid;

%% 4 - BOUCLES 

%for 
%while
%if 

%Exercice 1

i = 5 ;
j = 20 ;
M = zeros(i,j) ;        %On créé une matrice de 0 de la bonne dimension

for k = 1:j             %On parcourt les 20 colonnes
    M(:,k) = k;         %On remplace tous les éléments d'une colonne par le numéro de la colonne
end

disp(M)                 %On affiche la matrice

%Exercice 2

A=[1 2 3 4 5 6];
B=[7 8 9];

%Si A est plus grand
if (length(A)>length(B))
    Diff = length(A) - length(B);   %On récupère la différence de taille
    Bbis =[zeros(1,Diff) B];        %On comble le vecteur plus petit avec des 0
    C = A + Bbis;                   %On additionne les vecteurs
    disp(C)

 %Si B est plus grand
else 
    Diff = length(B) - length(A);  
    Abis =[zeros(1,Diff) A];          
    C =  B + Abis;                  
disp(C)
end


%% 5 - CONTROL TOOLBOX 

%On défini les coefficients du numérateur et du dénominateur de notre fonction de transfert
NumG=[1 2]; 
DenG=[4 5 6 1];
G=tf(NumG,DenG); %On créé la fonction de transfert

W=logspace(-1,2,100); %On défini l'espace linéaire avec échelle logarithmique

%Figure (4)
F4 =figure(4); 
bode(G,W) %On trace le diagramme de Bode
grid;

[g,p]=bode(NumG,DenG,W); %Récupérer les valeurs sous forme de vecteurs
[gwu,pwu]=bode(NumG,DenG,2); %Affiche une valeur 

%Figure 5
F5 = figure(5); 
nichols(G,W); %On trace le diagramme de Nichols
ngrid;

%Figure 6
F6 = figure(6);

t=linspace(0,30,100); %On définit l'espace linéaire pour la réponse indicielle

NumC=[1 2];
DenC = [6 1];
NumF = [5 7];
DenF = [1 1];

[NumB, DenB] = series(NumC,DenC,NumG,DenG); %On calcule la fonction en boucle ouverte

[NumH,DenH]=feedback(NumB,DenB,NumF,DenF); %On calcule en boucle fermée

step(NumH,DenH,t) %On trace la réponse indicielle
grid;