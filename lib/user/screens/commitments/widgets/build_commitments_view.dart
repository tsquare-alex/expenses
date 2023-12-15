part of 'commitments_widgets_imports.dart';

class BuildCommitmentsView extends StatelessWidget {
  const BuildCommitmentsView({Key? key, required this.commitmentsData}) : super(key: key);
  final CommitmentsData commitmentsData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: commitmentsData.contentCubit,
          builder: (context, state) {
            return BuildTransactionItem(
              name: "فواتير",
              image: Res.budget,
              onTap: () =>
                  commitmentsData.contentCubit.onUpdateData(
                      !commitmentsData.contentCubit.state.data),
              hasContent: state.data,
              content: Column(
                children: [
                  BuildTransactionItem(
                    onTap: (){},
                    name: "كهرباء",
                    image: Res.one,
                    radius: 18.r,
                    width: 18.w,
                    height: 18.w,
                  ),
                  BuildTransactionItem(
                    onTap: (){},
                    name: "مياه",
                    image: Res.two,
                    radius: 18.r,
                    width: 18.w,
                    height: 18.w,
                  ),
                  BuildTransactionItem(
                    onTap: (){},
                    name: "غاز",
                    image: Res.two,
                    radius: 18.r,
                    width: 18.w,
                    height: 18.w,
                  ),
                ],
              ),
            );
          },
        ),
        BuildTransactionItem(
          name: "إيجار",
          image: Res.budget,
          onTap: () {}
        ),
        BuildTransactionItem(
            name: "أقساط",
            image: Res.budget,
            onTap: () {}
        ),
        BuildTransactionItem(
            name: "تأمينات",
            image: Res.budget,
            onTap: () {}
        ),
        BuildTransactionItem(
            name: "اشتراكات",
            image: Res.budget,
            onTap: () {}
        ),
        BuildTransactionItem(
            name: "إيجاؤ",
            image: Res.budget,
            onTap: () {}
        ),

      ],
    );
  }
}
