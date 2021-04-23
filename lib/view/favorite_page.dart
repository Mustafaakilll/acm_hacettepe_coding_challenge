import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';
import '../utils/lang/locale_keys.g.dart';
import '../viewmodel/product_view_model.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Consumer<ProductViewModel>(
            builder: (context, viewModel, child) =>
                buildFavoriteListBuilder(viewModel),
          ),
        ),
      );

  ListView buildFavoriteListBuilder(ProductViewModel viewModel) =>
      ListView.builder(
        itemCount: viewModel.favoritedProduct.length,
        itemBuilder: (context, index) {
          final Products _product = viewModel.favoritedProduct[index];
          if (viewModel.favoritedProduct.isEmpty) {
            return Center(child: Text(LocaleKeys.favorite_emptyList.tr()));
          }

          return buildFavoriteListTile(_product, viewModel);
        },
      );

  ListTile buildFavoriteListTile(
          Products _product, ProductViewModel viewModel) =>
      ListTile(
        leading: Image.network(_product.imageUrl),
        title: Text(_product.name),
        subtitle: Text('${_product.unitPrice} \$'),
        trailing: buildIconButtonForFavorite(viewModel, _product),
      );

  IconButton buildIconButtonForFavorite(
          ProductViewModel viewModel, Products _product) =>
      IconButton(
        onPressed: () {
          viewModel.favoritedProduct.contains(_product)
              ? viewModel.removeFromFavorite(_product)
              : viewModel.addToFavorite(_product);
        },
        icon: buildIconForFavControl(viewModel, _product),
      );

  Icon buildIconForFavControl(ProductViewModel viewModel, Products _product) =>
      Icon(
        viewModel.favoritedProduct.contains(_product)
            ? Icons.favorite
            : Icons.favorite_border,
        color: Colors.red,
      );
}
