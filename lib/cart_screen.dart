import 'package:bloc_prd/product_bloc.dart';
import 'package:bloc_prd/product_event.dart';
import 'package:bloc_prd/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: BlocBuilder<ProductBloc , ProductState>(builder: (context,state){
      return Column(
        children: [
         Text("Cart"),

         Expanded(
          child:ListView.builder(
            itemCount: state.cart.length,
            itemBuilder: (context , index){
            final product = state.cart[index];
            return ListTile(
              title: Text(product),
              trailing: IconButton(onPressed: (){
                context.read<ProductBloc>().add(RemoveFromCart(product));
              }, icon: Icon(Icons.delete)),
            );
          }) )
        ],
      );
     }),
    );
  }
}