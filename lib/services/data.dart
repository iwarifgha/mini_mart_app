import 'package:mini_mart_app/common/models/product_model.dart';
import 'package:mini_mart_app/features/cart/models/cart_item_model.dart';

final List<String> productImages = [
  'assets/images/Image.png',
  'assets/images/Image (1).png',
  'assets/images/Image (2).png',
  'assets/images/Image (3).png',
  'assets/images/Image.png',
  'assets/images/Image.png',
  'assets/images/Image (1).png',
  'assets/images/Image (2).png',
  'assets/images/Image (3).png',
];

// List<CartItemModel> cartItems = [
//   CartItemModel(
//     productImageUrl: 'assets/images/Image.png',
//     name: 'Apple iPhone 16 128GB|Teal',
//     price: 29.99,
//     quantity: 1,
//     id: '1',
//     productId: '1',
//   ),
//   CartItemModel(
//     productImageUrl: 'assets/images/Image (1).png',
//     name: 'M4 Macbook Air 13 256GB|Sky blue 2',
//     price: 49.99,
//     quantity: 1,
//     id: '1',
//     productId: '2',
//   ),
//   CartItemModel(
//     productImageUrl: 'assets/images/Image.png',
//     name: 'Apple iPhone 16 128GB|Teal',
//     price: 29.99,
//     quantity: 1,
//     id: '1',
//     productId: '1',
//   ),
//   CartItemModel(
//     productImageUrl: 'assets/images/Image (1).png',
//     name: 'M4 Macbook Air 13 256GB|Sky blue 2',
//     price: 49.99,
//     quantity: 1,
//     id: '1',
//     productId: '2',
//   ),
//   CartItemModel(
//     productImageUrl: 'assets/images/Image.png',
//     name: 'Apple iPhone 16 128GB|Teal',
//     price: 29.99,
//     quantity: 1,
//     id: '1',
//     productId: '1',
//   ),
//   CartItemModel(
//     productImageUrl: 'assets/images/Image (1).png',
//     name: 'M4 Macbook Air 13 256GB|Sky blue 2',
//     price: 49.99,
//     quantity: 1,
//     id: '1',
//     productId: '2',
//   ),
//   CartItemModel(
//     productImageUrl: 'assets/images/Image.png',
//     name: 'Apple iPhone 16 128GB|Teal',
//     price: 29.99,
//     quantity: 1,
//     id: '1',
//     productId: '1',
//   ),
//   CartItemModel(
//     productImageUrl: 'assets/images/Image (1).png',
//     name: 'M4 Macbook Air 13 256GB|Sky blue 2',
//     price: 49.99,
//     quantity: 1,
//     id: '1',
//     productId: '2',
//   ),
// ];



final List<ProductModel> productList = [
  ProductModel(
    id: '1',
    name: 'Apple iPhone 16 128GB|Teal',
    bulletDescription: [
      'Description 1 There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmeti',
      'Feature 1 There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmeti',
    ],
    price: 29.99,
    imageUrl: 'assets/images/Image.png',
  ),
  ProductModel(
    id: '2',
    name: 'M4 Macbook Air 13 256GB|Sky blue 2',
    bulletDescription: [
      'This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.                     ',
      'This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.                     ',
    ],
    price: 49.99,
    imageUrl: 'assets/images/Image (1).png',
  ),
  ProductModel(
    id: '3',
    name: 'Google Pixel 9A 128GB|Iris',
    bulletDescription: [
      'Description 3   There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmeti                        ',
      'Feature 3   There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmeti                  ',
    ],
    price: 19.99,
    imageUrl: 'assets/images/Image (2).png',
  ),
  ProductModel(
    id: '4',
    name: 'Apple Airpods 4 Active Noise Cancellation|Teal 4',
    bulletDescription: [
      'Description 4 There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmeti',
      'Feature 4  There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmeti',
    ],
    price: 39.99,
    imageUrl: 'assets/images/Image (3).png',
  ),
  ProductModel(
    id: '1',
    name: 'Apple iPhone 16 128GB|Teal',
    bulletDescription: [
      'Description 1There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmeti',
      'Feature 1 There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmeti',
    ],
    price: 29.99,
    imageUrl: 'assets/images/Image.png',
  ),
  ProductModel(
    id: '2',
    name: 'M4 Macbook Air 13 256GB|Sky blue 2',
    bulletDescription: ['Description 2', 'Feature 2'],
    price: 49.99,
    imageUrl: 'assets/images/Image (1).png',
  ),
  ProductModel(
    id: '3',
    name: 'Google Pixel 9A 128GB|Iris',
    bulletDescription: ['Description 3', 'Feature 3'],
    price: 19.99,
    imageUrl: 'assets/images/Image (2).png',
  ),
  ProductModel(
    id: '4',
    name: 'Apple Airpods 4 Active Noise Cancellation|Teal 4',
    bulletDescription: ['Description 4', 'Feature 4'],
    price: 39.99,
    imageUrl: 'assets/images/Image (3).png',
  ),

  // Add more products as needed
];
