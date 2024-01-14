part of 'widgets_imports.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({Key? key, required this.shareCubit, required this.homeTabCubit}) : super(key: key);
  final GenericBloc<bool> shareCubit;
  final GenericBloc<int> homeTabCubit;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode?AppDarkColors.backgroundColor:MyColors.white,
        width: 220.w,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0), bottomLeft: Radius.circular(0)),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const HeaderLogo(),
              ),
              CustomDrawerCard(
                title: tr(context, "settings"),
                onTap: () {
                  AutoRouter.of(context).push(HomeRoute(index: 0,pageIndex: 3,),);
                },
                image: Res.settings,
                endDrawer: false,
              ),
              CustomDrawerCard(
                title: tr(context, "tools"),
                onTap: () {
                  //Navigator.of(context).pop();
                  AutoRouter.of(context).push(HomeRoute(index: 0,pageIndex: 4,),);
                  //homeTabCubit.onUpdateData(4);
                },
                image: Res.tools,
                endDrawer: false,
              ),
              CustomDrawerCard(
                title: tr(context, "database"),
                onTap: () {
                  AutoRouter.of(context).push(HomeRoute(index: 0,pageIndex: 5,),);
                },
                image: Res.database,
                endDrawer: false,
              ),
              CustomDrawerCard(
                title: tr(context, "help"),
                onTap: () {
                  AutoRouter.of(context).push(HomeRoute(index: 0,pageIndex: 6,),);
                },
                image: Res.explain,
                endDrawer: false,
              ),
              CustomDrawerCard(
                title: tr(context, "share"),
                onTap: () {
                  shareCubit.onUpdateData(!shareCubit.state.data);
                  print(shareCubit.state.data);
                },
                image: Res.share,
                endDrawer: false,
              ),
              BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                bloc: shareCubit,
                builder: (context, state) => state.data == true
                    ? Column(
                  children: [
                    CustomDrawerCard(
                      title: tr(context, "about"),
                      onTap: () {
                        CustomToast.showSimpleToast(msg: "تحت التطوير",color: Colors.red,);
                      },
                      image: Res.about,
                      color: context.watch<AppThemeCubit>().isDarkMode?AppDarkColors.backgroundColor:MyColors.white,
                      textColor: context.watch<AppThemeCubit>().isDarkMode?MyColors.white:MyColors.black,
                      imageColor: MyColors.primary,
                      endDrawer: false,
                    ),
                    CustomDrawerCard(
                      title: tr(context, "terms"),
                      onTap: () {
                        CustomToast.showSimpleToast(msg: "تحت التطوير",color: Colors.red,);
                      },
                      image: Res.terms,
                      color: context.watch<AppThemeCubit>().isDarkMode?AppDarkColors.backgroundColor:MyColors.white,
                      textColor: context.watch<AppThemeCubit>().isDarkMode?MyColors.white:MyColors.black,
                      imageColor: MyColors.primary,
                      endDrawer: false,
                    ),
                    CustomDrawerCard(
                      title: tr(context, "rate"),
                      onTap: () {
                        CustomToast.showSimpleToast(msg: "تحت التطوير",color: Colors.red,);
                      },
                      image: Res.star,
                      color: context.watch<AppThemeCubit>().isDarkMode?AppDarkColors.backgroundColor:MyColors.white,
                      textColor: context.watch<AppThemeCubit>().isDarkMode?MyColors.white:MyColors.black,
                      imageColor: MyColors.amber,
                      endDrawer: false,
                    ),

                  ],
                )
                    : Container(),
              ),
            ]),
          ),
        ));
  }
}
