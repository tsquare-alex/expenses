import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'CustomDropDown.dart';

class DropdownTextField<DataType> extends StatefulWidget {
  final dynamic data;
  final GlobalKey? dropKey;
  final String? label;
  final String? hint;
  final String? searchHint;
  final DataType? selectedItem;
  final bool showSelectedItem;
  final EdgeInsets? margin;
  final double? fontSize;
  final double? labelSize;
  final double? textSize;
  final String? Function(dynamic) validate;
  final dynamic onChange;
  final dynamic finData;
  final EdgeInsets? arrowBtnPadding;
  final EdgeInsets? clearBtnPadding;
  final EdgeInsets? contentPadding;
  final bool useName;
  final Color? enableColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? buttonsColor;
  final BorderRadius? radius;

  DropdownTextField(
      {this.label,
      this.hint,
      this.margin,
      required this.validate,
      this.contentPadding,
      this.clearBtnPadding,
      this.arrowBtnPadding,
      this.useName = true,
      this.searchHint,
      this.onChange,
      this.fontSize,
      this.textSize,
      this.labelSize,
      this.hintColor,
      this.fillColor,
      this.buttonsColor,
      this.finData,
      this.dropKey,
      this.data,
      this.enableColor,
      this.selectedItem,
      this.radius,
      this.showSelectedItem = false});

  @override
  _DropdownTextFieldState<DataType> createState() =>
      _DropdownTextFieldState<DataType>();
}

class _DropdownTextFieldState<DataType> extends State<DropdownTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? EdgeInsets.zero,
      child: DropdownSearch<DataType>(
        key: widget.dropKey,
        mode: Mode.BOTTOM_SHEET,
        isFilteredOnline: false,
        maxHeight: 600,
        label: widget.label,
        items: widget.data,
        onFind: widget.finData,
        validator: widget.validate,
        onChanged: widget.onChange,
        showSearchBox: true,
        showClearButton: true,
        clearButton: Padding(
          padding: widget.clearBtnPadding ??
              const EdgeInsets.symmetric(horizontal: 5),
          child: Icon(Icons.clear,
              size: 20, color: widget.buttonsColor ?? Colors.black),
        ),
        dropDownButton: Padding(
          padding: widget.arrowBtnPadding ??
              const EdgeInsets.symmetric(horizontal: 5),
          child: Icon(Icons.arrow_drop_down,
              size: 28, color: widget.buttonsColor ?? Colors.black),
        ),
        selectedItem: widget.selectedItem,
        itemAsString: (dynamic u) => widget.useName ? u.name : u,
        showSelectedItem: widget.showSelectedItem,
        style: TextStyle(
          fontSize: widget.textSize ?? 14.sp,
        ),
        searchBoxStyle: TextStyle(
          fontSize: 14.sp,
          color: MyColors.txtColor,
          fontWeight: FontWeight.bold
        ),
        searchBoxDecoration: InputDecoration(
          hintText: widget.searchHint ?? tr(context, "search"),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.black, width: .7.w),
            borderRadius: widget.radius??BorderRadius.circular(10.r),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
        popupTitle: Container(
          height: 50,
          decoration: BoxDecoration(
            color: MyColors.primary,
          ),
          child: Center(
            child: MyText(
              title: widget.label != null ? widget.label??"" : widget.hint??"",
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
        dropdownSearchDecoration: InputDecoration(
          label: MyText(title: "${widget.label}", color: MyColors.txtColor, size: 13.sp),
          hintText: widget.hint,
          fillColor: widget.fillColor,
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: widget.enableColor ?? MyColors.greyWhite, width: .7),
            borderRadius: widget.radius??BorderRadius.circular(10.r),
          ),
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        ),
      ),
    );
  }
}
