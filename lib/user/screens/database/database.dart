part of 'database_imports.dart';

class Database extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DatabaseCubit()..fetchAllDatabase(),
      child: BlocConsumer<DatabaseCubit, DatabaseState>(
        listener: (context, state) {
          if (state is DatabaseSuccess) {}
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: Row(
                children: [
                  Image.asset(
                    Res.database,
                    width: 20.w,
                    height: 20.h,
                    color: MyColors.white,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  MyText(
                    title: tr(context, 'database'),
                    color: Colors.white,
                    size: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  onPressed: () {
                    BlocProvider.of<DatabaseCubit>(context).scanQRCode();
                  },
                  icon: Icon(FontAwesomeIcons.qrcode),
                ),
              ],
            ),
            // floatingActionButton: FloatingActionButton(
            //     onPressed: () => AutoRouter.of(context).push(AddDatabaseRoute()),
            //     child: const Icon(Icons.add)),
            floatingActionButton: FloatingActionButton(
              backgroundColor: MyColors.primary,
              onPressed: () async {
                await AutoRouter.of(context).push(AddDatabaseRoute());
                // await Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => AddDatabase(),
                //   ),
                // );
                if (context.mounted) {
                  context.read<DatabaseCubit>().fetchAllDatabase();
                }
              },
              child: const Icon(Icons.add),
            ),
            // backgroundColor: MyColors.headerColor.withOpacity(0.2),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BlocBuilder<DatabaseCubit, DatabaseState>(
                      builder: (context, state) {
                        if (state is DatabaseScannedResult) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Scan Result:',
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(height: 10),
                              Text(
                                state.scanResult,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                              IconButton(
                                onPressed: () {
                                  BlocProvider.of<DatabaseCubit>(context)
                                      .scanQRCode();
                                },
                                icon: Icon(FontAwesomeIcons.qrcode),
                              ),
                            ],
                          );
                        } else if (state is DatabaseDataFirestoreLoaded) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Scan Result:',
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(height: 10),
                              Text(
                                state.documentData,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              // Text(
                              //   'Document Number: ${state.documentNumber}',
                              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              // ),
                              // SizedBox(height: 10),
                              // Text(
                              //   'Document Data: ${state.documentData}',
                              //   style: TextStyle(fontSize: 18),
                              // ),
                              // SizedBox(height: 20),
                              IconButton(
                                onPressed: () {
                                  BlocProvider.of<DatabaseCubit>(context)
                                      .scanQRCode();
                                },
                                icon: Icon(FontAwesomeIcons.qrcode),
                              ),
                            ],
                          );
                        } else if (state is DatabaseError) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Result: No Data Found'),
                              IconButton(
                                onPressed: () {
                                  BlocProvider.of<DatabaseCubit>(context)
                                      .scanQRCode();
                                },
                                icon: Icon(FontAwesomeIcons.qrcode),
                              ),
                            ],
                          );
                        } else {
                          return Center(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 20.r),
                                  child: Image.asset(
                                    Res.searchRecords,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                MyText(
                                  title: "No Record",
                                  color: MyColors.black,
                                  size: 16.sp,
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            ),
                          );
                        }
                      },
                    ),
                    BlocBuilder<DatabaseCubit, DatabaseState>(
                      builder: (context, state) {
                        List<DatabaseModel> dataBase =
                            BlocProvider.of<DatabaseCubit>(context).dataBase!;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: dataBase.length,
                          itemBuilder: (context, index) {
                            return ExpandableCard(
                                databaseData: dataBase[index]);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
