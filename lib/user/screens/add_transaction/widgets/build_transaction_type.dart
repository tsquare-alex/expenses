part of 'add_transaction_widgets_imports.dart';

class BuildTransactionType extends StatelessWidget {
  const BuildTransactionType({
    Key? key,
    required this.addTransactionData,
    required this.type,
    required this.model,
  }) : super(key: key);
  final AddTransactionData addTransactionData;
  final String type;
  final TransactionTypeModel model;

  @override
  Widget build(BuildContext context) {
    print(type);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1.w, color: MyColors.greyWhite),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              childrenPadding: EdgeInsets.all(10.r),
              title: MyText(
                title: tr(context, "transaction"),
                color: MyColors.black,
                size: 13.sp,
                fontWeight: FontWeight.bold,
              ),
              children: [
                BlocBuilder<GenericBloc<List<TransactionContentModel>?>,
                    GenericState<List<TransactionContentModel>?>>(
                  bloc: addTransactionData.typeContentCubit,
                  builder: (context, state) {
                    return Column(
                      children: List.generate(
                        state.data!.length,
                        (index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      state.data?[index].image ??
                                          Res.commitments,
                                      width: 25.w,
                                      height: 25.h,
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    MyText(
                                      title: tr(context, state.data?[index].name ?? ""),
                                      color: MyColors.black,
                                      size: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Radio(
                                value:
                                model.content?[index].selected ?? false,
                                groupValue: true,
                                onChanged: (v) {
                                  addTransactionData.selectContent(
                                      v!, model, index);
                                }),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () => addTransactionData.addTransactionContentModel(
                      context, "الالتزامات", model),
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        title: tr(context, "addNewContent"),
                        color: MyColors.black,
                        size: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      Icon(
                        Icons.add,
                        color: MyColors.primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
