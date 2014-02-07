int[] answers;
int[] answers2;

void setup() {
  size(1280, 720);
  smooth(8);
  answers = loadData("electricityData.csv");
  answers2= loadData("warData.csv");

  //answers = sort(answers);
  println(max(answers));
  //println(answers);
}

void draw() {
  background(255);
  //drawCircles(answers);
  drawRadialGraph(answers, true);
  drawRadialGraph(answers2, false);
}

void drawRadialGraph(int[] numbers, boolean dir) {
  for (int i = 0; i < numbers.length; i++) {
    int n = numbers[i];
    float x = width/2;
    float y = height/2;
    //float w = 5;
    float d = -map(n, 0, max(numbers), 0, height/2);

    float r;
    if (dir) // electricity
      r = map(i, 0, numbers.length, 0, PI);
    else // war
      r = map(i, 0, numbers.length, TAU, PI);


    // color   
    float c = map(n, 0, max(numbers), 0, 255);
    if (dir) // electricity
      fill(c, 255, 0);
    else // war
      fill(255, c, 0);

    noStroke();

    pushMatrix();
    translate(x, y);
    rotate(r);
    ellipse(0, -50, d, d);
    popMatrix();
  }
}

void drawGraph(int[] numbers) {
  for (int i = 0; i < numbers.length; i++) {
    int n = numbers[i];
    float x = map(i, 0, numbers.length, 100, width - 100);
    float y = height - 100;
    //float w = 5;
    float d = -map(n, 0, max(numbers), 0, height - 100);
    ellipse(x, y, d, d);
  }
}


void drawCircles(int[] numbers) {
  for (int i = 0; i < numbers.length; i++) {
    int n = numbers[i];
    float x = map(i, 0, numbers.length, 100, width - 100);
    float y = height/2;
    float d = map(sqrt(n), 0, sqrt(max(numbers)), 0, sqrt(300));
    fill(#ff6600, 150);
    noStroke();
    ellipse(x, y, d, d);
  }
}

int[] loadData(String url) {
  Table data = loadTable(url);
  int[] array = new int[data.getRowCount()];

  for (int i = 0; i < data.getRowCount(); i++) {
    //get the first column of each row and put it in the array
    array[i] = data.getRow(i).getInt(0);
  }

  return array;
}

