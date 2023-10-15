import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:give_away/src/presentation/shared/widgets/give_away_vector_image.dart';
import 'package:give_away/src/presentation/theme/constants/dimensions.dart';
import 'package:give_away/src/presentation/theme/give_away_theme.dart';
import 'package:give_away/src/presentation/theme/palette/give_away_colors.dart';
import 'package:give_away/src/presentation/theme/theme_extensions.dart';

class GiveAwayTextFormField extends StatefulWidget {
  const GiveAwayTextFormField({
    super.key,
    this.onTap,
    this.onChanged,
    this.validator,
    this.obscuringCharacter = '*',
    this.style,
    this.controller,
    this.decoration,
    this.hintStyle,
    this.hintText,
    this.suffixIcon,
    this.autocorrect = true,
    this.autofillHints,
    this.autofocus = false,
    this.autovalidateMode,
    this.enabled,
    this.expands = false,
    this.focusNode,
    this.initialValue,
    this.inputFormatters,
    this.keyboardAppearance,
    this.keyboardType,
    this.maxLength,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTapOutside,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textCapitalization = TextCapitalization.none,
    this.fillColor,
    this.borderColor,
    this.borderWidth = 1,
    this.isPasswordField = false,
    this.labelText,
    this.labelStyle,
    this.errorText,
    this.errorStyle,
    this.textColor,
    this.prefixIcon,
    this.constraints,
    this.minLines,
    this.maxLines,
    this.borderRadius,
    this.readOnly,
    this.suffix,
    this.textInputAction,
    this.floatingLabelStyle,
    this.floatingLabelBehavior,
  });

  final void Function()? onTap;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String obscuringCharacter;
  final TextStyle? style;
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool? autocorrect;
  final Iterable<String>? autofillHints;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final bool? enabled;
  final bool expands;
  final FocusNode? focusNode;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final Brightness? keyboardAppearance;
  final TextInputType? keyboardType;
  final int? maxLength;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final void Function(PointerDownEvent)? onTapOutside;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization textCapitalization;
  final Color? fillColor;
  final Color? borderColor;
  final double borderWidth;
  final bool isPasswordField;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? errorText;
  final TextStyle? errorStyle;
  final Color? textColor;
  final Widget? prefixIcon;
  final BoxConstraints? constraints;
  final int? minLines;
  final int? maxLines;
  final double? borderRadius;
  final bool? readOnly;
  final TextInputAction? textInputAction;
  final TextStyle? floatingLabelStyle;
  final FloatingLabelBehavior? floatingLabelBehavior;

  @override
  State<GiveAwayTextFormField> createState() => _GiveAwayTextFormFieldState();

  factory GiveAwayTextFormField.password({
    Key? key,
    String? labelText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    void Function()? onTap,
    void Function()? onEditingComplete,
    void Function(String)? onFieldSubmitted,
    void Function(String?)? onSaved,
    void Function(PointerDownEvent)? onTapOutside,
    void Function(String)? onChanged,
    Color? fillColor,
    TextInputAction? textInputAction,
    Color? textColor,
    String? errorText,
    Color? borderColor,
  }) =>
      GiveAwayTextFormField(
        key: key,
        labelText: labelText,
        onTap: onTap,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        onTapOutside: onTapOutside,
        fillColor: fillColor,
        textInputAction: textInputAction,
        textColor: textColor,
        validator: validator,
        controller: controller,
        errorText: errorText,
        borderColor: borderColor,
        isPasswordField: true,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        autocorrect: false,
      );

  factory GiveAwayTextFormField.email({
    Key? key,
    bool? enabled,
    String? labelText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    void Function()? onTap,
    void Function()? onEditingComplete,
    void Function(String)? onFieldSubmitted,
    void Function(String?)? onSaved,
    void Function(PointerDownEvent)? onTapOutside,
    void Function(String)? onChanged,
    Color? fillColor,
    TextInputAction? textInputAction,
    Color? textColor,
    String? errorText,
    Color? borderColor,
  }) =>
      GiveAwayTextFormField(
        key: key,
        enabled: enabled,
        labelText: labelText,
        onTap: onTap,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        onTapOutside: onTapOutside,
        fillColor: fillColor,
        textInputAction: textInputAction,
        textColor: textColor,
        validator: validator,
        controller: controller,
        errorText: errorText,
        borderColor: borderColor,
        textCapitalization: TextCapitalization.none,
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
      );

  factory GiveAwayTextFormField.date({
    Key? key,
    String? labelText,
    TextEditingController? controller,
    Color? fillColor,
    Color? textColor,
    Color? borderColor,
    String? Function(String?)? validator,
  }) =>
      GiveAwayTextFormField(
        key: key,
        labelText: labelText,
        fillColor: fillColor,
        textColor: textColor,
        controller: controller,
        borderColor: borderColor,
        enabled: false,
        suffixIcon: Icon(
          Icons.calendar_today,
          color: GiveAwayColors.neutral[300]!,
        ),
        validator: validator,
      );

