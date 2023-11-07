import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants/color_manger.dart';
import '../../../constants/style_manager.dart';
import '../../../constants/values_manger.dart';

class TextFormFieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final String? hintName;
  final IconData? icon;
  final ValueNotifier<bool>? isSearch;
  final bool isObscureText, suffixEnable, isProductCode, autoFocus;
  final int? maxLength, maxLine;
  final TextInputType inputType;
  final FocusNode? focus;
  final Color? color;
  final bool isEnable, isEditable, isReadOnly;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final void Function()? onEditingCompleted;
  final void Function()? onEditTap;
  final void Function()? onScannerTap;
  final double paddingWidth;

  const TextFormFieldCustom({
    required this.controller,
    this.hintName,
    this.icon,
    this.onChanged,
    this.validator,
    this.isEditable = true,
    this.maxLength,
    this.maxLine,
    this.color,
    this.onEditingCompleted,
    this.inputFormatters,
    this.isObscureText = false,
    this.inputType = TextInputType.text,
    this.isEnable = true,
    this.onTap,
    this.onFieldSubmitted,
    this.onEditTap,
    this.onScannerTap,
    this.focus,
    this.isReadOnly = false,
    this.suffixEnable = false,
    this.isProductCode = false,
    this.autoFocus = false,
    this.isSearch,
    this.paddingWidth = AppPadding.p20,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText,
      readOnly: isReadOnly,
      focusNode: focus,
      autofocus: autoFocus,
      onTap: onTap,
      enabled: isEnable,
      keyboardType: inputType,
      inputFormatters: inputFormatters,
      style:   getBoldStyle(color:Colors.white,fontSize: AppSize.s40),
      validator: validator ??
              (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $hintName';
            }
            return null;
          },
      onEditingComplete: onEditingCompleted,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      maxLines: maxLine,
      autocorrect: isEditable,
      enableSuggestions: isEditable,
      enableInteractiveSelection: isEditable,
      maxLength: maxLength,
      textAlign:TextAlign.center,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintName,
        icon: icon != null ? Icon(icon) : null,
      ),
    );
  }
}
