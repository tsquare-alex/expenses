part of 'add_cart_widgets_imports.dart';

class BuildAddCartProductPhoto extends StatelessWidget {
  const BuildAddCartProductPhoto({Key? key, required this.data}) : super(key: key);
  final AddCartData data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0.r),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 15.r),
                  padding: EdgeInsets.all(15.r),
                  decoration: BoxDecoration(
                      color: MyColors.white,
                      border: Border.all(width: 1.w, color: MyColors.greyWhite),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        title: tr(context, "addPhoto"),
                        color: MyColors.black,
                        size: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10.r),
                            margin: EdgeInsets.only(left: 10.r),
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                              width: 3.w,
                              color: MyColors.greyWhite,
                            ))),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              onTap: () => data.setCameraImages(context),
                              child: Image.asset(
                                Res.camera,
                                width: 40.w,
                                height: 40.h,
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () => data.setGalleryImages(context),
                            child: Image.asset(
                              Res.galary,
                              width: 40.w,
                              height: 40.h,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.r),
                padding: EdgeInsets.all(15.r),
                decoration: BoxDecoration(
                    color: MyColors.white,
                    border: Border.all(width: 1.w, color: MyColors.greyWhite),
                    borderRadius: BorderRadius.circular(15.r)),
                child: InkWell(
                  onTap: (){},
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    child: Image.asset(
                      Res.scanQr,
                      width: 40.w,
                      height: 40.h,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          BlocBuilder<GenericBloc<Uint8List?>, GenericState<Uint8List?>>(
            bloc: data.imageBloc,
            builder: (context, state) => state.data != null
                ? Stack(
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
                        onTap: () => data.removeImage(context),
                        child: Container(
                          margin: EdgeInsets.all(5.r),
                          height: 30.h,
                          width: 30.w,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            color: MyColors.white,
                          ),
                        ),
                      )
                    ],
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
