part of 'widgets_imports.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({Key? key, required this.shareCubit}) : super(key: key);
  final GenericBloc<bool> shareCubit;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: MyColors.white,
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
                onTap: () {},
                image: Res.settings,
                endDrawer: false,
              ),
              CustomDrawerCard(
                title: 'الادوات المساعدة',
                onTap: () {},
                image: Res.tools,
                endDrawer: false,
              ),
              CustomDrawerCard(
                title: 'السجل وقاعدة البيانات',
                onTap: () {},
                image: Res.database,
                endDrawer: false,
              ),
              CustomDrawerCard(
                title: 'المساعدة والشرح',
                onTap: () {},
                image: Res.explain,
                endDrawer: false,
              ),
              CustomDrawerCard(
                title: 'المشاركة',
                onTap: () {
                  shareCubit.onUpdateData(!shareCubit.state.data);
                  print(shareCubit.state.data);
                },
                image: Res.tools,
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
                      color: MyColors.white,
                      textColor: MyColors.black,
                      imageColor: MyColors.primary,
                      endDrawer: false,
                    ),
                    CustomDrawerCard(
                      title: 'الشروط والاحكام',
                      onTap: () {},
                      image: Res.terms,
                      color: MyColors.white,
                      textColor: MyColors.black,
                      imageColor: MyColors.primary,
                      endDrawer: false,
                    ),
                    CustomDrawerCard(
                      title: 'تقييم',
                      onTap: () {},
                      image: Res.star,
                      color: MyColors.white,
                      textColor: MyColors.black,
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
