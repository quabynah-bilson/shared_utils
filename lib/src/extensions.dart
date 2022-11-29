library shared_utils;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_utils/shared_utils.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

/// extensions on any [Widget]
extension WidgetX on Widget {
  Widget fillMaxHeight(BuildContext context, [double ratio = 1.0]) =>
      SizedBox(height: context.height * ratio, child: this);

  Widget fillMaxWidth(BuildContext context, [double ratio = 1.0]) =>
      SizedBox(width: context.width * ratio, child: this);

  Widget fillMaxSize(BuildContext context, [double ratio = 1.0]) => SizedBox(
        height: context.height * ratio,
        width: context.width * ratio,
        child: this,
      );

  Widget horizontal(double spacing) => Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing),
        child: this,
      );

  Widget vertical(double spacing) => Padding(
        padding: EdgeInsets.symmetric(vertical: spacing),
        child: this,
      );

  Widget bottom(double spacing) => Padding(
        padding: EdgeInsets.only(bottom: spacing),
        child: this,
      );

  Widget top(double spacing) => Padding(
        padding: EdgeInsets.only(top: spacing),
        child: this,
      );

  Widget left(double spacing) => Padding(
        padding: EdgeInsets.only(left: spacing),
        child: this,
      );

  Widget right(double spacing) => Padding(
        padding: EdgeInsets.only(right: spacing),
        child: this,
      );

  Widget clickable({
    required Function() onTap,
    BorderRadius? radius,
    Color? color,
  }) =>
      GestureDetector(onTap: onTap, child: this);

  Widget hero({required String tag}) => Hero(tag: tag, child: this);

  Widget withIndicator(BuildContext context,
          {bool show = true, bool left = false}) =>
      DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: context.theme
                  .colorScheme
                  .primary
                  .withOpacity(kEmphasisMedium),
              style: show && !left ? BorderStyle.solid : BorderStyle.none,
              width: kSpacingX4,
            ),
            left: BorderSide(
              color: context.theme
                  .colorScheme
                  .primary
                  .withOpacity(kEmphasisMedium),
              style: show && left ? BorderStyle.solid : BorderStyle.none,
              width: kSpacingX4,
            ),
          ),
        ),
        child: this,
      );

  Widget circularClip(radius) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        clipBehavior: Clip.hardEdge,
        child: this,
      );

  Widget withBadge(
    BuildContext context, {
    bool showAsIndicator = true,
    int count = 0,
  }) {
    var kTheme = context.theme;

    /// show badge only when count > 0 or showAsIndicator is true
    var showBadge = showAsIndicator || count > 0;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        /// widget itself
        Positioned.fill(child: this),

        if (showBadge) ...{
          Positioned(
            child: Container(
              width: count > 0 ? kSpacingX16 : kSpacingX12,
              height: count > 0 ? kSpacingX16 : kSpacingX12,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: kTheme.colorScheme.error,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: showAsIndicator
                  ? null
                  : '${count > 99 ? '99+' : count}'.overline(
                      context,
                      color: kTheme.colorScheme.onError,
                    ),
            ),
          ),
        }
      ],
    );
  }

  Widget align(Alignment alignment) => Align(alignment: alignment, child: this);

  Widget centered() => Center(child: this);

// Widget withFadeAnimation({double delay = 1200}) {
//   final tween = MultiTrackTween([
//     Track('opacity')
//         .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
//     Track('translateY').add(
//         Duration(milliseconds: 500), Tween(begin: -130.0, end: 0.0),
//         curve: Curves.easeOut)
//   ]);

//   return ControlledAnimation(
//     delay: Duration(milliseconds: (500 * delay).round()),
//     duration: tween.duration,
//     tween: tween,
//     child: this,
//     builderWithChild: (context, child, animation) => Opacity(
//       opacity: animation['opacity'],
//       child: Transform.translate(
//           offset: Offset(0, animation['translateY']), child: child),
//     ),
//   );
// }
}

extension IconX on Icon {
  Icon opacity(double emphasis) => Icon(
        icon,
        size: size,
        color:
            color?.withOpacity(emphasis) ?? kBlackColor.withOpacity(emphasis),
        semanticLabel: semanticLabel,
        textDirection: textDirection,
      );
}

