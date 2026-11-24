import 'package:bloc_prd/product_event.dart';
import 'package:bloc_prd/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
  ProductBloc() : super(ProductState(products: [], cart: []));
}