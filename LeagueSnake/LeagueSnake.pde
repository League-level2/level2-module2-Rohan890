//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
int x;
int y;

// Add a constructor with parameters to initialize each variable.
Segment(int x,int y){
this.x = x;
this.y = y;
}


}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
Segment head;
int foodX;
int foodY;
int direction = UP;
int eaten;
ArrayList<Segment> tail;


//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500,500);
frameRate(4);
dropFood();
head = new Segment(20,20);
tail = new ArrayList<Segment>();
}

void dropFood() {
  //Set the food in a new random location
      
for (int i = 0; i < 100; i++) {

foodX = ((int)random(50)*10);
foodY = ((int)random(50)*10);

}
}


//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(0,0,0);
  drawFood();
  move();
  drawSnake();
  eat();
}

void drawFood() {
  //Draw the food
ellipse(foodX+5, foodY+5, 10, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
rect(head.x, head.y, 10,10);
manageTail();
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
for (int i = 0; i < tail.size(); i++) {
 fill(255,255,255);
rect(tail.get(i).x,tail.get(i).y,10,10);
}
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
  tail.add(new Segment(head.x, head.y));
tail.remove(0);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  for (int i = 0; i < tail.size(); i = i+1) {
  if(head.x == tail.get(i).x && head.y == tail.get(i).y){
  tail.clear();
  eaten = 1;
  tail.add(new Segment(head.x, head.y));
  }
  }

}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if(keyCode == 37){
  direction = LEFT;
  }
    if(keyCode == 38){
  direction = UP;
  }
    if(keyCode == 39){
  direction = RIGHT;
  }
    if(keyCode == 40){
  direction = DOWN;
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  checkBoundaries();
   
  switch(direction) {
  case UP:
    head.y -= 10;
    break;
  case DOWN:
    head.y += 10;
    break;
  case LEFT:
   head.x -= 10; 
    break;
  case RIGHT:
    head.x += 10;
    break;
  }

}

void checkBoundaries() {
 if(head.x == -10){
   head.x = 490; 
 }
  if(head.x == 510){
   head.x = 0; 
 }
 if(head.y == -10){
   head.y = 490; 
 }
   if(head.y == 510){
   head.y = 0; 
 }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
if(head.x == foodX && head.y == foodY){
  foodX = ((int)random(50)*10);
  foodY = ((int)random(50)*10);
  eaten += 1;
  tail.add(new Segment(head.x, head.y));
}
}
