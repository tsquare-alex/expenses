part of 'widgets_imports.dart';

class BuildEndDrawer extends StatelessWidget {
  const BuildEndDrawer({Key? key, required this.homeTabCubit}) : super(key: key);
  final GenericBloc<int> homeTabCubit;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        surfaceTintColor: context.watch<AppThemeCubit>().isDarkMode?AppDarkColors.backgroundColor:MyColors.grey,
        width: 235.w,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(0)),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50.r),
                  child: CircleAvatar(
                    backgroundColor: MyColors.greyWhite,
                    radius: 80.r,
                    child: Image(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width:MediaQuery.of(context).size.width * 0.55,
                      image: AssetImage(Res.logo,),
                      fit: BoxFit.contain,

                    ),
                  ),
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      // CustomDrawerCard(
                      //   title: tr(context, "fullVersion"),
                      //   onTap: () {
                      //     Navigator.of(context).pop();
                      //     AutoRouter.of(context).push(const SubscriptionsRoute());
                      //   },
                      //   endDrawer: false,
                      //   image: Res.pro,
                      //   hasArrowBack: true,
                      // ),
                      CustomDrawerCard(
                        title: tr(context, "wallets"),
                        onTap: (){
                          Navigator.of(context).pop();
                          AutoRouter.of(context).push(HomeRoute(index: 0,pageIndex: 7,),);
                        },
                        image: Res.walletImage,
                        endDrawer: true,
                        hasArrowBack: true,
                      ),
                      CustomDrawerCard(
                        title: tr(context, "transactions"),
                        onTap: (){
                          Navigator.of(context).pop();
                          AutoRouter.of(context).push(HomeRoute(index: 0,pageIndex: 0,),);
                        },
                        image: Res.transactions,
                        endDrawer: true,
                        hasArrowBack: true,
                      ),
                      CustomDrawerCard(
                        title: tr(context, "budget"),
                        onTap: (){
                          Navigator.of(context).pop();
                          AutoRouter.of(context).push(HomeRoute(index: 0,pageIndex: 8,),);
                        },
                        image: Res.budgetImage,
                        endDrawer: true,
                        hasArrowBack: true,
                      ),
                      CustomDrawerCard(
                        title: tr(context, "database"),
                        onTap: () {
                          Navigator.of(context).pop();
                          AutoRouter.of(context).push(
                            HomeRoute(
                              index: 0,
                              pageIndex: 5,
                            ),
                          );
                        },
                        image: Res.databaseImage,
                        endDrawer: false,
                        hasArrowBack: true,
                      ),
                      CustomDrawerCard(
                        title: tr(context, "tools"),
                        onTap: () {
                          Navigator.of(context).pop();
                          AutoRouter.of(context).push(
                            HomeRoute(
                              index: 0,
                              pageIndex: 4,
                            ),
                          );
                          //homeTabCubit.onUpdateData(4);
                        },
                        image: Res.toolsImage,
                        endDrawer: false,
                        hasArrowBack: true,
                      ),
                      CustomDrawerCard(
                        title: tr(context, "reports"),
                        onTap: (){
                          Navigator.of(context).pop();
                          AutoRouter.of(context).push(HomeRoute(index: 0,pageIndex: 2,),);
                        },
                        image: Res.reports,
                        endDrawer: true,
                        hasArrowBack: true,
                      ),
                      CustomDrawerCard(
                        title: tr(context, "addCart"),
                        onTap: (){
                          Navigator.of(context).pop();
                          AutoRouter.of(context).push(HomeRoute(index: 0,pageIndex: 15,),);
                        },
                        image: Res.bag,
                        endDrawer: true,
                        hasArrowBack: true,
                      ),
                    ],
                  ),
                ),

              ]
          ),
        )
    );
  }
}
