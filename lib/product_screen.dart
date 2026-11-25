import 'package:bloc_prd/product_bloc.dart';
import 'package:bloc_prd/product_event.dart';
import 'package:bloc_prd/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_prd/cart_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping page"),
        actions: [
          IconButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
          }, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: BlocBuilder<ProductBloc,ProductState>(
        builder: ((context, state) {
          return Column(
            children: [
              Text("Cart Items ${state.cart.length}"),

              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];

                    return ListTile(
                      title: Text(product),
                      trailing: ElevatedButton(
                        onPressed: () {
                          context.read<ProductBloc>().add(AddToCart(product));
                        },
                        child: Text("Add"),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
