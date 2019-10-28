// FUNCION BASICA

// podes omitir el tipo que devuelve
hello_world(){
  print("Hola Mundo");
}

// O escribirlo, recomendado por Dart al crear APIs públicas
void hello_world_con_tipo(){
  print("Hola Mundo");
}

// se pueden escribir con => funciones de un sentencia en una linea
void hello_world_una_linea() => print("Hola mundo");

funciones_basicas(){
  print("Funciones básicas:");
  hello_world();
  hello_world_con_tipo();
  hello_world_una_linea();
}

// PARAMETROS

// nuevamente podemos no especificarlos
suma(x,y){
  return x + y;
}

// o si hacerlo
suma_con_tipos(int x, int y){
  return x + y;
}

// podemos tener parámetros opcionales
suma_parametro_opcional(int x, [int y]){
    if (y != null){
      return x + y;
    }
    return x + 1;
}

// En este caso, podemos simplificar la función anterior
// utilizando valores default de nuestros parámetros
suma_parametro_default(x,[y = 1]){
  return x + y;
}

// finalmente, recordar que se puede escribir, en este caso, con una linea
// No utilizamos un return, ya que => es una abreviación de  { return expr; }
// No funciona para statements (ya que tampoco podemos hacer return de una sentencia if)
int suma_una_linea(int x, [int y = 1]) =>  x + y;

parametros(){
  print("Parámetros:");
  var x = 1;
  var y = 1;
  print(suma(x,y));
  print(suma_con_tipos(x, y));
  print(suma_parametro_opcional(x));
  print(suma_parametro_default(x));
  print(suma_una_linea(x));
}

// FUNCIONES COMO PARAMETROS Y VARIABLES

//Podemos pasar funciones como parámetros, ya que las funciones
// como todo en Dart, son Objetos.

mult_por_dos(x) => x*2;

multiplicar_por_dos_elems_lista(lista){
  //metodos de alto orden ya que pueden recibir funciones
  //agregar map o where
  lista.forEach(mult_por_dos);
}

// También una variable puede ser una función
saludar_personas(personas){
  var saludar = (String nombre) => print("Hola $nombre");
  for (var persona in personas){
    saludar(persona);
  }
}

funciones_como_params_y_vars(){
  print("Funciones como parametros y variables:");
  var lista = [1,2,3];
  print(lista);
  multiplicar_por_dos_elems_lista(lista);
  print(lista);
  var personas = ["Marty", "Doc"];;
  saludar_personas(personas);
}

void main(){
  funciones_basicas();
  parametros();
  funciones_como_params_y_vars();
}