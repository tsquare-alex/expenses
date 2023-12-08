part of 'widgets_imports.dart';

class BuildEndDrawer extends StatelessWidget {
  const BuildEndDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: MyColors.white,
        width: 235.w,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(0)),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const HeaderLogo(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDrawerCard(
                        title: 'المصادر المالية',
                        onTap: (){},
                        image: Res.wallet,
                        endDrawer: true,
                      ),
                      CustomDrawerCard(
                        title: 'المعاملات و المصروفات',
                        onTap: (){},
                        image: Res.transaction,
                        endDrawer: true,
                      ),
                      CustomDrawerCard(
                        title: 'الميزانية والخطط المالية',
                        onTap: (){},
                        image: Res.budget,
                        endDrawer: true,
                      ),
                      CustomDrawerCard(
                        title: 'التقارير والإحصائيات',
                        onTap: (){},
                        image: Res.report,
                        endDrawer: true,
                      ),
                      CustomDrawerCard(
                        title: 'إنشاء السلة',
                        onTap: (){},
                        image: Res.cart,
                        endDrawer: true,
                      ),
                    ],
                  ),

                ]
            ),
          ),
        )
    );
  }
}
