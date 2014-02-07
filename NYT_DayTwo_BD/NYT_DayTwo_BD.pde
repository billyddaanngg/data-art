/*

 NYTimes Data Exploration
 binhdang555@gmail.com
 February 2014
 
 - the CSV war.csv can be replaced with any int list
 
 */
int[] numbers;
String[] colorList = {
  "FFedf8fb", 
  "ffb2e2e2", 
  "ff66c2a4", 
  "ff2ca25f", 
  "ff006d2c"
};

color getColor(float f) {
  //f is a number between 0 and 1
  //so let's convert it to an int to pick rom the array
  int i = floor(f * (colorlist.length - 1));
  color col = unhex(colorList[i]);
  return(col);
}

void setup() {
  size(1280, 720, P3D);
  smooth();
  loadData("warData.csv");
}

void draw() {
  background(0);
  colorMode(HSB);
  drawGrid(numbers, 10, 30);
}

void drawGrid(int[] nums, int cols, float s) {
  for (int i = 0; i < nums.length; i++) {
    //draw every block in the grid
    int n = nums[i];
    float s = 10;
    float x = (i % cols) * s;
    float y = floor(i/cols) * s; //floor rounds down
    float c = map(n, 0, max(nums), 0, 255);
    //fill(c);
    color col = getColor(map(n,0,max(nums),0,1));
    fill(255, c, 0);
    rect(x, y, s, s);
  }
}

void loadData(String fileName) {
  String[] rows = loadStrings(fileName);
  numbers = new int[rows.length];
  for (int i = 0; i < rows.length; i++) numbers[i] = int(rows[i]);
}

