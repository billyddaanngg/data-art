int[] electricity;
int[] war;

void setup() {
  size(1280, 720);
  smooth(8);
  electricity = loadData("electricityData.csv");
  war= loadData("warData.csv");

  //answers = sort(answers);
  println(electricity.length);
  //println(answers);
}

void draw(){
  yAxis();
  xAxis();
}

void yAxis(){
  line(width/2,height,width/2,0);
  
  for(int i = height; i > 0; i = i - (height/100)){
    line((width/2)-10,i,(width/2)+10,i);
  }
}

void xAxis(){
  line(width/2,height,width,height);
  
  
  // electricity line
  for(int i = width/2; i < width; i = i + (width/100)){
    line(i,height,i,height-10);
    
    // draw a line from the data's time to data's measure
//    line(i,height,width/2,electricity[]);
int data = i / (width/100);
println(data);
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

