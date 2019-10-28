
// Cascades

// Cascade con strings?
// no funciona, ya que si vemos el método de todas estas funciones
// devuelve strings, y no modifican las pasadas!
cascade_con_strings(){
    print( " Dart"
  ..trim()
  ..toUpperCase()
  ..replaceAll('D', 'S'));
}

// Cascade con lists ?
// Funciona, ya que utilizamos métodos que modifican la lista a retornar
cascade_con_listas(){
  return [1,3,2,4,5]
  ..add(6)
  ..sort();
}

sin_cascade_listas(){
  var lista = [1,3,2,4,5];
  lista.add(6);
  lista.sort();
  return lista;
}


operadores(){
  var persona = null;
  // Que valdrá nombre?
  var nombre = persona?.nombre;
  // Esto es algo similar a un nomad.

  print( "Nombre: $nombre");

  //Podriamos tener un default si el nombre es null
  nombre =  persona?.nombre ?? 'Usuario desconocido';
  print( "Nombre: $nombre");

  // De manera similar podemos hacer
  nombre = persona?.nombre == null ? persona?.nombre : "extraño";
  
}

void main(){
  cascade_con_strings();
  print(cascade_con_listas());
  print(sin_cascade_listas());
  operadores();
}