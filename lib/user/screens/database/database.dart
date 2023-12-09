part of 'database_imports.dart';

class Database extends StatelessWidget {
  // DatabaseData databaseData = DatabaseData();
  DatabaseCubit databaseCubit = DatabaseCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DatabaseCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddDatabase()));
            },
            child: const Icon(Icons.add)),
        backgroundColor: MyColors.headerColor.withOpacity(0.2),
        appBar: AppBar(
          backgroundColor: MyColors.primary,
          elevation: 0,
          leading: IconButton(
            onPressed: () => AutoRouter.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          centerTitle: true,
          title: MyText(
            title: "السجل وقواعد البيانات",
            color: MyColors.white,
            size: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: databaseCubit.dataBaseModel.length,
                  itemBuilder: (context, index) {
                    return ExpandableCard(
                        databaseData: BlocProvider
                            .of<DatabaseCubit>(context)
                            .dataBaseModel[index]);
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

class AddDatabase extends StatelessWidget {

MyExpansionCubit myCubit = MyExpansionCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyExpansionCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: MyColors.primary,
          title: MyText(
            title: "أضافة جهة",
            color: MyColors.white,
            size: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                DottedBorder(
                  color: Colors.black,
                  strokeWidth: 2,
                  child: Column(
                    children: [
                      const Icon(Icons.camera_alt_outlined),
                      MyText(
                          title: "أضف صورة",
                          color: MyColors.primary,
                          size: 12.sp),
                    ],
                  ),
                ),

                MyExpansionTile(),
                const SizedBox(height: 16.0),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

