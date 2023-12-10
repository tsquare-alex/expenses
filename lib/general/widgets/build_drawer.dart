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
                title: 'الاعدادات والضبط',
                onTap: () {
                  Navigator.of(context).pop();
                  homeTabCubit.onUpdateData(3);
                },
                image: Res.settings,
                endDrawer: false,
              ),
              CustomDrawerCard(
                title: 'الادوات المساعدة',
                onTap: () {
                  Navigator.of(context).pop();
                  homeTabCubit.onUpdateData(4);
                },
                image: Res.tools,
                endDrawer: false,
              ),
              CustomDrawerCard(
                title: 'السجل وقاعدة البيانات',
                onTap: () {
                  Navigator.of(context).pop();
                  homeTabCubit.onUpdateData(5);
                },
                image: Res.database,
                endDrawer: false,
              ),
              CustomDrawerCard(
                title: 'المساعدة والشرح',
                onTap: () {
                  Navigator.of(context).pop();
                  homeTabCubit.onUpdateData(6);
                },
                image: Res.explain,
                endDrawer: false,
              ),
              CustomDrawerCard(
                title: 'المشاركة',
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
                      title: 'عن التطبيق',
                      onTap: () {},
                      image: Res.about,
                      color: context.watch<AppThemeCubit>().isDarkMode?AppDarkColors.backgroundColor:MyColors.white,
                      textColor: context.watch<AppThemeCubit>().isDarkMode?MyColors.white:MyColors.black,
                      imageColor: MyColors.primary,
                      endDrawer: false,
                    ),
                    CustomDrawerCard(
                      title: 'الشروط والاحكام',
                      onTap: () {},
                      image: Res.terms,
                      color: context.watch<AppThemeCubit>().isDarkMode?AppDarkColors.backgroundColor:MyColors.white,
                      textColor: context.watch<AppThemeCubit>().isDarkMode?MyColors.white:MyColors.black,
                      imageColor: MyColors.primary,
                      endDrawer: false,
                    ),
                    CustomDrawerCard(
                      title: 'تقييم',
                      onTap: () {},
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
