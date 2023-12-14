part of 'add_transaction_widgets_imports.dart';

class BuildTransactionDescription extends StatelessWidget {
  const BuildTransactionDescription({Key? key, required this.data}) : super(key: key);
  final AddTransactionData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0.r),
      child: GenericTextField(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        controller: data.descriptionController,
        fieldTypes: FieldTypes.normal,
        type: TextInputType.text,
        action: TextInputAction.next,
        prefixIcon: Icon(Icons.description_outlined,size: 40.w,color: MyColors.primary,),
        validate: (value) {
          if (value!.isEmpty) {
            return 'Enter the price';
          }
        },

        label: "الملاحظات",
        margin: const EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}
