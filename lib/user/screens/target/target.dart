part of 'target_imports.dart';

class Target extends StatefulWidget {
  const Target({
    Key? key,
  }) : super(key: key);

  @override
  State<Target> createState() => _TargetState();
}

class _TargetState extends State<Target> {
  TargetData data = TargetData();

  @override
  void initState() {
    data.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => AutoRouter.of(context).push(
          AddTransactionRoute(
            model: data.model,
          ),
        ),
        backgroundColor: MyColors.primary,
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          color: MyColors.white,
        ),
      ),
      body: BlocBuilder<GenericBloc<List<AddTransactionModel>>,
          GenericState<List<AddTransactionModel>>>(
        bloc: data.addTransactionCubit,
        builder: (context, state) {
          if (state.data.isEmpty) {
            return const SingleChildScrollView(
              child: BuildNoRecord(),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(15.0.r),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.data.length,
                itemBuilder: (context, i) => BuildTransactionCard(
                  model: state.data[i], onDelete: ()=>data.deleteItem(state.data[i],),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
