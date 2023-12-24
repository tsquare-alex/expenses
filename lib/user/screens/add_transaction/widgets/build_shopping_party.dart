part of 'add_transaction_widgets_imports.dart';

class BuildShoppingParty extends StatelessWidget {
  const BuildShoppingParty({Key? key, required this.addTransactionData}) : super(key: key);
  final AddTransactionData addTransactionData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: "تحديد جهة التسوق و الشراء",
            color: MyColors.black,
            size: 12.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            width: 10.h,
          ),
          DropdownTextField<DropdownModel>(
            dropKey: addTransactionData.shoppingPartyDropKey,
            label: "جهة التسوق و الشراء",
            selectedItem: addTransactionData.selectedShoppingParty,
            margin: const EdgeInsets.symmetric(vertical: 5),
            validate: (value) {
              if (value == null) {
                print("Please fill this field");
              }
            },
            onChange: addTransactionData.setSelectShoppingParty,
            finData: (data) => addTransactionData.getShoppingParty(
              context,
            ),
            useName: true,
            buttonsColor: MyColors.primary,
            searchHint: tr(context, "search"),
          )
        ],
      ),
    );
  }
}
