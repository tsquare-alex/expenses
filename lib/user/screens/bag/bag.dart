part of 'bag_imports.dart';

class Bag extends StatefulWidget {
  const Bag({Key? key}) : super(key: key);

  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  BagData data = BagData();

  @override
  void initState() {
    data.initialTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<BagModel>>,
        GenericState<List<BagModel>>>(
      bloc: data.cartCubit,
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: state.data.isNotEmpty
              ? FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: MyColors.primary,
                  child: Icon(
                    Icons.add,
                    color: MyColors.white,
                  ),
                )
              : null,
          body: Padding(
            padding: EdgeInsets.all(15.r),
            child: state.data.isEmpty
                ? AddBagItem(
                    bagData: data,
                  )
                : BuildBagItems(
                    model: state.data,
                  ),
          ),
        );
      },
    );
  }
}
