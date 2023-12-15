part of 'database_imports.dart';

class Database extends StatelessWidget {
  // DatabaseData databaseData = DatabaseData();
  // DatabaseCubit databaseCubit = DatabaseCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DatabaseCubit()..fetchAllDatabase(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () => AutoRouter.of(context).push(AddDatabaseRoute()),
            child: const Icon(Icons.add)),
        backgroundColor: MyColors.headerColor.withOpacity(0.2),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyText(
                    title: "عرض البيانات",
                    color: MyColors.primary,
                    size: 20.sp,
                    fontWeight: FontWeight.bold),
                BlocBuilder<DatabaseCubit, DatabaseState>(
                  builder: (context, state) {
                    List<DatabaseModel> dataBase = BlocProvider.of<DatabaseCubit>(context).dataBase!;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: dataBase.length,
                      itemBuilder: (context, index) {
                        return ExpandableCard(
                            databaseData: dataBase[index]
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
