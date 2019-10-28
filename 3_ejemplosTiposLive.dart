

void main(){
  dynamic hola = "hola";
  if (hola is String){
     print("Hola es una cadena");
  }
  hola = 5;
  if (hola is int){
    print("ahora es un int hola");
  }
}








// void main(){
//   var hola = "Hola";
//   if (hola is String){
//     print("hola es una cadena");
//   }
//   //hola = 3;
//   //Como arreglarlo?

//   // Object es lo mismo, ya que todo es un objeto
//   dynamic holaDinamico = "hola";
//   if (holaDinamico is String){
//     print("holaDinamico es una cadena");
//   }

//   holaDinamico = 3;

//   if (holaDinamico is int){
//     print("ahora es un número!");
//   }

// }