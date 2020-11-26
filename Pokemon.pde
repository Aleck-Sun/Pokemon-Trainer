class Pokemon {
  //Fields
  String type;
  String gender;
  String name;
  int level;
  int exp;
  int index;
  Move[] moveset;
  
  //Constructor
  Pokemon( String t, String g, String n, int lvl, int expoints ){
    this.type = t;
    this.gender = g;
    this.name = n;
    this.moveset = new Move[4];
    
    //Level up if experience is higher than required for level
    while (lvl*10 <= expoints){
      expoints -= lvl*10;
      lvl += 1;
    }
    
    //Can't be above level 100
    if (lvl >= 101){
      lvl = 100;
      exp = 0;
    }
    
    this.level = lvl;
    this.exp = expoints;
  }
  
  //Methods
  //Learning a new move
  void learnMove(Move m){
    //Check if there is space left for a new move
    int i = 0;
    while (i < 4 && this.moveset[i] != null)
      i += 1;
      
    if (i == 4)
      println(this.name + " already knows 4 moves!");
      
    else{
      this.moveset[i] = m;
      m.index = i;
      println(this.name + " learned " + m.name + "!");
    }  
    println();
  }
  
  //Replace a move with new one
  void replaceMove(Move m, Move m2){
    this.moveset[m.index] = m2;
    m2.index = m.index;
    
    println(this.name + " forgot " + m.name + " and learned " + m2.name + "!");
    println();
  }
  
}
