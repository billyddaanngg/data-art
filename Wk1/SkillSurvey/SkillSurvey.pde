int [] answers;

void setup() {
  size(1280, 720);
  smooth(8); //4,6,8, or 16
  loadData();
  answers = sort(answers);
  println(answers);
}

void draw() {
  background(255);
  drawCircles(answers);
}

void drawGraph(int[] numbers){
  for(int i = 0; i < numbers.length; i++){
    int n = numbers[i];
    float x = map(i, 0, numbers.length, 100, width - 100);
    float y = height - 100;
    float w = 5;
    float d = map(n, 0, 10, 0, height - 100);
  rect(x,y,w,h);
  
  }
}

void drawCircles(int[] numbers){
  for(int i = 0; i < numbers.length; i++){
    int n = numbers[i];
    float x = map(i, 0, numbers.length, 100, width - 100);
    float y = height/2;
    float d = map(n, 0, 10, 0, 100);
    //line(x,y,x,h);
  ellipse(x,y,d,d);
  
  }
}


void loadData() {
  Table data = loadTable("andswer.csv", "header");
  answers = new int[data.getRowCount()];
  
  for(int i = 0; i < data.getRowCount(); i++ {
    //get the second column of each row and put it in the array
  answers[i] = row.getRow(1).getInt(1);
    //for (TableRow row:data.rows()) {
    //println(row.getString(1)); //print out name of column
  }
}

