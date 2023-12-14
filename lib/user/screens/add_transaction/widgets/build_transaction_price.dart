part of 'add_transaction_widgets_imports.dart';

class BuildTransactionPrice extends StatelessWidget {
  const BuildTransactionPrice({Key? key, required this.data}) : super(key: key);
  final AddTransactionData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              border: Border.all(width: 1.w,color: MyColors.primary,),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: MyText(title: "ج.م", color: MyColors.black, size: 14.sp,fontWeight: FontWeight.bold,),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: GenericTextField(
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              controller: data.priceController,
              fieldTypes: FieldTypes.normal,
              type: TextInputType.number,
              action: TextInputAction.next,
              suffixIcon: Icon(Icons.calculate_outlined,size: 40.w,color: MyColors.primary,),
              validate: (value) {
                if (value!.isEmpty) {
                  return 'Enter the price';
                }
              },
              label: "المبلغ",
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ],
      ),
    );
  }
}
