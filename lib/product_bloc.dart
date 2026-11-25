import 'package:bloc_prd/product_event.dart';
import 'package:bloc_prd/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
  ProductBloc() : super(ProductState(products: ['Phone' , 'Laptop' , 'Mouse' , 'Keyboard'], cart: [])){
    on<AddToCart>((event , emit){
      final updatedCart = List<String>.from(state.cart);
      updatedCart.add(event.product);
      emit(ProductState(products: state.products, cart: updatedCart));
    });
    on<RemoveFromCart>((event, emit) {
      final updatedCart = List<String>.from(state.cart);
      updatedCart.remove(event.product);
      emit(ProductState(products: state.products, cart: updatedCart));
    },);
  }
}