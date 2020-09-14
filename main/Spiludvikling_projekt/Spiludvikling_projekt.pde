Collectables c = new Collectables();
Dust[] d;
Hunter h = new Hunter();
Map m = new Map();
Pause ps = new Pause();
Player p = new Player();
Stun s = new Stun();
Traps t = new Traps();

import processing.sound.*;
SoundFile bgMusic;

boolean gamePaused = false;
PImage player;
PImage hunter;
PVector vertical = new PVector(0, 100);
float playerX;
float playerY;
float hunterX;
float hunterY;
int dustCount;


void setup() {
  fullScreen(1);
  //bgMusic = new SoundFile(this, "/*bgMusic i .wav format*/");
  //bgMusic.loop();
  playerX = width/2;            //placeholder for player's spawn position
  playerY = height/2;
  hunterX = random(200, 2000);  //placeholder for hunter's spawn position
  hunterY = 500;
  dustCount = floor(height*0.4861);
  d = new Dust[dustCount];
  for (int i = 0; i<d.length; i++) {
    d[i] = new Dust(random(width*0.0020, width*0.9980), random(height*0.0035, height*0.9965), random(width*0.00003906, width*0.0001171), random(height*0.00006944, height*0.0002083), random(70.0, 120.0), floor(random(width*0.001563, width*0.001953)), floor(random(height*0.002778, height*0.00347)));
  }

  player = loadImage("player.png");  //placeholder pic is 128x128 pixels
  hunter = loadImage("hunter.png");  //placeholder pic is 250x260 pixels

  imageMode(CENTER);
}


void draw() {
  ps.pauseGame();
  if (gamePaused == false) {
    background(0);
    text("Press 'p' to pause     Press 'o' to unpause", width*0.0117, height*0.0208);
    textSize(12);
    text(frameCount, width*0.005859, height*0.9896);

    p.playerRotation();
    h.hunterRotation();

    for (int j = 0; j < d.length; j++) {
      d[j].updateDust();

      if (d[j].dustPos.x < 0 - d[j].dustSizeX) {
        d[j].dustPos.x = width + d[j].dustSizeX;
      }
      if (d[j].dustPos.y > height + d[j].dustSizeY) {
        d[j].dustPos.y = 0 - d[j].dustSizeY;
      }
    }
  }
}
