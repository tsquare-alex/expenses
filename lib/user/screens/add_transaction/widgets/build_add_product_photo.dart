part of 'add_transaction_widgets_imports.dart';

class BuildAddProductPhoto extends StatelessWidget {
  const BuildAddProductPhoto({Key? key, required this.data}) : super(key: key);
  final AddTransactionData data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.r),
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: MyColors.backgroundColor,
            borderRadius: BorderRadius.circular(15.r)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(title: "إضافة صورة للمنتج", color: MyColors.black, size: 12.sp,fontWeight: FontWeight.bold,),
              InkWell(
                onTap: () => data.showSelectTypeDialog(context),
                child: Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: MyColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    color: MyColors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h,),
        BlocBuilder<GenericBloc<Uint8List?>, GenericState<Uint8List?>>(
          bloc: data.imageBloc,
          builder: (context, state) =>state.data!=null?Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                width: double.infinity,
                height: 180.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: MemoryImage(state.data!),
                    fit: BoxFit.fill,
                  ),
                  color: MyColors.grey.withOpacity(.2),
                  shape: BoxShape.rectangle,
                ),
              ),
              InkWell(
                onTap: ()=>data.removeImage(context),
                child: Container(
                  margin: EdgeInsets.all(5.r),
                  height: 30.h,
                  width: 30.w,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close,color: MyColors.white,),
                ),
              )
            ],
          ):Container(),
        ),

      ],
    );
  }
}
