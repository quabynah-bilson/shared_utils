import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:shared_utils/shared_utils.dart';

enum AppTextFieldType {
  regular,
  phone,
  password,
  select,
  currency,
  card,
  cardMonthAndYear,
  cardCvv
}

class AppTextField extends StatefulWidget {
  final String label;
  final bool readOnly;
  final bool showCurrency;
  final String? initialValue;
  final Function()? onTap;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;
  final Function(String?)? onSave;
  final AppTextFieldType textFieldType;
  final Widget? suffixIcon;
  final bool autofocus;
  final bool enabled;
  final FocusNode? focusNode;
  final String tag;
  final Function()? onPrefixIconTapped;
  final String? prefixIconUrl;
  final double bottom;
  final TextInputType inputType;
  final TextInputAction action;
  final TextCapitalization capitalization;
  final int? maxLength;
  final int? maxLines;
  final Widget? prefixIcon;
  final Color? background;
  final Color? foreground;
  final List<TextInputFormatter> formatters;
  final bool allowSpecialCharacters;

  const AppTextField(
    this.label, {
    Key? key,
    this.initialValue,
    this.controller,
    this.onTap,
    this.focusNode,
    this.suffixIcon,
    this.onPrefixIconTapped,
    this.prefixIconUrl,
    this.onChange,
    this.onSave,
    this.maxLength,
    this.maxLines,
    this.readOnly = false,
    this.autofocus = false,
    this.showCurrency = false,
    this.enabled = true,
    this.textFieldType = AppTextFieldType.regular,
    this.tag = '',
    this.validator,
    this.bottom = 16,
    this.inputType = TextInputType.text,
    this.action = TextInputAction.done,
    this.capitalization = TextCapitalization.none,
    this.background,
    this.foreground,
    this.prefixIcon,
    this.formatters = const [],
    this.allowSpecialCharacters = false,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;
  final radius = 40.0;

  @override
  Widget build(BuildContext context) {
    switch (widget.textFieldType) {
      case AppTextFieldType.phone:
        return _phoneTextField();
      case AppTextFieldType.password:
        return _passwordTextField();
      case AppTextFieldType.select:
        return _selectTextField();
      case AppTextFieldType.currency:
        return _currencyTextField();
      case AppTextFieldType.card:
        return _cardTextField();
      case AppTextFieldType.cardCvv:
        return _cardCvvTextField();
      case AppTextFieldType.cardMonthAndYear:
        return _cardMonthAndYearTextField();
      default:
        return _regularTextField();
    }
  }

  Widget _cardTextField() => TextFormField(
        style: TextStyle(
            color: widget.foreground ?? context.colorScheme.onSurface),
        maxLength: widget.maxLength,
        controller: widget.controller,
        keyboardType: TextInputType.number,
        initialValue: widget.initialValue,
        readOnly: widget.readOnly,
        textCapitalization: widget.capitalization,
        onTap: widget.onTap,
        validator: widget.validator,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        onSaved: widget.onSave,
        onChanged: widget.onChange,
        textInputAction: widget.action,
        enabled: widget.enabled,
        // textAlign: TextAlign.center,
        inputFormatters: [
          CreditCardNumberInputFormatter(),
          if (!widget.allowSpecialCharacters) ...{
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          },
          ...widget.formatters,
        ],
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(radius),
            ),
            counter: const SizedBox.shrink(),
            // border: InputBorder.none,
            labelStyle: TextStyle(
                color: widget.foreground ?? context.colorScheme.onSurface),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            alignLabelWithHint: true,
            hintText: widget.label.toString().contains('Account Number')
                ? '#### #### #### ####'
                : widget.label.toString().contains('CVC')
                    ? '***'
                    : 'mm/yy',
            filled: true,
            fillColor: widget.background ??
                context.theme.disabledColor.withOpacity(0.3),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.colorScheme.primary),
              borderRadius: BorderRadius.circular(radius),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(radius),
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon),
      ).bottom(widget.bottom);

  Widget _cardMonthAndYearTextField() => TextFormField(
        style: TextStyle(
            color: widget.foreground ?? context.colorScheme.onSurface),
        maxLength: widget.maxLength,
        controller: widget.controller,
        keyboardType: TextInputType.number,
        initialValue: widget.initialValue,
        readOnly: widget.readOnly,
        textCapitalization: widget.capitalization,
        onTap: widget.onTap,
        validator: widget.validator,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        onSaved: widget.onSave,
        onChanged: widget.onChange,
        textInputAction: widget.action,
        enabled: widget.enabled,
        // textAlign: TextAlign.center,
        inputFormatters: [
          CreditCardExpirationDateFormatter(),
          if (!widget.allowSpecialCharacters) ...{
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          },
          ...widget.formatters,
        ],
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(radius),
            ),
            counter: const SizedBox.shrink(),
            // border: InputBorder.none,
            labelStyle: TextStyle(
                color: widget.foreground ?? context.colorScheme.onSurface),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            alignLabelWithHint: true,
            hintText: 'mm/yy',
            filled: true,
            fillColor: widget.background ??
                context.theme.disabledColor.withOpacity(0.3),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.colorScheme.primary),
              borderRadius: BorderRadius.circular(radius),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(radius),
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon),
      ).bottom(widget.bottom);

  Widget _cardCvvTextField() => TextFormField(
        style: TextStyle(
            color: widget.foreground ?? context.colorScheme.onSurface),
        maxLength: widget.maxLength,
        controller: widget.controller,
        keyboardType: TextInputType.number,
        obscureText: true,
        initialValue: widget.initialValue,
        readOnly: widget.readOnly,
        textCapitalization: widget.capitalization,
        onTap: widget.onTap,
        validator: widget.validator,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        onSaved: widget.onSave,
        onChanged: widget.onChange,
        textInputAction: widget.action,
        enabled: widget.enabled,
        // textAlign: TextAlign.center,
        inputFormatters: [
          CreditCardCvcInputFormatter(),
          if (!widget.allowSpecialCharacters) ...{
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          },
          ...widget.formatters,
        ],
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(radius),
            ),
            counter: const SizedBox.shrink(),
            // border: InputBorder.none,
            labelStyle: TextStyle(
                color: widget.foreground ?? context.colorScheme.onSurface),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            alignLabelWithHint: true,
            hintText: '***',
            filled: true,
            fillColor: widget.background ??
                context.theme.disabledColor.withOpacity(0.3),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.colorScheme.primary),
              borderRadius: BorderRadius.circular(radius),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(radius),
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon),
      ).bottom(widget.bottom);

  Widget _currencyTextField() => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
              style: TextStyle(
                  color: widget.foreground ?? context.colorScheme.onSurface),
              maxLength: widget.maxLength,
              controller: widget.controller,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              initialValue: widget.initialValue,
              textCapitalization: widget.capitalization,
              readOnly: widget.readOnly,
              onTap: widget.onTap,
              validator: widget.validator,
              autofocus: widget.autofocus,
              focusNode: widget.focusNode,
              onSaved: widget.onSave,
              onChanged: widget.onChange,
              textInputAction: widget.action,
              enabled: widget.enabled,
              inputFormatters: [
                CurrencyInputFormatter(),
                if (!widget.allowSpecialCharacters) ...{
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                },
                ...widget.formatters,
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(radius),
                ),
                counter: const SizedBox.shrink(),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                alignLabelWithHint: true,
                hintText: widget.label,
                labelStyle: TextStyle(
                    color: widget.foreground ?? context.colorScheme.onSurface),
                filled: true,
                fillColor: widget.background ??
                    context.theme.disabledColor.withOpacity(0.3),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: context.colorScheme.primary),
                  borderRadius: BorderRadius.circular(radius),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(radius),
                ),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
              ))
        ],
      ).bottom(widget.bottom);

  Widget _selectTextField() => TextFormField(
        style: TextStyle(
            color: widget.foreground ?? context.colorScheme.onSurface),
        maxLength: widget.maxLength,
        controller: widget.controller,
        keyboardType: widget.inputType,
        initialValue: widget.initialValue,
        textCapitalization: widget.capitalization,
        readOnly: true,
        onTap: widget.onTap,
        validator: widget.validator,
        onSaved: widget.onSave,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        onChanged: widget.onChange,
        textInputAction: widget.action,
        enabled: widget.enabled,
        maxLines: widget.maxLines,
        inputFormatters: [
          if (!widget.allowSpecialCharacters) ...{
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          },
          ...widget.formatters,
        ],
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius),
          ),
          counter: const SizedBox.shrink(),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          alignLabelWithHint: true,
          hintText: widget.label,
          labelStyle: TextStyle(
              color: widget.foreground ?? context.colorScheme.onSurface),
          filled: true,
          fillColor:
              widget.background ?? context.theme.disabledColor.withOpacity(0.3),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.colorScheme.primary),
            borderRadius: BorderRadius.circular(radius),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: widget.background ??
                    context.theme.disabledColor.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(radius),
          ),
          suffixIcon: const Icon(Icons.arrow_drop_down_circle_outlined),
          prefixIcon: widget.prefixIconUrl.isNullOrEmpty()
              ? null
              : SizedBox(
                  height: 30,
                  child: InkWell(
                      onTap: widget.onPrefixIconTapped ?? () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          widget.prefixIconUrl
                              .asNetworkImage(
                                size: 20,
                                fit: BoxFit.contain,
                              )
                              .left(10),
                        ],
                      )),
                ),
        ),
      ).bottom(widget.bottom);

  Widget _regularTextField() => TextFormField(
        style: TextStyle(
            color: widget.foreground ?? context.colorScheme.onSurface),
        maxLength: widget.maxLength,
        controller: widget.controller,
        keyboardType: widget.inputType,
        initialValue: widget.initialValue,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        validator: widget.validator,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        onSaved: widget.onSave,
        onChanged: widget.onChange,
        textInputAction: widget.action,
        enabled: widget.enabled,
        maxLines: widget.maxLines,
        textCapitalization: widget.capitalization,
        inputFormatters: [
          if (!widget.allowSpecialCharacters) ...{
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          },
          ...widget.formatters,
        ],
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(radius),
            ),
            labelStyle: TextStyle(
                color: widget.foreground ?? context.colorScheme.onSurface),
            counter: const SizedBox.shrink(),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            alignLabelWithHint: true,
            hintText: widget.label,
            filled: true,
            fillColor: widget.background ??
                context.theme.disabledColor.withOpacity(0.3),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.colorScheme.primary),
              borderRadius: BorderRadius.circular(radius),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: widget.background ??
                      context.theme.disabledColor.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(radius),
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon),
      ).bottom(widget.bottom);

  Widget _phoneTextField() => TextFormField(
      style:
          TextStyle(color: widget.foreground ?? context.colorScheme.onSurface),
      maxLength: widget.maxLength,
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      initialValue: widget.initialValue,
      textCapitalization: widget.capitalization,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      validator: widget.validator,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      onSaved: widget.onSave,
      textInputAction: widget.action,
      enabled: widget.enabled,
      onChanged: widget.onChange,
      inputFormatters: [
        PhoneInputFormatter(),
        if (!widget.allowSpecialCharacters) ...{
          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
        },
        ...widget.formatters,
      ],
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(radius),
        ),
        counter: const SizedBox.shrink(),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        alignLabelWithHint: true,
        hintText: widget.label,
        labelStyle: TextStyle(
            color: widget.foreground ?? context.colorScheme.onSurface),
        filled: true,
        fillColor:
            widget.background ?? context.theme.disabledColor.withOpacity(0.3),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.colorScheme.primary),
          borderRadius: BorderRadius.circular(radius),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(radius),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
      )).bottom(widget.bottom);

  Widget _passwordTextField() => TextFormField(
        style: TextStyle(
            color: widget.foreground ?? context.colorScheme.onSurface),
        maxLength: widget.maxLength,
        controller: widget.controller,
        keyboardType: widget.inputType,
        initialValue: widget.initialValue,
        readOnly: widget.readOnly,
        textCapitalization: widget.capitalization,
        onTap: widget.onTap,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        validator: widget.validator,
        onSaved: widget.onSave,
        obscureText: _obscureText,
        enabled: widget.enabled,
        textInputAction: widget.action,
        onChanged: widget.onChange,
        inputFormatters: [
          if (!widget.allowSpecialCharacters) ...{
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          },
          ...widget.formatters,
        ],
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(radius),
            ),
            counter: const SizedBox.shrink(),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            alignLabelWithHint: true,
            hintText: widget.label,
            labelStyle: TextStyle(
                color: widget.foreground ?? context.colorScheme.onSurface),
            filled: true,
            fillColor: widget.background ??
                context.theme.disabledColor.withOpacity(0.3),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.colorScheme.primary),
              borderRadius: BorderRadius.circular(radius),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(radius),
            ),
            suffixIcon: UnconstrainedBox(
              child: IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: _togglePasswordVisibility),
            )),
      ).bottom(widget.bottom);

  void _togglePasswordVisibility() =>
      setState(() => _obscureText = !_obscureText);
}

