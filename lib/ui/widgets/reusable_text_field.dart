import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.visibility = true,
    this.starSymbolReq = true,
    this.obscureText = false,
    this.isNumberKeyBoard = false,
    this.isDecimalReq = false,
    this.isDense = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.hintText,
    this.bottomMargin = 8,
    this.focusNode,
    this.onEditingComplete,
    this.enableInteractiveSelection = true,
    this.onTap,
    this.maxLength,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.textInputType =TextInputType.text,
  }) : super(key: key);

  final bool visibility;
  final bool starSymbolReq;
  final bool obscureText;
  final bool isNumberKeyBoard;
  final bool isDecimalReq;
  final bool isDense;
  final bool? enabled;
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final double bottomMargin;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final bool enableInteractiveSelection;
  final Function()? onTap;
  final int? maxLength;
  final Function(String)? onFieldSubmitted;
  final int maxLines;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText.isNotEmpty)
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(text: labelText),
                  if (starSymbolReq)
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
          const SizedBox(height: 2),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            enabled: enabled,
            focusNode: focusNode,
            onEditingComplete: onEditingComplete,
            enableInteractiveSelection: enableInteractiveSelection,
            onTap: onTap,
            onFieldSubmitted: onFieldSubmitted,
            maxLength: maxLength,
            maxLines: maxLines,
            keyboardType: isNumberKeyBoard
                ? TextInputType.numberWithOptions(
                    decimal: isDecimalReq, signed: false)
                : textInputType,
            inputFormatters: isNumberKeyBoard && !isDecimalReq
                ? [FilteringTextInputFormatter.digitsOnly]
                : null,
            textInputAction: TextInputAction.next,
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              isDense: isDense,
              counter: const SizedBox.shrink(),
              border: InputBorder.none,
              fillColor:
                  enabled != null && !enabled! ? Colors.grey.shade200 : null,
              filled: enabled != null && !enabled!,
              prefix: prefix,
              suffixIcon: suffixIcon,
              hintText: hintText,
              contentPadding: enabled != null && enabled!
                  ? const EdgeInsets.symmetric(vertical: 8, horizontal: 8)
                  : null,
              enabledBorder: enabled != null && enabled!
                  ? OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.3)),
                    )
                  : null,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.withOpacity(0.3)),
              ),
            ),
          ),
          if (bottomMargin > 0) SizedBox(height: bottomMargin),
        ],
      ),
    );
  }
}
