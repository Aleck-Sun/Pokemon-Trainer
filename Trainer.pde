class Trainer{
  //Fields
  String gender;
  String name;
  Pokemon[] myPokemon;
  
  //Constructor
  Trainer( String g, String n ){
    this.gender = g;
    this.name = n;
    this.myPokemon = new Pokemon[6];
  }

  //Methods
  //Display trainer info
  void trainerInfo(){
    //Start screen
    frame = 0;
    
    //Buttons
    fill( 50, 50, 50 );
    rect( 100, 375, 275, 100 );
    rect( 425, 375, 275, 100 );
    
    //Info
    fill(255);
    textSize(60);
    textAlign(CENTER, CENTER);
    text(this.name + " " + this.gender, width-400, height - 500);
    textSize(35);
    text("My Pokemon", 237.5, 420);
    text("Train Pokemon", 562.5, 420);
  }
  
  //Display pokemon info
  void pokeInfo(){
    //Pokemon info
    
    //Buttons
    fill(50, 50, 50);
    rect( 50, 87.5, 300, 150 );
    rect( 450, 87.5, 300, 150 );
    rect( 50, 325, 300, 150 );
    rect( 450, 325, 300, 150 );
    rect( 50, 562.5, 300, 150 );
    rect( 450, 562.5, 300, 150 );
    fill(255);
    textAlign(LEFT, CENTER);
    textSize(25);
    text("BACK", 20, 770);
    
    //Info
    int i = 0;
    float x = 70;
    float y = 130;
    
    //Print info on screen
    while (i < 6 && this.myPokemon[i] != null){
      text(this.myPokemon[i].name + "  " + this.myPokemon[i].gender, x, y);
      text("Type: " + " " + this.myPokemon[i].type, x, y+30);
      text("Lvl: " + this.myPokemon[i].level + "    " + "Exp: " + this.myPokemon[i].exp, x, y+60);
      if(i%2 == 0)
        x+=400;
      else{
        x-=400;
        y+=237.5;
      }
      i++;
    }
    
  }
  
  //Display pokemon moves  
  void moveInfo(int j){
    //Move frame
    frame = 3;
    
    //Buttons
    fill(50, 50, 50);
    rect( 50, 200, 300, 150 );
    rect( 450, 200, 300, 150 );
    rect( 50, 450, 300, 150 );
    rect( 450, 450, 300, 150 );
    fill(255);
    textAlign(LEFT, CENTER);
    textSize(25);
    text("BACK", 20, 770);
    
    //Info
    textSize(30);
    int i = 0;
    float x = 70;
    float y = 250;
    
    //Printing info on screen
    while (i < 4 && this.myPokemon[j].moveset[i] != null){
      text(this.myPokemon[j].moveset[i].name, x, y);
      text("Damage: " + " " + this.myPokemon[j].moveset[i].dmg, x, y+40);
      if(i%2 == 0)
        x+=400;
      else{
        x-=400;
        y+=250;
      }
      i++;
    }
  }
  
  //Catch pokemon
  void catchPokemon( Pokemon p ){
    //Check if there is space left for a new pokemon
    int i = 0;
    while (i < 6 && this.myPokemon[i] != null)
      i += 1;
     
    if (i == 6)
      println(this.name + " already has 6 Pokemon!");
    
    //Catch pokemon if there is space
    else{
      this.myPokemon[i] = p;
      p.index = i;
      println(this.name + " caught " + p.name + "!");
    }
    println();
  }
  
  //Train and earn exp points to level up pokemon
  void trainPokemon( int i ){
    //Frame
    frame = 4;
    
    //Buttons
    textAlign(LEFT, CENTER);
    textSize(25);
    text("BACK", 20, 770);
    
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(50);
    if (this.myPokemon[i].level != 100){
      this.myPokemon[i].exp += 10;
      text(this.myPokemon[i].name + " + 10 exp!", width/2, height/2);
    }
    
    else
      text(this.myPokemon[i].name + " is already max level!", width/2, height/2);
      
    //Level up if enough exp
    if (this.myPokemon[i].level*10 <= this.myPokemon[i].exp){
      this.myPokemon[i].exp -= this.myPokemon[i].level*10;
      this.myPokemon[i].level += 1;
      
      //Level 100 is highest
      if (this.myPokemon[i].level == 100)
        this.myPokemon[i].exp = 0;
    }
  }
}
