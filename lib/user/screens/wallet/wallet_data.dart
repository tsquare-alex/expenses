part of 'wallet_imports.dart';

class WalletData {
  showButtomSheet(context, build, model) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 0,
        context: context,
        builder: (buildContext) {
          return WalletDetails(model: model);
        });
  }

  List<String> valueCategory = [
    "نقدي",
    "حساب بنكي",
    "تحويل بنكي",
    "موبايل كاش",
    "نقاط",
    "انستاباي",
  ];

  List<String> paymentMethod = ["تحويل بنكي", "حساب بنكي", "نقدي"];
  List<String> walletCategory = [
    "حافز",
    "راتب",
    "إضافي",
    "مكافأة",
    "هدايا",
    "حساب بنكي",
    "إيجار",
    "عائد مشروع",
    "صفقة",
  ];
  List<String> encomeSource = ["شخص", "جهة"];
  List<String> curancyType = ["ر.س", "ج.م"];
  List<String> repeatWallet = [
    "يومياً",
    "اسبوعياً",
    "شهرياً",
    "ربع سنوياً",
    "نصف سنوياً",
    "سنوياً",
  ];

  addPaymentMethodValue(
    context,
    build,
    TextEditingController controller,
  ) {
    showModalBottomSheet(
      isScrollControlled: false,
      elevation: 0,
      context: context,
      builder: (buildContext) {
        return Padding(
          padding: EdgeInsets.all(12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.right,
                cursorColor: MyColors.primary,
                decoration: InputDecoration(
                    hintText: " ادخل القيمة",
                    hintStyle: TextStyle(fontSize: 18.sp, color: MyColors.grey),
                    focusColor: MyColors.primary),
              ),
              SizedBox(height: 15.h),
              DefaultButton(
                  title: "اضافة",
                  onTap: () {
                    if (controller.text.isNotEmpty) {
                      paymentMethod.add(controller.text);
                      Navigator.of(context).pop();
                    }
                  }),
            ],
          ),
        );
      },
    );
  }

  addWalletCategoryValue(context, build, TextEditingController controller) {
    showModalBottomSheet(
      isScrollControlled: false,
      elevation: 0,
      context: context,
      builder: (buildContext) {
        return Padding(
          padding: EdgeInsets.all(12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.right,
                cursorColor: MyColors.primary,
                decoration: InputDecoration(
                    hintText: " ادخل القيمة",
                    hintStyle: TextStyle(fontSize: 18.sp, color: MyColors.grey),
                    focusColor: MyColors.primary),
              ),
              SizedBox(height: 16),
              DefaultButton(
                  title: "اضافة",
                  onTap: () {
                    if (controller.text.isNotEmpty) {
                      walletCategory.add(controller.text);
                      Navigator.of(context).pop();
                    }
                  }),
            ],
          ),
        );
      },
    );
  }

  addEncomeValue(context, build, TextEditingController controller) {
    showModalBottomSheet(
      isScrollControlled: false,
      elevation: 0,
      context: context,
      builder: (buildContext) {
        return Padding(
          padding: EdgeInsets.all(12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.right,
                cursorColor: MyColors.primary,
                decoration: InputDecoration(
                    hintText: " ادخل القيمة",
                    hintStyle: TextStyle(fontSize: 18.sp, color: MyColors.grey),
                    focusColor: MyColors.primary),
              ),
              SizedBox(height: 16),
              DefaultButton(
                  title: "اضافة",
                  onTap: () {
                    if (controller.text.isNotEmpty) {
                      encomeSource.add(controller.text);
                      Navigator.of(context).pop();
                    }
                  }),
            ],
          ),
        );
      },
    );
  }

  addValueCategory(context, build, TextEditingController controller) {
    showModalBottomSheet(
      isScrollControlled: false,
      elevation: 0,
      context: context,
      builder: (buildContext) {
        return Padding(
          padding: EdgeInsets.all(12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.right,
                cursorColor: MyColors.primary,
                decoration: InputDecoration(
                    hintText: " ادخل القيمة",
                    hintStyle: TextStyle(fontSize: 18.sp, color: MyColors.grey),
                    focusColor: MyColors.primary),
              ),
              SizedBox(height: 16),
              DefaultButton(
                  title: "اضافة",
                  onTap: () {
                    if (controller.text.isNotEmpty) {
                      valueCategory.add(controller.text);
                      Navigator.of(context).pop();
                    }
                  }),
            ],
          ),
        );
      },
    );
  }
}
