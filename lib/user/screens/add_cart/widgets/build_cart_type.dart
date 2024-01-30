part of 'add_cart_widgets_imports.dart';

class BuildCartType extends StatelessWidget {
  const BuildCartType({Key? key, required this.addCartData}) : super(key: key);
  final AddCartData addCartData;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: addCartData.formKey,
      child: Column(
        children: [
          BlocBuilder<GenericBloc<List<CartTypeModel>>,
              GenericState<List<CartTypeModel>>>(
            bloc: addCartData.cartTypeCubit,
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        title: tr(context, "addItem"),
                        color: context.watch<AppThemeCubit>().isDarkMode
                            ? MyColors.white
                            : MyColors.black,
                        size: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      IconButton(
                          onPressed: () {
                            addCartData.addCartModel(context);
                          },
                          icon: Icon(Icons.add))
                    ],
                  ),
                  DropdownTextField<CartTypeModel>(
                    dropKey: addCartData.cartDropKey,
                    label: tr(context, "shoppingItems"),
                    selectedItem: addCartData.selectedCart,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) {
                      if (value == null) {
                        print("Please fill this field");
                      }
                    },
                    hintColor: context.watch<AppThemeCubit>().isDarkMode
                        ? MyColors.white
                        : MyColors.black,
                    onChange: addCartData.setSelectCart,
                    finData: (data) =>
                        addCartData.getCartTypes(context, state.data),
                    useName: true,
                    hasLocalization: true,
                    buttonsColor: MyColors.primary,
                    searchHint: tr(context, "search"),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        title: tr(context, "chooseSubItem"),
                        color: context.watch<AppThemeCubit>().isDarkMode
                            ? MyColors.white
                            : MyColors.black,
                        size: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      IconButton(
                          onPressed: () {
                            addCartData.addTransactionContentModel(context,
                                addCartData.selectedCart ?? CartTypeModel());
                          },
                          icon: Icon(Icons.add))
                    ],
                  ),
                  DropdownTextField<CartContentModel>(
                    dropKey: addCartData.cartContentDropKey,
                    label: tr(context, "addItem"),
                    hintColor: context.watch<AppThemeCubit>().isDarkMode
                        ? MyColors.white
                        : MyColors.black,
                    selectedItem: addCartData.selectedCartContent,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) {
                      if (value == null) {
                        print("Please fill this field");
                      }
                    },
                    onChange: addCartData.setSelectCartContent,
                    finData: (data) => addCartData.getCartTypeContent(
                      context,
                    ),
                    useName: true,
                    hasLocalization: true,
                    buttonsColor: MyColors.primary,
                    searchHint: tr(context, "search"),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
