part of 'add_cart_widgets_imports.dart';

class BuildChooseCartType extends StatelessWidget {
  const BuildChooseCartType({Key? key, required this.data,}) : super(key: key);
  final AddCartData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      height: 250.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<GenericBloc<List<RadioModel>>, GenericState<List<RadioModel>>>(
            bloc: data.radioCart,
            builder: (context, state) {
              return Column(
                children: List.generate(
                  state.data.length,
                      (index) {
                    return Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Radio<bool>(
                            value: state.data[index]
                                .active,
                            groupValue: true,
                            onChanged: (value) {
                              data.selectMethod(value!, index);
                            },
                          ),
                          MyText(
                            title:tr(context, state.data[index]
                                .title),
                            size: 14.sp,
                            color: MyColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DefaultButton(
                  onTap: () async{
                    if(data.selectedCartType!=null){
                      final box = await Hive.openBox<AddCartModel>("addCartBox");
                      print(data.selectedCartType?.id);
                      AddCartModel model = AddCartModel(
                        name: data.nameController.text,
                        image: data.imageBloc.state.data,
                        description: data.descriptionController.text,
                        type: data.typeController.text,
                        time: data.timeController.text,
                        date: data.dateController.text,
                        amount: double.parse(data.amountController.text),
                        address: data.addressController.text,
                        brand: data.brandController.text,
                        contentModel: data.selectedCartContent,
                        dateCreated: data.dateController.text,
                        estimatedValue: double.parse(data.estimatedValueController.text),
                        number: double.parse(data.numberController.text),
                        total: double.parse(data.totalController.text),
                        typeModel: data.selectedCart,
                        cartType: data.selectedCartType,
                        isCompleted: false,
                      );
                      box.add(model);
                      AutoRouter.of(context).push(HomeRoute(index: 0,pageIndex: 15));
                      print(box.values.length);
                    }else{
                      CustomToast.showSimpleToast(msg: "msg");
                    }
                  },
                  title: tr(context, "save"),
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: DefaultButton(
                  onTap: () {
                    AutoRouter.of(context).pop();
                  },
                  title: tr(context, "cancel"),
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: MyColors.white,
                  textColor: MyColors.primary,
                  borderColor: MyColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
