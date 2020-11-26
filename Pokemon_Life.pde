//Variables
int frame;
String male;
String female;
PFont f;

Trainer bowen;

Pokemon eevee;
Pokemon caterpie;
Pokemon magikarp;
Pokemon charizard;
Pokemon mewtwo;
Pokemon salamence;

Move tackle;
Move flamethrower;
Move wingAttack;
Move splash;
Move psystrike;
Move hyperBeam;
Move dragonPulse;
Move zenHeadbutt;

void setup(){
  size(800, 800);
  background(0);
    
  frame = 0;
  male = "\u2642";
  female = "\u2640";
  
  f = createFont("Arial", 24);
  textFont(f);
  
  //Creating objects
  bowen = new Trainer( male, "Pokemon Master Bowen" );

  eevee = new Pokemon( "Normal", male, "Eevee", 10, 15 );
  caterpie = new Pokemon( "Bug", female, "Caterpie", 7, 20 );
  magikarp = new Pokemon( "Water", female, "Magikarp", 15, 120 );
  charizard = new Pokemon( "Fire/Flying", male, "Charizard", 89, 150 );
  mewtwo = new Pokemon( "Psychic", female, "Mewtwo", 100, 0 );
  salamence = new Pokemon( "Dragon", male, "Salamence", 95, 750 );
  
  tackle = new Move( 40, "Tackle" );
  flamethrower = new Move( 90, "Flamethrower" );
  wingAttack = new Move( 60, "Wing Attack" );
  splash = new Move( 0, "Splash" );
  psystrike = new Move( 100, "Psystrike" );
  hyperBeam = new Move( 150, "Hyper Beam" );
  dragonPulse = new Move( 85, "Dragon Pulse" );
  zenHeadbutt = new Move( 80, "Zen Headbutt" );
  
  //Methods
  bowen.catchPokemon( eevee );
  bowen.catchPokemon( caterpie );
  bowen.catchPokemon( magikarp );
  bowen.catchPokemon( charizard );
  bowen.catchPokemon( mewtwo );
  bowen.catchPokemon( salamence );
  bowen.catchPokemon( caterpie );
  
  eevee.learnMove( tackle );
  
  caterpie.learnMove( tackle );
  
  magikarp.learnMove( splash );
  magikarp.learnMove( tackle );
  
  charizard.learnMove( tackle );
  charizard.learnMove( wingAttack );
  charizard.learnMove( hyperBeam );
  charizard.learnMove( dragonPulse );
  charizard.learnMove( flamethrower );
  
  mewtwo.learnMove( psystrike );
  mewtwo.learnMove( flamethrower );
  mewtwo.learnMove( hyperBeam );
  mewtwo.learnMove( zenHeadbutt );
  
  salamence.learnMove( dragonPulse );
  salamence.learnMove( wingAttack );
  salamence.learnMove( hyperBeam );
  salamence.learnMove( flamethrower );
  
  charizard.replaceMove( tackle, flamethrower );
  salamence.replaceMove( flamethrower, zenHeadbutt );
  
  bowen.trainerInfo();
}

void draw(){
}

//Navigating Screen
void mousePressed(){
  //Trainer info screen
  if (frame == 0){
    if(mouseY >= 375 && mouseY <= 475){
      if(mouseX >= 100 && mouseX <= 375){
        background(0);
        bowen.pokeInfo();
        frame = 1;
      }
      if(mouseX >= 425 && mouseX <= 700){
        background(0);
        bowen.pokeInfo();
        frame = 2;
      }
    }
    
  }
  
  //Pokemon info screen
  else if (frame == 1 || frame == 2){
    if(mouseX >= 50 && mouseX <= 350){
      if(mouseY >= 87.5 && mouseY <= 237.5){
        background(0);
        if (frame == 1)
          bowen.moveInfo(0);

        else
          bowen.trainPokemon(0);
      }
      if(mouseY >= 325 && mouseY <= 475){
        background(0);
        if (frame == 1)
          bowen.moveInfo(2);

        else
          bowen.trainPokemon(2);
      }
      if(mouseY >= 562.5 && mouseY <= 712.5){
        background(0);
        if (frame == 1)
          bowen.moveInfo(4);

        else
          bowen.trainPokemon(4);
      }
    }
    
    if(mouseX >= 450 && mouseX <= 750){
      if(mouseY >= 87.5 && mouseY <= 237.5){
        background(0);
        if (frame == 1)
          bowen.moveInfo(1);

        else
          bowen.trainPokemon(1);
      }
      if(mouseY >= 325 && mouseY <= 475){
        background(0);
        if (frame == 1)
          bowen.moveInfo(3);

        else
          bowen.trainPokemon(3);
      }
      if(mouseY >= 562.5 && mouseY <= 712.5){
        background(0);
        if (frame == 1)
          bowen.moveInfo(5);

        else
          bowen.trainPokemon(5);
      }
    }
    if(mouseX >= 0 && mouseX <= 100 && mouseY >= 750 && mouseY <= 800){
        background(0);
        bowen.trainerInfo();
    }
  }
  
  //Move info or exp screen
  else{
    if(mouseX >= 0 && mouseX <= 100 && mouseY >= 750 && mouseY <= 800){
        background(0);
        bowen.pokeInfo();
        if (frame == 3)
          frame = 1;

        else
          frame = 2;
    }  
  }
}
