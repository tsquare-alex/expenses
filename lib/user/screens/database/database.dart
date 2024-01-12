part of 'database_imports.dart';

class Database extends StatefulWidget {

  @override
  State<Database> createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {

  String scannedContent = ""; // Variable to store the scanned content

  Future<void> _scanQRCode() async {
    try {
      var result = await BarcodeScanner.scan();
      setState(() {
        scannedContent = result.rawContent;
      });
    } on Exception catch (e) {
      print("Error scanning QR Code: $e");
    }
  }

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

                    ElevatedButton(
                      onPressed: _scanQRCode,
                      child: Text("Scan QR Code"),
                    ),
                    Text("Scanned Content: $scannedContent"),
                    BlocBuilder<DatabaseCubit, DatabaseState>(
                      builder: (context, state) {
                        List<DatabaseModel> dataBase =
                            BlocProvider.of<DatabaseCubit>(context).dataBase!;
                        // print("========================================");
                        // // print("${dataBase[0].name}");
                        // // print("${dataBase[1].name}");
                        // // print("${dataBase.length}");
                        // print("========================================");
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: dataBase.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: ExpandableCard(
                                    databaseData: dataBase[index]),
                              );
                            },
                          ),
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
