%% EXERCICE 6

%G(s)=G0/(1+(2z/wn)s+s^2/wn^2);

%Définition de G0, wn et z
G0=2; %Pour publish je défini les valeurs dans le code
wn=1;

%On demande de rentrer les valeurs à l'utilisateur
%G0=input("Entrez un gain ="); 
%wn=input("Entrez un wn =");

z=linspace(0.2,2,10); %On étudie 10 valeurs du facteur d'amortissement

%Echelle en pulsations
nw=100;
ndec=2;
pwmin= round(log10(wn/(10^ndec)));
pwmax= round(log10(wn*(10^ndec)));

w=logspace(pwmin,pwmax,nw);

%Echelle en temps
tmin=0;
tmax=10/wn;
Nt=100;

t=linspace(tmin,tmax,Nt);

NumG=G0; %On défini le numérateur

%Bode
figure(1)
for k = 1:length(z)
    DenG = [1/wn^2 2*z(k)/wn 1]; %On définit le dénominateur pour chaque valeur de z
    G=tf(NumG,DenG); %On définit la fonction de transfer
    bode(G,w); %On trace le diagramme de Bode associé
    title('Diagrammes de Bode')
    hold on; %On conserve le diagramme de Bode actuel pour superposer les différents diagramme des différentes itérations
    grid;
end
legend('z=0.2','z=0.4','z=0.6','z=0.8','z=1','z=1.2','z=1.4','z=1.6','z=1.6','z=1.8','z=2'); %On affiche la légende
hold off

%Réponse indicielle
figure(2)
for k = 1:length(z)
    DenG = [1/wn^2 2*z(k)/wn 1]; %Le fonctionnement est le même que pour Bode
    G=tf(NumG,DenG);
    step(G,t); %On trace la réponse indicielle
    title('Réponse indicielle')
    hold on;
    grid;
end
legend('z=0.2','z=0.4','z=0.6','z=0.8','z=1','z=1.2','z=1.4','z=1.6','z=1.6','z=1.8','z=2');
hold off

%Nichols
figure(3)
for k = 1:length(z)
    DenG = [1/wn^2 2*z(k)/wn 1]; %Le fonctionnement est le même que précédemment
    G=tf(NumG,DenG);
    nichols(G,w); %On trace le diagramme de Nichols
    title('Diagramme de Nichols')
    hold on;
    ngrid;
end
legend('z=0.2','z=0.4','z=0.6','z=0.8','z=1','z=1.2','z=1.4','z=1.6','z=1.6','z=1.8','z=2');
hold off
