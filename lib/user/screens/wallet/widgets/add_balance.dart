import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBalance extends StatefulWidget {
  final WalletModel model;
  const AddBalance({super.key, required this.model});

  @override
  State<AddBalance> createState() => _AddBalanceState();
}

class _AddBalanceState extends State<AddBalance> {
  TextEditingController controller = TextEditingController();
  double parsedNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 105.h,
          width: double.infinity,
          color: MyColors.primary,
          child: Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () => AutoRouter.of(context).pop(),
              icon: const Icon(Icons.arrow_back_ios),
              color: MyColors.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(18.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onChanged: (value) {
                  parsedNumber = double.parse(controller.text);
                },
                controller: controller,
                keyboardType: TextInputType.name,
                textAlign: TextAlign.right,
                cursorColor: MyColors.primary,
                decoration: InputDecoration(
                    hoverColor: MyColors.primary,
                    fillColor: MyColors.primary,
                    hintText: "إضافة رصيد",
                    hintStyle: TextStyle(fontSize: 18.sp, color: MyColors.grey),
                    focusColor: MyColors.primary),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        DefaultButton(
          fontSize: 12.sp,
          onTap: () {
            double result = widget.model.balance + parsedNumber;
            widget.model.balance = result;
            widget.model.save();
            AutoRouter.of(context).pop();
          },
          borderColor: MyColors.primary,
          title: "إضافة رصيد",
          color: MyColors.primary,
        ),
      ],
    );
  }
}
