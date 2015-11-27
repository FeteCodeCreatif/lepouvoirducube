$vpt = [ 0, 0, 25 ]; // translation de la vue par défaut
$vpr = [ 55, 0.00, -45 ]; // rotation de la vue par défaut
$vpd = 110;



// En dessous je ne modifie que si je comprends ce que je fais,
// et je demande à un animateur de regarder avec moi

aucentre = 0; O=0;o=O;
enlongueur = 1; C=1;c=C;
danslecoin = 2; V=2;v=V;

gardeles = 0; basecomplete = 0; X=0;x=X;
enleve1coin = 1; unseulcoin = 1; Y=1;y=Y;
enleve2coins = 2; enleve2coin = 2; I=2;i=Y;

taille = 25;
interieur = 10;
hauteur = 30;
base_hauteur = 15;
epaisseur = 0.3;

module base(taille) {
    cube([taille,taille,epaisseur]);
}

module tour(interieur,hauteur,positiondelatour) {
    if (positiondelatour==O) {
        translate([(taille-interieur)/2,(taille-interieur)/2,0])
        cube([interieur,interieur,hauteur]);
    }
    if (positiondelatour==C) {
        translate([(taille-interieur)/2,(taille-interieur)/2,0])
        cube([taille-((taille-interieur)/2),interieur,hauteur]);
    }
    if (positiondelatour==V) {
        translate([(taille-interieur),0,0])
        cube([interieur,interieur,hauteur]);
    }
}

module moat(interieur,positiondelatour) {
    if (positiondelatour==O) {
        translate([(taille-interieur-2)/2,(taille-interieur-2)/2,0])
        cube([interieur+2,interieur+2,base_hauteur]);
    }
    if (positiondelatour==C) {
        translate([(taille-interieur-2)/2,(taille-interieur-2)/2,0])
        cube([taille,interieur+2,base_hauteur]);
    }
    if (positiondelatour==V) {
        translate([(taille-interieur)-2,0,0])
        cube([interieur+2,interieur+2,base_hauteur]);
    }
}

module coin(offset_x,offset_y) {
    translate([offset_x,offset_y,0])
    cube([(taille-interieur)/2,(taille-interieur)/2,base_hauteur]);
}

module base(taille,hauteur) {
    cube([taille,taille,hauteur]);
}

module bloc(positiondelatour,coins,hauteurdelatour, hauteurdelabase) {

    difference() {
        union() {
            base(taille);
            difference() {
                base(taille,min(base_hauteur,hauteurdelabase));
                moat(interieur,positiondelatour);
            }
            tour(interieur,min(hauteur,hauteurdelatour),positiondelatour);
        }
        union() {
            if(coins>X) coin(0,0);
            if(coins>Y) coin(taille-(taille-interieur)/2,taille-(taille-interieur)/2);
        }
    }
}

// Ici c'est mon objet à moi: je peux changer les valeurs après les =

bloc(

// la tour peut être : aucentre, danslecoin ou enlongueur

positiondelatour = aucentre

,// Je mets gardeles, enleve1coin ou enleve2coins

coins = enleve2coins

,// La hauteur de ma tour entre 0 et 30 mm

hauteurdelatour = 12

,// La hauteur de ma base entre 0 et 15 mm

hauteurdelabase = 4

 );
