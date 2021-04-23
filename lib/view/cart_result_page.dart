import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';
import '../utils/lang/locale_keys.g.dart';
import '../viewmodel/product_view_model.dart';

class CartResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Consumer<ProductViewModel>(
          builder: (context, viewModel, child) => Column(
            children: [
              Expanded(
                flex: 1,
                child: buildListViewCartPage(viewModel),
              ),
              const Divider(color: Colors.grey),
              buildCartResult(viewModel),
              buildSubmitCart(),
            ],
          ),
        ),
      );

  ListView buildListViewCartPage(ProductViewModel viewModel) =>
      ListView.builder(
        itemCount: viewModel.addedProductToCart.length,
        itemBuilder: (context, index) {
          final Products _product = viewModel.addedProductToCart[index];

          if (viewModel.addedProductToCart.isEmpty) {
            return const Center(child: Icon(Icons.error));
          }
          return buildCartItemListTile(_product, viewModel);
        },
      );

  ListTile buildCartItemListTile(
          Products _product, ProductViewModel viewModel) =>
      ListTile(
        leading: Image.network(_product.imageUrl),
        title: Text(_product.name),
        subtitle: Text('${_product.unitPrice} \$'),
        trailing: buildIconButtonForCart(viewModel, _product),
      );

  IconButton buildIconButtonForCart(
          ProductViewModel viewModel, Products _product) =>
      IconButton(
        onPressed: () {
          viewModel.addedProductToCart.contains(_product)
              ? viewModel.removeFromCart(_product)
              : viewModel.addToCart(_product);
        },
        icon: buildIconForCartControl(viewModel, _product),
      );

  Icon buildIconForCartControl(ProductViewModel viewModel, Products _product) =>
      Icon(
        viewModel.addedProductToCart.contains(_product)
            ? Icons.shopping_cart
            : Icons.remove_shopping_cart,
        color: Colors.green,
      );

  ElevatedButton buildSubmitCart() => ElevatedButton(
      onPressed: () {
        debugPrint('Tebrikler Başarıyla Satın Alındı');
      },
      child: Text(LocaleKeys.cart_submit.tr()));

  ListTile buildCartResult(ProductViewModel viewModel) => ListTile(
        leading: Text(LocaleKeys.cart_totalResult.tr()),
        trailing: Text('${viewModel.cartSum}\$'),
      );
}
