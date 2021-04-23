import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';
import '../utils/lang/locale_keys.g.dart';
import '../viewmodel/category_view_model.dart';
import '../viewmodel/product_view_model.dart';

class HomePage extends StatelessWidget {
  ProductViewModel _productVM;
  CategoryViewModel _categoryVM;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: _buildLinearGradientColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                _buildAppBar(context),
                Consumer<CategoryViewModel>(
                  builder: (context, viewModel, child) {
                    _categoryVM = viewModel;
                    return SizedBox(
                      height: 50,
                      child: _buildCategoryList(),
                    );
                  },
                ),
                Consumer<ProductViewModel>(
                  builder: (_, viewModel, __) {
                    _productVM = viewModel;
                    return Expanded(
                      child: _buildItemGridView(viewModel),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );

  BoxDecoration get _buildLinearGradientColor => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Colors.grey[400],
          ],
        ),
      );

  AppBar _buildAppBar(BuildContext context) => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: _appbarText(context),
      );

  Text _appbarText(BuildContext context) => Text(
        LocaleKeys.home_title.tr(),
        style:
            Theme.of(context).textTheme.headline4.copyWith(color: Colors.black),
      );

  ListView _buildCategoryList() => ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categoryVM.categories.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: _buildCategoryField(
              _categoryVM.categories[index].name, index, context),
        ),
      );

  ActionChip _buildCategoryField(
          String categoryName, int index, BuildContext context) =>
      ActionChip(
        label: _categoryName(categoryName, context),
        onPressed: () {
          _onTapForGetByCategory(context, index);
        },
        backgroundColor: Colors.white,
      );
  Text _categoryName(String categoryName, BuildContext context) => Text(
        categoryName,
        style: Theme.of(context).textTheme.bodyText1,
      );

  void _onTapForGetByCategory(BuildContext context, int index) {
    final _viewModel = Provider.of<ProductViewModel>(context, listen: false);
    _viewModel.products.clear();
    _viewModel.getProductsByCategoryId(index + 1);
  }

  GridView _buildItemGridView(ProductViewModel viewModel) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.5,
          crossAxisCount: 2,
        ),
        itemCount: viewModel.products.length,
        itemBuilder: (context, index) {
          final Products product = viewModel.products[index];
          return SizedBox(
            height: 400,
            child: buildItemCard(product, context),
          );
        },
      );

  Card buildItemCard(Products product, BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: _buildImageField(product),
              ),
              const SizedBox(height: 5),
              _buildProductName(product.name, context),
              const SizedBox(height: 5),
              _buildProductPrice(product.unitPrice, context),
              _buildVoteField(product.voteAverage, context),
              ElevatedButton(
                onPressed: () {
                  _onTapForAddCart(product);
                },
                style: _buttonStyle(product),
                child: _buildTextAddCart(product, context),
              )
            ],
          ),
        ),
      );

  Stack _buildImageField(Products product) => Stack(
        children: [
          Image.network(product.imageUrl),
          _buildFavIconPosition(product),
        ],
      );

  Positioned _buildFavIconPosition(Products product) => Positioned(
        right: 0,
        top: 30,
        child: _buildIconButtonForFavorite(product),
      );

  IconButton _buildIconButtonForFavorite(Products product) => IconButton(
        onPressed: () {
          _onTapForAddRemoveFromFavorite(product);
        },
        icon: _buildIconForFavControl(product),
      );

  void _onTapForAddRemoveFromFavorite(Products product) {
    _productVM.favoritedProduct.contains(product)
        ? _productVM.removeFromFavorite(product)
        : _productVM.addToFavorite(product);
  }

  Icon _buildIconForFavControl(Products product) => Icon(
        _productVM.favoritedProduct.contains(product)
            ? Icons.favorite
            : Icons.favorite_border,
        color: Colors.red,
      );

  Text _buildProductName(String productName, BuildContext context) => Text(
        productName,
        style: Theme.of(context).textTheme.headline6,
      );

  Text _buildProductPrice(int unitPrice, BuildContext context) => Text(
        '$unitPrice \$',
        style: Theme.of(context).textTheme.subtitle2,
      );

  Row _buildVoteField(voteAverage, BuildContext context) => Row(
        children: [
          const Icon(Icons.star_border),
          Text(
            '$voteAverage',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      );

  void _onTapForAddCart(Products product) {
    _productVM.addedProductToCart.contains(product)
        ? _productVM.removeFromCart(product)
        : _productVM.addToCart(product);
  }

  ButtonStyle _buttonStyle(Products product) => ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            _productVM.addedProductToCart.contains(product)
                ? Colors.green
                : Colors.blue),
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 30),
        ),
      );

  Text _buildTextAddCart(Products product, BuildContext context) => Text(
        _productVM.addedProductToCart.contains(product)
            ? LocaleKeys.home_addedCart.tr()
            : LocaleKeys.home_addCart.tr(),
        style: Theme.of(context).textTheme.bodyText1,
      );
}