  factory GiveAwayTextFormField.search({
    Key? key,
    bool? enabled,
    String? hintText,
    TextEditingController? controller,
    void Function()? onTap,
    void Function(String)? onChanged,
    Color? fillColor,
    TextInputAction? textInputAction,
    Color? textColor,
    Color? borderColor,
    TextInputType? keyboardType,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool? expands,
    int? minLines,
    int? maxLines,
  }) =>
      GiveAwayTextFormField(
        key: key,
        enabled: enabled,
        hintText: hintText,
        onTap: onTap,
        onChanged: onChanged,
        fillColor: fillColor,
        textInputAction: textInputAction,
        textColor: textColor,
        controller: controller,
        borderColor: borderColor,
        keyboardType: keyboardType,
        textCapitalization: TextCapitalization.words,
        autocorrect: false,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        expands: expands ?? false,
        minLines: minLines,
        maxLines: maxLines,
      );

  factory GiveAwayTextFormField.name({
    Key? key,
    bool? enabled,
    String? labelText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    Color? fillColor,
    TextInputAction? textInputAction,
    Color? textColor,
    Color? borderColor,
  }) =>
      GiveAwayTextFormField(
        key: key,
        enabled: enabled,
        labelText: labelText,
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        fillColor: fillColor,
        textInputAction: textInputAction,
        textColor: textColor,
        borderColor: borderColor,
        keyboardType: TextInputType.name,
        textCapitalization: TextCapitalization.words,
        autocorrect: false,
      );
}

class _GiveAwayTextFormFieldState extends State<GiveAwayTextFormField> {
  bool _isObsecure = true;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final baseTextStyle = context.theme.h6.copyWith(
      color: widget.textColor,
    );
    final greyTextStyle = context.theme.h6.copyWith(
      color: GiveAwayColors.neutral[300]!,
    );
    final errorTextStyle = context.theme.inputFloatingLabel.copyWith(
      color: GiveAwayColors.error[500]!,
    );
    return TextFormField(
      readOnly: widget.readOnly ?? false,
      onTap: widget.onTap,
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText: widget.isPasswordField ? _isObsecure : false,
      obscuringCharacter: widget.obscuringCharacter,
      style: widget.style ?? baseTextStyle,
      controller: widget.controller,
      autocorrect: widget.autocorrect ?? false,
      autofillHints: widget.autofillHints,
      autofocus: widget.autofocus,
      autovalidateMode: widget.autovalidateMode,
      enabled: widget.enabled,
      expands: widget.expands,
      focusNode: widget.focusNode,
      initialValue: widget.initialValue,
      inputFormatters: widget.inputFormatters,
      keyboardAppearance: widget.keyboardAppearance,
      keyboardType: widget.keyboardType ??
          ((widget.maxLines != null && widget.maxLines! > 1)
              ? TextInputType.multiline
              : TextInputType.text),
      maxLength: widget.maxLength,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      onTapOutside: widget.onTapOutside,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      textCapitalization: widget.textCapitalization,
      minLines: widget.minLines,
      maxLines: widget.isPasswordField
          ? 1
          : widget.maxLines ?? (widget.expands ? null : 1),
      textInputAction: widget.textInputAction,
      decoration: widget.decoration ??
          InputDecoration(
            isDense: true,
            hintText: widget.hintText,
            hintStyle: widget.hintStyle ?? greyTextStyle,
            // border: _border(
            //   borderColor: widget.borderColor ?? GiveAwayColors.thamarBlack500,
            // ),
            // enabledBorder: _border(
            //   borderColor: widget.borderColor ?? GiveAwayColors.thamarBlack500,
            // ),
            // focusedBorder: _border(
            //   borderColor: GiveAwayColors.flirtatious500,
            // ),
            // errorBorder: _border(
            //   borderColor: GiveAwayColors.errorRed,
            // ),
            // disabledBorder: _border(
            //   borderColor: widget.borderColor ??
            //       GiveAwayColors.gray600.withOpacity(0.64),
            // ),
            focusedErrorBorder: _border(
              borderColor: widget.borderColor ?? theme.theme.colorScheme.error,
            ),
            fillColor: widget.fillColor, //?? theme.primaryBackgroundColor,
            filled: true,
            suffix: widget.suffix,
            suffixIcon: (widget.isPasswordField || widget.suffixIcon != null)
                ? Padding(
                    padding: const EdgeInsets.only(
                      right: Dimensions.marginMiddle,
                      top: Dimensions.marginMiddle,
                      bottom: Dimensions.marginMiddle,
                    ),
                    child: widget.isPasswordField
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                _isObsecure = !_isObsecure;
                              });
                            },
                            child: Icon(
                              _isObsecure ? Icons.key : Icons.key_off,
                              // color: GiveAwayColors.gray400,
                            ),
                          )
                        : widget.suffixIcon,
                  )
                : null,
            labelText: widget.labelText,
            labelStyle: widget.labelStyle ?? greyTextStyle,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Dimensions.marginBig,
              vertical: 18,
            ),
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelBehavior:
                widget.floatingLabelBehavior ?? FloatingLabelBehavior.auto,
            floatingLabelStyle: widget.floatingLabelStyle ?? greyTextStyle,
            alignLabelWithHint: false,
            errorText: widget.errorText,
            errorStyle: widget.errorStyle ?? errorTextStyle,
            errorMaxLines: 2,
            constraints: widget.constraints,
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: Dimensions.marginDefault,
                    ),
                    child: widget.prefixIcon,
                  )
                : null,
          ),
    );
  }

  InputBorder _border({
    required Color borderColor,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        widget.borderRadius ?? Dimensions.textFieldCircularRadius,
      ),
      borderSide: BorderSide(
        color: borderColor,
        style: BorderStyle.solid,
        width: widget.borderWidth,
      ),
    );
  }
}
