import 'package:flutter/material.dart';
import 'package:shared_utils/shared_utils.dart';

enum AppButtonType { primary, secondary }

enum LayoutSize { matchParent, wrapContent, standard }

enum IconLocation { start, end }

/// rounded button
class AppRoundedButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final AppButtonType buttonType;
  final Color? backgroundColor;
  final Color? textColor;
  final double elevation;
  final LayoutSize layoutSize;
  final IconLocation iconLocation;
  final bool enabled;
  final bool outlined;
  final IconData? icon;

  const AppRoundedButton({
    Key? key,
    this.elevation = 5,
    required this.text,
    required this.onTap,
    this.buttonType = AppButtonType.primary,
    this.backgroundColor,
    this.textColor,
    this.layoutSize = LayoutSize.wrapContent,
    this.enabled = true,
    this.outlined = false,
    this.icon,
    this.iconLocation = IconLocation.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.mediaQuery.size;

    var buttonWidth;
    if (layoutSize == LayoutSize.wrapContent) {
      buttonWidth = null;
    } else if (layoutSize == LayoutSize.matchParent) {
      buttonWidth = double.infinity;
    } else if (layoutSize == LayoutSize.standard) {
      buttonWidth = size.width / 1.8;
    }

    final buttonShape =
        (context.theme.buttonTheme.shape as RoundedRectangleBorder)
            .borderRadius;

    final buttonPadding =
        const EdgeInsets.symmetric(horizontal: 24, vertical: 14);

    return SizedBox(
      width: buttonWidth,
      child: outlined
          ? GestureDetector(
              onTap: enabled ? onTap : null,
              child: Container(
                padding: buttonPadding,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: buttonShape,
                  border: Border.all(
                    color: enabled
                        ? backgroundColor ??
                            (buttonType == AppButtonType.primary
                                ? context.colorScheme.primary
                                : context.colorScheme.secondary)
                        : context.theme.disabledColor,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (icon != null && iconLocation == IconLocation.start) ...{
                      Icon(
                        icon,
                        size: context.textTheme.labelLarge!.fontSize! * 1.4,
                        color: enabled
                            ? backgroundColor ??
                                (buttonType == AppButtonType.primary
                                    ? context.colorScheme.primary
                                    : context.colorScheme.secondary)
                            : context.theme.disabledColor,
                      ).right(12),
                    },
                    text.button(
                      context,
                      alignment: TextAlign.center,
                      color: enabled
                          ? backgroundColor ??
                              (buttonType == AppButtonType.primary
                                  ? context.colorScheme.primary
                                  : context.colorScheme.secondary)
                          : context.theme.disabledColor,
                      emphasis: enabled ? kEmphasisHighest : kEmphasisMedium,
                    ),
                    if (icon != null && iconLocation == IconLocation.end) ...{
                      Icon(
                        icon,
                        size: context.textTheme.labelLarge!.fontSize! * 1.4,
                        color: enabled
                            ? backgroundColor ??
                                (buttonType == AppButtonType.primary
                                    ? context.colorScheme.primary
                                    : context.colorScheme.secondary)
                            : context.theme.disabledColor,
                      ).left(12),
                    },
                  ],
                ),
              ),
            )
          : GestureDetector(
              onTap: enabled ? onTap : null,
              child: Material(
                clipBehavior: Clip.hardEdge,
                elevation: enabled ? elevation : 0,
                shape: context.theme.buttonTheme.shape,
                color: enabled
                    ? backgroundColor ??
                        (buttonType == AppButtonType.primary
                            ? context.colorScheme.primary
                            : context.colorScheme.secondary)
                    : context.theme.disabledColor,
                child: Padding(
                  padding: buttonPadding,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (icon != null &&
                          iconLocation == IconLocation.start) ...{
                        Icon(
                          icon,
                          size: context.textTheme.labelLarge!.fontSize! * 1.4,
                          color: enabled
                              ? backgroundColor ??
                                  (buttonType == AppButtonType.primary
                                      ? context.colorScheme.onPrimary
                                      : context.colorScheme.onSecondary)
                              : context.theme.disabledColor,
                        ).right(12),
                      },
                      text.button(
                        context,
                        alignment: TextAlign.center,
                        color: enabled
                            ? backgroundColor ??
                                (buttonType == AppButtonType.primary
                                    ? context.colorScheme.onPrimary
                                    : context.colorScheme.onSecondary)
                            : context.theme.disabledColor,
                        emphasis: enabled ? kEmphasisHighest : kEmphasisMedium,
                      ),
                      if (icon != null && iconLocation == IconLocation.end) ...{
                        Icon(
                          icon,
                          size: context.textTheme.labelLarge!.fontSize! * 1.4,
                          color: enabled
                              ? backgroundColor ??
                                  (buttonType == AppButtonType.primary
                                      ? context.colorScheme.onPrimary
                                      : context.colorScheme.onSecondary)
                              : context.theme.disabledColor,
                        ).left(12),
                      },
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
