part of 'cart_imports.dart';

class CartData{

  List<CartContentModel> cartList = [
    CartContentModel(
      name: "readyModels",
      image: Res.readyModels,
    ),
    CartContentModel(
      name: "previouslyUsed",
      image: Res.previouslyUsed,
    ),
  ];

  CartModel cartModel = CartModel(
    name: "cart",
    image: Res.bag,
    content: [
      CartTypeModel(
        name: "supermarket",
        image: Res.superMarket,
        content: [
          CartContentModel(
              name: "dairy",
              image: Res.dairy
          ),
          CartContentModel(
              name: "cheese",
              image: Res.cheese
          ),
          CartContentModel(
              name: "bakedGoods",
              image: Res.bakedGoods
          ),
          CartContentModel(
              name: "meat",
              image: Res.meat
          ),
          CartContentModel(
              name: "birds",
              image: Res.birds
          ),
          CartContentModel(
              name: "fish",
              image: Res.fish
          ),
          CartContentModel(
              name: "herbs",
              image: Res.herbs
          ),
          CartContentModel(
              name: "vegetable",
              image: Res.vegetable
          ),
          CartContentModel(
              name: "fruits",
              image: Res.fruits
          ),
          CartContentModel(
              name: "libraryTools",
              image: Res.libraryTools
          ),
          CartContentModel(
              name: "legumes",
              image: Res.legumes
          ),
          CartContentModel(
              name: "oil",
              image: Res.oil
          ),
          CartContentModel(
              name: "salt",
              image: Res.salt
          ),
          CartContentModel(
              name: "sugar",
              image: Res.sugar
          ),
          CartContentModel(
              name: "vinegar",
              image: Res.vinegar
          ),
          CartContentModel(
              name: "chocolate",
              image: Res.chocolate
          ),
          CartContentModel(
              name: "candies",
              image: Res.candies
          ),

        ],
      ),
      CartTypeModel(
        name: "furniture",
        image: Res.furniture,
        content: [
          CartContentModel(
              name: "clothes",
              image: Res.clothes
          ),
          CartContentModel(
              name: "shoes",
              image: Res.shoes
          ),
          CartContentModel(
              name: "furniture1",
              image: Res.furniture1
          ),
          CartContentModel(
              name: "electricalDevices",
              image: Res.electricalDevices
          ),
          CartContentModel(
              name: "kitchenUtensils",
              image: Res.kitchenUtensils
          ),
          CartContentModel(
              name: "LightingTools",
              image: Res.LightingTools
          ),
          CartContentModel(
              name: "antiques",
              image: Res.antiques
          ),
        ],
      ),
      CartTypeModel(
        name: "places",
        image: Res.places,
        content: [
          CartContentModel(
              name: "restaurant",
              image: Res.restaurant
          ),
          CartContentModel(
              name: "cafe",
              image: Res.cafe
          ),
          CartContentModel(
              name: "mall",
              image: Res.mall
          ),
          CartContentModel(
              name: "shop",
              image: Res.shop
          ),
          CartContentModel(
              name: "factory",
              image: Res.shop
          ),
          CartContentModel(
              name: "workshop",
              image: Res.workshop
          ),
          CartContentModel(
              name: "hospital",
              image: Res.hospital1
          ),
          CartContentModel(
              name: "clinic",
              image: Res.clinic
          ),
          CartContentModel(
              name: "exhibition",
              image: Res.exhibition
          ),
        ],
      ),
      CartTypeModel(
        name: "online",
        image: Res.internet,
        content: [
          CartContentModel(
              name: "website",
              image: Res.website
          ),
          CartContentModel(
              name: "facebook1",
              image: Res.facebook1
          ),
          CartContentModel(
              name: "instagram1",
              image: Res.instagram1
          ),
          CartContentModel(
              name: "tikTok",
              image: Res.tikTok
          ),
          CartContentModel(
              name: "group",
              image: Res.group
          ),
          CartContentModel(
              name: "advertisements",
              image: Res.advertisements
          ),
        ],
      ),
    ]
  );

}