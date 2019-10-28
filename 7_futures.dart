Future<void> getUserOrder() {
  // Imagine that this function is fetching user info from another service or database
  return Future.delayed(Duration(seconds: 3), () => print('Café grande'));
}


main(){
  getUserOrder();
  print('Tomando pedido del usario...');
}