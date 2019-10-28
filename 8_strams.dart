import 'dart:io';

Stream<int> countStream(int max) async * {
  for (int i = 0; i < max; ++i) {
    yield i;
    sleep(Duration(seconds: 1));
  }
}

void main() {
  print('start');
  countStream(5).listen((data){
    print(data);
  },
  onDone: (){
    print("Done");
  });
}