part of 'transactions_imports.dart';

class TransactionsData{

  GenericBloc<List<AddTransactionModel>> addTransactionCubit = GenericBloc([]);

  List<AddTransactionModel> addTransactionList = [];


  Future<void> fetchData() async {
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    try {
      var list = box.values.map((dynamic value) {
        if (value is AddTransactionModel) {
          return value;
        } else {
          return AddTransactionModel(); // Replace with your default value or handle it accordingly
        }
      }).toList();
      for (AddTransactionModel item in list) {
          addTransactionList.add(item);
      }
      addTransactionCubit.onUpdateData(addTransactionList);
    } catch (e) {
      print('Error fetching data from Hive: $e');
    } finally {
      await box.close();
    }
  }

  Future<void> deleteItem(AddTransactionModel targetModel) async {
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    // Find the index of the target model in the list
    var modelList =box.values.toList();
    int index = modelList.indexWhere((model) => model.key == targetModel.key);
    var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
    var walletList = walletBox.values.toList();
    WalletModel? targetWallet = walletList.firstWhere(
          (item) => item.name == targetModel.incomeSource?.name,
    );
    double total = double.parse(targetModel.total!);
    targetWallet.balance = targetWallet.balance + total;
    print("balance ${targetWallet.balance}");
    await walletBox.put(targetWallet.key, targetWallet);
    box.deleteAt(index);
    var boxList = box.values.toList();
    List<AddTransactionModel> newList = boxList;
    addTransactionCubit.onUpdateData(newList);
    if (index != -1) {
      print('Index of the target model: $index');
    } else {
      print('Target model not found in the list.');
    }
  }
  List<TransactionModel> transactions = [
    TransactionModel(
        name: "الالتزامات",
        isSelected: true,
        image: Res.commitment,
        content: [
          TransactionTypeModel(
            name: "bills",
            image: Res.bills,
            content: [
              TransactionContentModel(
                name: "electric",
                image: Res.electric,
              ),
              TransactionContentModel(
                name: "water",
                image: Res.water,
              ),
              TransactionContentModel(
                name: "mobile",
                image: Res.mobile,
              ),
              TransactionContentModel(
                name: "telephone",
                image: Res.telephon,
              ),
              TransactionContentModel(
                name: "internet",
                image: Res.internet,
              ),
            ],
          ),
          TransactionTypeModel(
            name: "car",
            image: Res.car,
            content: [
              TransactionContentModel(
                name: "fuel",
                image: Res.fuel,
              ),
              TransactionContentModel(
                name: "garage",
                image: Res.garage,
              ),
              TransactionContentModel(
                name: "maintenance",
                image: Res.maintenance,
              ),
              TransactionContentModel(
                name: "carWash",
                image: Res.carWash,
              ),
              TransactionContentModel(
                name: "driver",
                image: Res.driver,
              ),
              TransactionContentModel(
                name: "carFare",
                image: Res.carFare,
              ),
            ],
          ),
          TransactionTypeModel(
            name: "family",
            image: Res.family,
            content: [
              TransactionContentModel(
                name: "rent",
                image: Res.rent,
              ),
              TransactionContentModel(
                name: "installments",
                image: Res.installments,
              ),
              TransactionContentModel(
                name: "insurances",
                image: Res.insurances,
              ),
              TransactionContentModel(
                name: "repair",
                image: Res.repair,
              ),
              TransactionContentModel(
                name: "services",
                image: Res.services,
              ),
            ],
          ),
          TransactionTypeModel(
            name: "donations",
            image: Res.services,
            content: [
              TransactionContentModel(
                name: "donation",
                image: Res.services,
              ),
              TransactionContentModel(
                name: "subsidies",
                image: Res.subsidies,
              ),
              TransactionContentModel(
                name: "tip",
                image: Res.insurances,
              ),
              TransactionContentModel(
                name: "charity",
                image: Res.installments,
              ),
              TransactionContentModel(
                name: "alms",
                image: Res.alms,
              ),
              TransactionContentModel(
                name: "gifts",
                image: Res.gift,
              ),
            ],
          ),
          TransactionTypeModel(
            name: "subscriptions",
            image: Res.subscriptions,
            content: [
              TransactionContentModel(
                name: "gym",
                image: Res.gym,
              ),
              TransactionContentModel(
                name: "healthClub",
                image: Res.hospital
              ),
              TransactionContentModel(
                name: "sportsClub",
                image: Res.sportsClub,
              ),
              TransactionContentModel(
                name: "stadium",
                image: Res.stadium,
              ),
              TransactionContentModel(
                name: "television",
                image: Res.monitor,
              ),
              TransactionContentModel(
                name: "satelliteDish",
                image: Res.dish,
              ),
            ],
          ),
          TransactionTypeModel(
            name: "education",
            image: Res.education,
            content: [
              TransactionContentModel(
                name: "trainingCourses",
                image: Res.trainingCourses,
              ),
              TransactionContentModel(
                name: "schoolExpenses",
                image: Res.subsidies,
              ),
              TransactionContentModel(
                name: "expenses",
                image: Res.carFare,
              ),
              TransactionContentModel(
                name: "specialLesson",
                image: Res.training,
              ),
              TransactionContentModel(
                name: "schoolBooks",
                image: Res.courseAssign,
              ),
              TransactionContentModel(
                name: "schoolTools",
                image: Res.schoolTools,
              ),
            ],
          ),
          TransactionTypeModel(
            name: "entertainmentTrips",
            image: Res.entertainment,
            content: [
              TransactionContentModel(
                name: "entertainment",
                image: Res.entertainment,
              ),
              TransactionContentModel(
                name: "visit",
                image: Res.visit,
              ),
              TransactionContentModel(
                name: "cinema",
                image: Res.cinema,
              ),
              TransactionContentModel(
                name: "games",
                image: Res.games,
              ),
              TransactionContentModel(
                name: "adventures",
                image: Res.adventures,
              ),
            ],
          ),
          TransactionTypeModel(
            name: "care",
            image: Res.health,
            content: [
              TransactionContentModel(
                name: "pharmaceutical",
                image: Res.health,
              ),
              TransactionContentModel(
                name: "doctors",
                image: Res.doctor,
              ),
              TransactionContentModel(
                name: "hospitals",
                image: Res.hospital,
              ),
              TransactionContentModel(
                name: "teeth",
                image: Res.teeth,
              ),
              TransactionContentModel(
                name: "analysisLaboratories",
                image: Res.labs,
              ),
              TransactionContentModel(
                name: "personalCare",
                image: Res.personalCare,
              ),
            ],
          ),
        ]
    ),
    TransactionModel(
      name: "التسوق والشراء",
      image: Res.shopping,
      content: [
        TransactionTypeModel(
          name: "supermarket",
          image: Res.superMarket,
          content: [
            TransactionContentModel(
              name: "dairy",
              image: Res.dairy
            ),
            TransactionContentModel(
                name: "cheese",
                image: Res.cheese
            ),
            TransactionContentModel(
                name: "bakedGoods",
                image: Res.bakedGoods
            ),
            TransactionContentModel(
                name: "meat",
                image: Res.meat
            ),
            TransactionContentModel(
                name: "birds",
                image: Res.birds
            ),
            TransactionContentModel(
                name: "fish",
                image: Res.fish
            ),
            TransactionContentModel(
                name: "herbs",
                image: Res.herbs
            ),
            TransactionContentModel(
                name: "vegetable",
                image: Res.vegetable
            ),
            TransactionContentModel(
                name: "fruits",
                image: Res.fruits
            ),
            TransactionContentModel(
                name: "libraryTools",
                image: Res.libraryTools
            ),
            TransactionContentModel(
                name: "legumes",
                image: Res.legumes
            ),
            TransactionContentModel(
                name: "oil",
                image: Res.oil
            ),
            TransactionContentModel(
                name: "salt",
                image: Res.salt
            ),
            TransactionContentModel(
                name: "sugar",
                image: Res.sugar
            ),
            TransactionContentModel(
                name: "vinegar",
                image: Res.vinegar
            ),
            TransactionContentModel(
                name: "chocolate",
                image: Res.chocolate
            ),
            TransactionContentModel(
                name: "candies",
                image: Res.candies
            ),

          ],
        ),
        TransactionTypeModel(
          name: "furniture",
          image: Res.furniture,
          content: [
            TransactionContentModel(
                name: "clothes",
                image: Res.clothes
            ),
            TransactionContentModel(
                name: "shoes",
                image: Res.shoes
            ),
            TransactionContentModel(
                name: "furniture1",
                image: Res.furniture1
            ),
            TransactionContentModel(
                name: "electricalDevices",
                image: Res.electricalDevices
            ),
            TransactionContentModel(
                name: "kitchenUtensils",
                image: Res.kitchenUtensils
            ),
            TransactionContentModel(
                name: "LightingTools",
                image: Res.LightingTools
            ),
            TransactionContentModel(
                name: "antiques",
                image: Res.antiques
            ),
          ],
        ),
        TransactionTypeModel(
          name: "places",
          image: Res.places,
          content: [
            TransactionContentModel(
                name: "restaurant",
                image: Res.restaurant
            ),
            TransactionContentModel(
                name: "cafe",
                image: Res.cafe
            ),
            TransactionContentModel(
                name: "mall",
                image: Res.mall
            ),
            TransactionContentModel(
                name: "shop",
                image: Res.shop
            ),
            TransactionContentModel(
                name: "factory",
                image: Res.shop
            ),
            TransactionContentModel(
                name: "workshop",
                image: Res.workshop
            ),
            TransactionContentModel(
                name: "hospital",
                image: Res.hospital1
            ),
            TransactionContentModel(
                name: "clinic",
                image: Res.clinic
            ),
            TransactionContentModel(
                name: "exhibition",
                image: Res.exhibition
            ),
          ],
        ),
        TransactionTypeModel(
          name: "online",
          image: Res.internet,
          content: [
            TransactionContentModel(
                name: "website",
                image: Res.website
            ),
            TransactionContentModel(
                name: "facebook1",
                image: Res.facebook1
            ),
            TransactionContentModel(
                name: "instagram1",
                image: Res.instagram1
            ),
            TransactionContentModel(
                name: "tikTok",
                image: Res.tikTok
            ),
            TransactionContentModel(
                name: "group",
                image: Res.group
            ),
            TransactionContentModel(
                name: "advertisements",
                image: Res.advertisements
            ),
          ],
        ),
      ],
    ),
    TransactionModel(
      name: "الاهداف المالية المستهدفة",
      image: Res.target,
      content: [
        TransactionTypeModel(
          name: "investment",
          image: Res.investment,
          content: [

          ],
        ),
        TransactionTypeModel(
          name: "saving",
          image: Res.saving,
          content: [

          ],
        ),
        TransactionTypeModel(
          name: "finishing",
          image: Res.finishing,
          content: [

          ],
        ),
        TransactionTypeModel(
          name: "buyingCar",
          image: Res.buyingCar,
          content: [

          ],
        ),
        TransactionTypeModel(
          name: "tuitionFees",
          image: Res.tuitionFees,
          content: [

          ],
        ),
      ],
    ),
    TransactionModel(
      name: "المعاملات النقدية",
      image: Res.cash,
      content: [
        TransactionTypeModel(
          name: "withdraw",
          image: Res.withdraw,
          content: [

          ],
        ),
        TransactionTypeModel(
          name: "transfer",
          image: Res.transfer,
          content: [

          ],
        ),
      ],
    ),
  ];


}