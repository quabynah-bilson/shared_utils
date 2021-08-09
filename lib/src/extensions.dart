library shared_utils;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_utils/shared_utils.dart';
import 'package:simple_animations/simple_animations.dart';

import 'colors.dart';
import 'spacing.dart';
import 'config.dart';

/// extensions on any [Widget]
extension WidgetX on Widget {
  Widget fillMaxHeight([double ratio = 1.0]) =>
      SizedBox(height: SizeConfig.kDeviceHeight * ratio, child: this);

  Widget fillMaxWidth([double ratio = 1.0]) =>
      SizedBox(width: SizeConfig.kDeviceWidth * ratio, child: this);

  Widget fillMaxSize([double ratio = 1.0]) => SizedBox(
        height: SizeConfig.kDeviceHeight * ratio,
        width: SizeConfig.kDeviceWidth * ratio,
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
      InkWell(
        onTap: onTap,
        borderRadius: radius,
        splashColor: color,
        child: this,
      );

  Widget hero({required String tag}) => Hero(tag: tag, child: this);

  Widget withIndicator(BuildContext context,
          {bool show = true, bool left = false}) =>
      DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .primary
                  .withOpacity(kEmphasisMedium),
              style: show && !left ? BorderStyle.solid : BorderStyle.none,
              width: kSpacingX4,
            ),
            left: BorderSide(
              color: Theme.of(context)
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
    var kTheme = Theme.of(context);

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
  Widget h4(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        style: Theme.of(context).textTheme.headline4?.copyWith(
            fontWeight:
                weight ?? Theme.of(context).textTheme.headline4?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget h5(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        style: Theme.of(context).textTheme.headline5?.copyWith(
            fontWeight:
                weight ?? Theme.of(context).textTheme.headline5?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget h6(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        style: Theme.of(context).textTheme.headline6?.copyWith(
            fontWeight:
                weight ?? Theme.of(context).textTheme.headline6?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget bodyText1(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
            fontWeight:
                weight ?? Theme.of(context).textTheme.bodyText1?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget bodyText2(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
            fontWeight:
                weight ?? Theme.of(context).textTheme.bodyText2?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget subtitle1(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
            fontWeight:
                weight ?? Theme.of(context).textTheme.subtitle1?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget subtitle2(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        style: Theme.of(context).textTheme.subtitle2?.copyWith(
            fontWeight:
                weight ?? Theme.of(context).textTheme.subtitle2?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget caption(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        style: Theme.of(context).textTheme.caption?.copyWith(
            fontWeight:
                weight ?? Theme.of(context).textTheme.caption?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget overline(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        style: Theme.of(context).textTheme.overline?.copyWith(
            fontWeight:
                weight ?? Theme.of(context).textTheme.overline?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );
  Widget button(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        style: Theme.of(context).textTheme.button?.copyWith(
            fontWeight:
                weight ?? Theme.of(context).textTheme.button?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(emphasis)),
      );

  Widget asSvg({
    double? size,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
  }) {
    assert(size != null || (height != null && width != null));

    return SvgPicture.asset(
      this ?? '',
      height: size ?? height,
      width: size ?? width,
      fit: fit,
      placeholderBuilder: (_) => SizedBox.shrink(),
    );
  }

  Widget asAssetImage({
    double? size,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
  }) {
    assert(size != null || (height != null && width != null));
    return Image.asset(
      this ?? '',
      height: size ?? height,
      width: size ?? width,
      fit: fit,
    );
  }

  Widget asNetworkImage({
    double? size,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
  }) {
    assert(size != null || (height != null && width != null));
    return CachedNetworkImage(
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
  }

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
    assert(this != null);
    return this!
        .split(' ')
        .map((str) => '${str[0].toUpperCase()}${str.substring(1)}')
        .join(' ');
  }

  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

/// extensions on [BuildContext]
extension ContextX on BuildContext {
  /// navigator state
  NavigatorState get navigator => Navigator.of(this);

  /// screen dimensions
  ///
  /// Must have called `SizeConfig().init(context)` already
  /// in the initial widget (possible splash screen)
  double get width => SizeConfig.kDeviceWidth;
  double get height => SizeConfig.kDeviceHeight;

  /// shows a [SnackBar]
  void showSnackBar(String message, [Color? background, Color? foreground]) {
    var messenger = ScaffoldMessenger.of(this);
    messenger
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: Theme.of(this).textTheme.bodyText1?.copyWith(
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
