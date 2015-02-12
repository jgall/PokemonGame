class Game {
  ArrayList<Projectile> projectiles;
  Pikachu pik;
  Charmander cha;
  //ArrayList<Platform> platforms;
  
  
  Game(){
    pik = new Pikachu(this);
    cha = new Charmander(this);
    projectiles = new ArrayList<Projectile>();
  }
  
  void tick() {
    
    updateAllProjectiles();
    drawAllProjectiles();
    updateAllPokemon();
    drawAllPokemon();
    isDead();
    showHP();
  }
  void addProjectile(Projectile p) {
      projectiles.add(p);
  }  
  void isDead(){
    int e = 0;
    if (pik != null || cha != null) { 
      if (pik.isUnconscious()) {
        textSize(115);
        fill(255,0,0);
        text("Charmander Wins!", 30, 360);
        while (e<10) {
          cha.jump();
          e++;
        }
      }
       else if (cha.isUnconscious()) {
        textSize(115);
        fill(#ffff26);
        text("Pikachu Wins!", 120, 360);
        while (e<10) {
          pik.jump();
          e++;
        }
       }
    } 
    
  }
  void updateAllProjectiles() {
    for(int i = 0; i < projectiles.size(); i++){
      Projectile p = projectiles.get(i);
      p.update();
      if(cha.hitTest(p) == true){
        cha.jump();
        projectiles.remove(i);
        cha.loseHP();
        
      }
       else if(pik.hitTest(p) == true){
        pik.jump();
        projectiles.remove(i);
       
        pik.loseHP();
      }
    }
  }
  void drawAllProjectiles() {
    for(int i = 0; i < projectiles.size(); i++){
      Projectile p = projectiles.get(i);
      p.drawSelf();
    }
  }
  
  void updateAllPokemon() {
    if (cha != null && pik != null) {
      moveLR();
      jump();
      cha.wrap();
      pik.wrap();
      cha.updatePosition();
      pik.updatePosition();
    }
  }

  void drawAllPokemon() {
    if (cha != null && pik != null) {
      pik.drawSelf();
      cha.drawSelf();
    }  
  }
  void showHP(){
    textSize(100);
    fill(255,0,0);
    text(cha.currentHP, 900,100);
    fill(#ffff26);
    text(pik.currentHP, 10,100);
  }
  Pikachu getPikachu() {
    return pik;
  }
  Charmander getCharmander() {
    return cha;
  }
}
