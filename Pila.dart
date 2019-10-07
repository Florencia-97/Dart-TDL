// Excepciones en Dart
class PilaVaciaException implements Exception { 
   String errMsg() => 'No se pueden sacar elementos de una pila vacia'; 
} 
// Creamos una simple clase pila en Dart
class Pila{
  List pila;

  //Nuestro constructor por defecto no hace nada
  Pila();

  //Declaramos un constructor que recibe una lista
  Pila.fromList(List list){
    pila = list;
  }

  void push(value){
    pila.add(value);
  }

  dynamic pop(){
    if (pila.isEmpty) throw PilaVaciaException();
    return pila.removeLast();
  }

  bool estaVacia(){
    return pila.isEmpty;
  }
}

void main(){
  List lista = [1,2,3,4];
  Pila pila = Pila.fromList(lista);

  // Ejemplo de try catch
  for (int i=0; i < 5 ; i++){
    try {
      print(pila.pop());
    }
    catch(e){
      // imprimios el error de nuestra excepción
      print(e.errMsg());
    }
  }
}