/// extensions on any [String]
///
/// converts a [String] to a [Text][Widget]
extension TextX on String? {
  Widget h1(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.theme.textTheme.headline1?.copyWith(
            letterSpacing: spacing,
            fontWeight:
                weight ?? context.theme.textTheme.headline1?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.theme
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget h2(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.theme.textTheme.headline2?.copyWith(
            letterSpacing: spacing,
            fontWeight:
                weight ?? context.theme.textTheme.headline2?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.theme
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget h3(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.theme.textTheme.headline3?.copyWith(
            letterSpacing: spacing,
            fontWeight:
                weight ?? context.theme.textTheme.headline3?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.theme
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget h4(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.theme.textTheme.headline4?.copyWith(
            letterSpacing: spacing,
            fontWeight:
                weight ?? context.theme.textTheme.headline4?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.theme
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget h5(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.theme.textTheme.headline5?.copyWith(
            letterSpacing: spacing,
            fontWeight:
                weight ?? context.theme.textTheme.headline5?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.theme
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget h6(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.theme.textTheme.headline6?.copyWith(
            letterSpacing: spacing,
            fontWeight:
                weight ?? context.theme.textTheme.headline6?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.theme
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget bodyText1(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.theme.textTheme.bodyText1?.copyWith(
            letterSpacing: spacing,
            fontWeight:
                weight ?? context.theme.textTheme.bodyText1?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.theme
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget bodyText2(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.theme.textTheme.bodyText2?.copyWith(
            letterSpacing: spacing,
            fontWeight:
                weight ?? context.theme.textTheme.bodyText2?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.theme
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget subtitle1(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.theme.textTheme.subtitle1?.copyWith(
            letterSpacing: spacing,
            fontWeight:
                weight ?? context.theme.textTheme.subtitle1?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.theme
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget subtitle2(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.theme.textTheme.subtitle2?.copyWith(
            letterSpacing: spacing,
            fontWeight:
                weight ?? context.theme.textTheme.subtitle2?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.theme
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget caption(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.theme.textTheme.caption?.copyWith(
            letterSpacing: spacing,
            fontWeight:
                weight ?? context.theme.textTheme.caption?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.theme
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget overline(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.theme.textTheme.overline?.copyWith(
            letterSpacing: spacing,
            fontWeight:
                weight ?? context.theme.textTheme.overline?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.theme
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget button(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.theme.textTheme.button?.copyWith(
            letterSpacing: spacing,
            fontWeight:
                weight ?? context.theme.textTheme.button?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.theme
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget asSvg({
    double? size,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
  }) =>
      SvgPicture.asset(
        this ?? '',
        height: size ?? height,
        width: size ?? width,
        fit: fit,
        placeholderBuilder: (_) => SizedBox.shrink(),
      );

  Widget asAssetImage({
    double? size,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
  }) =>
      Image.asset(
        this ?? '',
        height: size ?? height,
        width: size ?? width,
        fit: fit,
      );

  Widget asNetworkImage({
    double? size,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
  }) =>
      isNullOrEmpty()
          ? Container(
              decoration: BoxDecoration(color: kPlaceholderColor),
              height: size ?? height,
              width: size ?? width,
            )
          : CachedNetworkImage(
              imageUrl: this ?? '',
              height: size ?? height,
              width: size ?? width,
              fit: fit,
              placeholder: (_, __) => Container(
                decoration: BoxDecoration(
                  color: kPlaceholderColor,
                ),
                height: size ?? height,
                width: size ?? width,
              ),
              errorWidget: (_, __, ___) => Container(
                decoration: BoxDecoration(
                  color: kPlaceholderColor,
                ),
                height: size ?? height,
                width: size ?? width,
              ),
            );

  Widget avatar({
    required double size,
    bool fromAsset = false,
    bool circular = false,
    BoxFit fit = BoxFit.cover,
  }) =>
      fromAsset
          ? asAssetImage(size: size, fit: fit)
              .circularClip(circular ? size : size / 4)
          : asNetworkImage(size: size, fit: fit)
              .circularClip(circular ? size : size / 4);

  String capitalize() {
    return isNullOrEmpty()
        ? ''
        : this!
            .split(' ')
            .map((str) =>
                '${str[0].toUpperCase()}${str.substring(1).toLowerCase()}')
            .join(' ');
  }

  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

/// actions for dialogs
class DialogAction {
  final String label;
  final Function()? onTap;

  const DialogAction({required this.label, this.onTap});
}

/// extensions on [BuildContext]
extension ContextX on BuildContext {
  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  bool get isMobile => width < 650;

  bool get isTablet => width >= 650 && width < 1080;

  bool get isDesktop => width >= 1080;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Brightness get invertedThemeBrightness =>
      theme.brightness == Brightness.light ? Brightness.dark : Brightness.light;

  Future<void> showCustomDialog({
    required String headerIconAsset,
    required String message,
    List<DialogAction> actions = const <DialogAction>[],
    bool showDismissButton = true,
    String negativeButtonText = 'Okay',
    double iconSize = 56,
  }) async =>
      await showSlidingBottomSheet(this, builder: (context) {
        return SlidingSheetDialog(
          elevation: 8,
          cornerRadius: 16,
          color: colorScheme.surface,
          duration: kSidebarFooterDuration,
          dismissOnBackdropTap: false,
          snapSpec: const SnapSpec(
            snap: true,
            snappings: [0.4, 0.7, 1.0],
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          headerBuilder: (context, _) => Material(
            color: colorScheme.surface,
            child: headerIconAsset
                .asAssetImage(size: iconSize, fit: BoxFit.fitHeight)
                .vertical(8),
          ).fillMaxWidth(context),
          builder: (context, state) {
            return Material(
              color: colorScheme.surface,
              child: SafeArea(
                top: false,
                child: AnimatedColumn(
                  animateType: AnimateType.slideUp,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    message
                        .subtitle1(
                          context,
                          alignment: TextAlign.center,
                          color: colorScheme.onSurface,
                        )
                        .centered(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize:
                          actions.isEmpty ? MainAxisSize.min : MainAxisSize.max,
                      children: [
                        if (showDismissButton) ...{
                          Expanded(
                            child: AppRoundedButton(
                              text: negativeButtonText,
                              onTap: () => Navigator.pop(this),
                              outlined: true,
                            ).right(actions.isEmpty ? 0 : 12),
                          ),
                        },
                        ...actions
                            .map(
                              (e) => AppRoundedButton(
                                      onTap: () {
                                        Navigator.pop(this);
                                        if (e.onTap != null) e.onTap!();
                                      },
                                      text: e.label).horizontal(8)
                                  .centered(),
                            )
                            .toList(),
                      ],
                    ).centered().top(16),
                  ],
                ).horizontal(24).vertical(12),
              ),
            );
          },
        );
      });

  /// shows a [SnackBar]
  void showSnackBar(String message, [Color? background, Color? foreground]) {
    var messenger = ScaffoldMessenger.of(this);
    messenger
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: Theme.of(this).textTheme.bodyText2?.copyWith(
                  color: foreground ?? Theme.of(this).colorScheme.onPrimary,
                ),
          ),
          backgroundColor: background ?? Theme.of(this).colorScheme.primary,
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'Dismiss',
            textColor: foreground ?? Theme.of(this).colorScheme.onPrimary,
            onPressed: () => messenger.hideCurrentSnackBar(),
          ),
        ),
      );
  }
}

/// called in initState
void doAfterDelay(Function() block) =>
    Future.delayed(const Duration()).then((value) => block());

/// UI overlay
void kUseDefaultOverlays(
  BuildContext context, {
  Color? statusBarColor,
  Color? navigationBarColor,
  Brightness statusBarIconBrightness = Brightness.dark,
  Brightness statusBarBrightness = Brightness.dark,
  Brightness navigationBarIconBrightness = Brightness.dark,
}) =>
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: statusBarColor ?? context.colorScheme.background,
        systemNavigationBarColor:
            navigationBarColor ?? context.colorScheme.background,
        statusBarIconBrightness: statusBarIconBrightness,
        systemNavigationBarDividerColor:
            navigationBarColor ?? context.colorScheme.background,
        systemNavigationBarIconBrightness: navigationBarIconBrightness,
        statusBarBrightness: statusBarBrightness,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarContrastEnforced: false,
      ),
    );
