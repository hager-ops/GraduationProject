// Define a list of products
import 'package:ecosofe_app/domain/product/product_model.dart';
import 'package:ecosofe_app/domain/product/profuct_type.dart';

List<Product> products = [
  Product(
    name: 'Cans',
    image: "images/common/can.png",
    priceForPiece: "1.5",
    category: ProductEnum.metal,
  ),
  Product(
    name: 'Used Oil',
    image: "images/common/used_oil.png",
    priceForPiece: "30",
    category: ProductEnum.usedOil,
  ),
  Product(
    name: 'Books',
    image: "images/common/books.png",
    priceForPiece: "10",
    category: ProductEnum.paper,
  ),
  Product(
    name: 'Bottles',
    image: "images/common/bottles.png",
    priceForPiece: "0.75",
    category: ProductEnum.plastic,
  ),
  Product(
    name: 'Food Can',
    image: "images/common/food_can.png",
    priceForPiece: "15",
    category: ProductEnum.metal,
  ),
  Product(
    name: 'Aluminum Serving',
    image: "images/common/aluminum_serving.jpg",
    priceForPiece: "1",
    category: ProductEnum.metal,
  ),
  Product(
    name: 'Big Bottles',
    image: "images/common/big_bottles.png",
    priceForPiece: "10",
    category: ProductEnum.plastic,
  ),
  Product(
    name: 'Cleaning Bottles',
    image: "images/common/cleaning_bottles.jpeg",
    priceForPiece: "1",
    category: ProductEnum.plastic,
  ),
  Product(
    name: 'Plastics',
    image: "images/common/plastics.png",
    priceForPiece: "8",
    category: ProductEnum.plastic,
  ),
  Product(
    name: 'Newspaper',
    image: "images/common/news_paper.png",
    priceForPiece: "12",
    category: ProductEnum.paper,
  ),
  Product(
    name: 'Magazines',
    image: "images/common/magazines.png",
    priceForPiece: "6",
    category: ProductEnum.paper,
  ),
  Product(
    name: 'Card Board',
    image: "images/common/card_board.png",
    priceForPiece: "5",
    category: ProductEnum.paper,
  ),
];