class AppDropdownField extends StatelessWidget {
  final List<String> values;
  final String? current;
  final String label;
  final void Function(String) onSelected;
  final bool enabled;
  final Color? background;
  final Color? foreground;

  const AppDropdownField({
    Key? key,
    required this.label,
    required this.values,
    required this.onSelected,
    required this.current,
    this.enabled = true,
    this.foreground,
    this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const radius = 40.0;
    return PopupMenuButton(
      itemBuilder: (context) => values
          .map((e) => PopupMenuItem(
                onTap: () => onSelected(e),
                value: e,
                child: e.subtitle1(context),
              ))
          .toList(),
      onSelected: onSelected,
      enableFeedback: true,
      enabled: enabled,
      child: TextFormField(
        style: TextStyle(color: foreground ?? context.colorScheme.onSurface),
        controller: TextEditingController(text: current),
        readOnly: true,
        onTap: null,
        enabled: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius),
          ),
          counter: const SizedBox.shrink(),
          labelText: label,
          labelStyle:
              TextStyle(color: foreground ?? context.colorScheme.onSurface),
          filled: true,
          fillColor: background ?? context.theme.disabledColor.withOpacity(0.3),
          suffixIcon: Icon(
            Icons.arrow_drop_down,
            color: foreground ?? context.colorScheme.onSurface,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.colorScheme.primary),
            borderRadius: BorderRadius.circular(radius),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    ).bottom(16);
  }
}
