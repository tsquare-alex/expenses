part of 'add_transaction_widgets_imports.dart';

class BuildTransactionDate extends StatelessWidget {
  const BuildTransactionDate({Key? key, required this.data}) : super(key: key);
  final AddTransactionData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.r),
      decoration: BoxDecoration(
        color: MyColors.backgroundColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          //Icon(Icons.date_range,color: MyColors.primary,),
          Column(
            children: [
              Icon(Icons.date_range,color: MyColors.primary,),
              MyText(
                title: "تاريخ المعاملة",
                color: MyColors.black,
                size: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: GenericTextField(
              onTab: () => data.onSelectDate(
                context,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
              radius: 10.r,
              fieldTypes: FieldTypes.clickable,
              type: TextInputType.text,
              action: TextInputAction.next,
              label: tr(context, "date"),
              validate: (value) {},
              controller: data.dateController,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          SizedBox(
            width: 90.w,
            child: GenericTextField(
              onTab: () => data.onSelectTime(
                context,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              radius: 10.r,
              fieldTypes: FieldTypes.clickable,
              type: TextInputType.text,
              action: TextInputAction.next,
              label: tr(context, "time"),
              validate: (value) {},
              controller: data.timeController,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
