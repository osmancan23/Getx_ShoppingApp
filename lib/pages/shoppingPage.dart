import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping_app/controllers/cart_controller.dart';
import 'package:getx_shopping_app/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  var shoppingController = Get.put(ShoppingController());
  var cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text("Shopping Page"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      var product = controller.products[index];
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${product.productName}',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text('${product.productDescription}'),
                                    ],
                                  ),
                                  Text('\$${product.price}',
                                      style: TextStyle(fontSize: 24)),
                                ],
                              ),
                              RaisedButton(
                                color: Colors.blue,
                                onPressed: () {
                                  cartController.addToCart(product);
                                },
                                child: Text("add to Cart"),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                "Total Price: " + controller.totalPrice.toString(),
                style: TextStyle(color: Colors.white, fontSize: 40),
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.amber,
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: TextStyle(color: Colors.black, fontSize: 24),
          );
        }),
      ),
    );
  }
}
