void main() {
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }
}


///////

addNumbers(x,y){
  return x+y;
}
OR
addNumbers(int x,int y){
  return x+y;
}
OR
int addNumbers(int x,int y){
  return x+y;
}


void main() {
  print(addNumbers(1,2));
}

