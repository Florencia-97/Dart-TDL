
// dart --enable-asserts dartTypes.dart 

void main(){
  // podemos declarar los tipos
  int a = 1;
  // O dart los puede también inferir
  var b = 2;
  var c = "2";

  assert(a is int);
  assert(b is int);
  assert(c is int, "c no es un int");

  // A su ves podemos asegurarnos que no
  // es de un tipo específico

  assert( b is! String);

}