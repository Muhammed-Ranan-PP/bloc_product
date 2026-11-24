class ProductEvent {}
class AddToCart extends ProductEvent{
  final String product;
  AddToCart(
    this.product
  );
}
class RemoveFromCart extends ProductEvent{
  final String product;
  RemoveFromCart(
    this.product
  );
}