part of 'add_transaction_widgets_imports.dart';

class BuildTransactionInputs extends StatelessWidget {
  const BuildTransactionInputs({Key? key, required this.addTransactionData, required this.type})
      : super(key: key);
  final AddTransactionData addTransactionData;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0.r),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                    ? AppDarkColors.primary
                    : MyColors.primary,
                radius: 20.r,
                child: Image.asset(
                  Res.wallet,
                  width: 20.w,
                  height: 20.w,
                  color: MyColors.white,
                ),
              ),
              SizedBox(
                width: 10.h,
              ),
              Expanded(
                child: DropdownTextField<DropdownModel>(
                  dropKey: addTransactionData.walletDropKey,
                  label: "تحديد مصدر الدخل",
                  selectedItem: addTransactionData.selectedWallet,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  validate: (value) {
                    if (value == null) {
                      print("Please fill this field");
                    }
                  },
                  onChange: addTransactionData.setSelectWallet,
                  finData: (data) => addTransactionData.getWallet(
                    context,
                  ),
                  useName: true,
                  buttonsColor: MyColors.yellow,
                  searchHint: "بحث",
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              MyText(
                title: "تحديد الوحدة",
                color: MyColors.black,
                size: 12.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                width: 10.h,
              ),
              Expanded(
                child: DropdownTextField<DropdownModel>(
                  dropKey: addTransactionData.unitsDropKey,
                  label: "الوحدة",
                  selectedItem: addTransactionData.selectedUnit,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  validate: (value) {
                    if (value == null) {
                      print("Please fill this field");
                    }
                  },
                  onChange: addTransactionData.setSelectUnit,
                  finData: (data) => addTransactionData.getUnits(
                    context,
                  ),
                  useName: true,
                  buttonsColor: MyColors.yellow,
                  searchHint: "بحث",
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(
                title: "حدد الكمية",
                color: MyColors.black,
                size: 12.sp,
                fontWeight: FontWeight.bold,
                alien: TextAlign.center,
              ),
              SizedBox(
                width: 105.w,
              ),
              Expanded(
                child: GenericTextField(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  controller: addTransactionData.amountController,
                  fieldTypes: FieldTypes.normal,
                  type: TextInputType.number,
                  action: TextInputAction.next,
                  validate: (value) {
                    if(value!.isEmpty){
                      return 'Enter the amount';
                    }
                  },
                  label: "الكمية",
                  margin: const EdgeInsets.only(top: 0),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(
                title: "اجمالي المبلغ المدفوع",
                color: MyColors.black,
                size: 12.sp,
                fontWeight: FontWeight.bold,
                alien: TextAlign.center,
              ),
              SizedBox(
                width: 34.w,
              ),
              Expanded(
                child: GenericTextField(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  controller: addTransactionData.totalController,
                  fieldTypes: FieldTypes.normal,
                  type: TextInputType.number,
                  action: TextInputAction.next,
                  validate: (value) {
                    if(value!.isEmpty){
                      return 'Enter total price';
                    }
                  },
                  label: "الاجمالي",
                  margin: const EdgeInsets.only(top: 0),
                ),
              ),
            ],
          ),
          if(type=="التسوق والشراء")SizedBox(height: 10.h,),
          if(type=="التسوق والشراء")Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(
                title: "اسم البراند",
                color: MyColors.black,
                size: 12.sp,
                fontWeight: FontWeight.bold,
                alien: TextAlign.center,
              ),
              SizedBox(
                width: 34.w,
              ),
              Expanded(
                child: GenericTextField(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  controller: addTransactionData.brandController,
                  fieldTypes: FieldTypes.normal,
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  validate: (value) {
                    if(value!.isEmpty){
                      return 'Enter brand name';
                    }
                  },
                  label: "اسم البراند",
                  margin: const EdgeInsets.only(top: 0),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          if(type=="الالتزامات")Row(
            children: [
              MyText(
                title: "تحديد جهة الالتزام",
                color: MyColors.black,
                size: 12.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                width: 10.h,
              ),
              Expanded(
                child: DropdownTextField<DropdownModel>(
                  dropKey: addTransactionData.commitmentPartyDropKey,
                  label: "جهة الالتزام",
                  selectedItem: addTransactionData.selectedCommitmentParty,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  validate: (value) {
                    if (value == null) {
                      print("Please fill this field");
                    }
                  },
                  onChange: addTransactionData.setSelectCommitmentParty,
                  finData: (data) => addTransactionData.getCommitmentParty(
                    context,
                  ),
                  useName: true,
                  buttonsColor: MyColors.yellow,
                  searchHint: "بحث",
                ),
              )
            ],
          ),
          Row(
            children: [
              MyText(
                title: "نسبة الاولوية",
                color: MyColors.black,
                size: 12.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                width: 10.h,
              ),
              Expanded(
                child: DropdownTextField<DropdownModel>(
                  dropKey: addTransactionData.priorityDropKey,
                  label: "الاولوية",
                  selectedItem: addTransactionData.selectedPriority,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  validate: (value) {
                    if (value == null) {
                      print("Please fill this field");
                    }
                  },
                  onChange: addTransactionData.setSelectPriority,
                  finData: (data) => addTransactionData.getPriority(
                    context,
                  ),
                  useName: true,
                  buttonsColor: MyColors.yellow,
                  searchHint: "بحث",
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}
