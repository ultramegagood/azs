import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedTextField extends StatefulWidget {
  final Key? key;
  final String? value;
  final TextStyle? inputTextStyle;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final List<TextInputFormatter>? inputFormatters;
  final String? labelText;
  final void Function(String)? onChange;
  final void Function(String)? onSubmitted;
  final InputDecoration decoration;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final AutovalidateMode autovalidateMode;
  final Widget? prefixIcon;
  final bool readOnly;
  final bool hide;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool disableShadow;
  final bool autofocus;
  final bool obscureText;
  final bool disabled;
  final double? height;
  final num? numLimit;
  final List<Widget> actions;
  final FocusNode? focusNode;
  final Border? border;
  final Color backgroundColor;
  final TextStyle? labelStyleOnDisabled;
  final BoxShadow? shadow;
  final double? borderRadius;
  final BorderRadius? borderRadiusI;
  final Widget? leadingIcon;

  RoundedTextField({
    this.key,
    required this.value,
    this.inputTextStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    this.hintText,
    this.hintTextStyle = const TextStyle(
      fontWeight: FontWeight.w400,
    ),
    this.labelText,
    this.backgroundColor = Colors.white,
    this.onChange,
    this.autofocus = false,
    this.controller,
    this.disableShadow = false,
    this.validator,
    this.decoration = const InputDecoration(),
    this.borderRadiusI,
    this.inputFormatters,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.actions = const <Widget>[],
    this.keyboardType,
    this.readOnly = false,
    this.hide = false,
    this.obscureText = false,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.onSubmitted,
    this.height,
    this.numLimit,
    this.disabled = false,
    this.focusNode,
    this.border,
    this.labelStyleOnDisabled,
    this.shadow,
    this.borderRadius,
    this.prefixIcon,
    this.leadingIcon,
  }) : super(key: key);

  @override
  _RoundedTextFieldState createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  TextEditingController? _controller;

  TextEditingController? get _effectiveController =>
      widget.controller ?? _controller;

  @override
  void initState() {
    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.value);
    }

    super.initState();
    _effectiveController!.addListener(_handleControllerChanged);
  }

  @override
  void dispose() {
    _effectiveController!.dispose();
    super.dispose();
  }

  void _handleControllerChanged() {
    if (_effectiveController!.text.isEmpty && widget.value == null) {
      return;
    } else if (_effectiveController!.text != widget.value) {
      widget.onChange!(_effectiveController!.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    _effectiveController!.value = TextEditingValue(
        text: widget.value ?? '',
        selection: (widget.value ?? '').length >
            (_effectiveController?.text ?? '').length
            ? TextSelection.fromPosition(
            TextPosition(offset: (widget.value ?? '').length))
            : _effectiveController!.selection);

    return FormField<String>(
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      initialValue: _effectiveController!.text,
      onSaved: (value) {
        widget.onChange!(_effectiveController!.text);
      },
      builder: (state) {
        final textInputWidget = Container(
          height: widget.height ?? null,
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
          ),
          child: ClipRRect(
            borderRadius:
            BorderRadius.all(Radius.circular(widget.borderRadius ?? 16)),
            child: Center(
              child: Stack(
                children: [
                  TextField(
                    focusNode: widget.focusNode,
                    enabled: !widget.disabled,
                    maxLength: widget.maxLength,
                    controller: _effectiveController,
                    readOnly: widget.readOnly,
                    obscureText: widget.obscureText,
                    keyboardType: widget.keyboardType,
                    minLines: widget.minLines,
                    maxLines: widget.maxLines,
                    autofocus: widget.autofocus,
                    style: widget.inputTextStyle,
                    decoration: widget.decoration.copyWith(
                        counterText: '',
                        isDense: true,
                        fillColor: Colors.transparent,
                        hintText: widget.hintText,
                        hintStyle: widget.hintTextStyle,
                        border: widget.decoration.border ?? InputBorder.none,
                        focusedBorder:
                        widget.decoration.focusedBorder ?? InputBorder.none,
                        contentPadding: widget.decoration.contentPadding != null
                            ? widget.decoration.contentPadding
                            : EdgeInsets.symmetric(
                            vertical: 14, horizontal: 16),
                        errorText: null,
                        errorStyle: TextStyle(color: Colors.transparent),
                        errorBorder:
                        widget.decoration.errorBorder ?? InputBorder.none,
                        focusedErrorBorder:
                        widget.decoration.focusedErrorBorder ??
                            InputBorder.none,
                        disabledBorder: widget.decoration.disabledBorder ??
                            InputBorder.none,
                        enabledBorder:
                        widget.decoration.enabledBorder ?? InputBorder.none,
                        labelText: widget.labelText,
                        helperText: null,
                        prefixIcon: widget.prefixIcon,
                        suffixIcon: widget.decoration.suffixIcon),
                    inputFormatters: widget.inputFormatters,
                    onChanged: (value) {
                      state.didChange(value);
                      _handleControllerChanged();
                    },
                    onSubmitted: widget.onSubmitted,
                  ),
                  if (widget.leadingIcon != null)
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 20,
                      child: widget.leadingIcon!,
                    ),
                ],
              ),
            ),
          ),
        );

        if (widget.hide) {
          return SizedBox();
        }
        if (widget.actions.isNotEmpty) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                      child: textInputWidget,
                    ),
                    if (state.hasError)
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, top: 8.0),
                        child: Text(
                          state.errorText!,
                        ),
                      ),
                  ],
                ),
              ),
              ...widget.actions
                  .map(
                    (action) => Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),

                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: action,
                        ),
                      ),
                    ),
                  ],
                ),
              )
                  .toList()
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textInputWidget,
            if (state.hasError)
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  state.errorText!,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat'),
                ),
              ),
          ],
        );
      },
    );
  }
}
