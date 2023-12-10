part of 'widgets_imports.dart';

class BuildEndDrawer extends StatelessWidget {
  const BuildEndDrawer({Key? key, required this.homeTabCubit}) : super(key: key);
  final GenericBloc<int> homeTabCubit;

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
                        onTap: (){
                          Navigator.of(context).pop();
                          homeTabCubit.onUpdateData(7);
                        },
                        image: Res.wallet,
                        endDrawer: true,
                      ),
                      CustomDrawerCard(
                        title: 'المعاملات و المصروفات',
                        onTap: (){
                          Navigator.of(context).pop();
                          homeTabCubit.onUpdateData(0);
                        },
                        image: Res.transaction,
                        endDrawer: true,
                      ),
                      CustomDrawerCard(
                        title: 'الميزانية والخطط المالية',
                        onTap: (){
                          Navigator.of(context).pop();
                          homeTabCubit.onUpdateData(8);
                        },
                        image: Res.budget,
                        endDrawer: true,
                      ),
                      CustomDrawerCard(
                        title: 'التقارير والإحصائيات',
                        onTap: (){
                          Navigator.of(context).pop();
                          homeTabCubit.onUpdateData(2);
                        },
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
