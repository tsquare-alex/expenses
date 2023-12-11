part of 'wallet_imports.dart';

class WalletData {
  showButtomSheet(context, build) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 0,
        context: context,
        builder: (buildContext) {
          return const WalletDetails();
        });
  }

  balanceTransaction(
      BuildContext context, String title, VoidCallback? onPressed) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const AllertDialgBody(),
          backgroundColor: MyColors.white,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: MyText(
                    title: title,
                    color: MyColors.primary,
                    size: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  onPressed: onPressed,
                ),
                TextButton(
                  child: MyText(
                    title: "اغلاق",
                    color: MyColors.primary,
                    size: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  onPressed: () => AutoRouter.of(context).pop(),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
