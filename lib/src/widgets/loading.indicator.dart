import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_utils/shared_utils.dart';


/// loading indicator with some sort of animation
class LoadingIndicator extends StatefulWidget {
  final Color? color;
  final Color? foregroundColor;
  final bool isLoading;
  final Widget child;
  final String message;
  final String lottieAnimResource;

  const LoadingIndicator({
    Key? key,
    required this.child,
    this.color,
    this.foregroundColor,
    this.isLoading = false,
    this.message = 'Please wait',
    this.lottieAnimResource = kDefaultLottieLoadingAnim,
  }) : super(key: key);

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with TickerProviderStateMixin {
  late var _overlayVisible = widget.isLoading;
  late final AnimationController _controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 300));
  late final Animation<double> _animation =
      Tween(begin: 0.0, end: 1.0).animate(_controller);

  @override
  void initState() {
    super.initState();
    doAfterDelay(() {
      _animation.addStatusListener((status) {
        status == AnimationStatus.forward
            ? setState(() => _overlayVisible = true)
            : null;
        status == AnimationStatus.dismissed
            ? setState(() => _overlayVisible = false)
            : null;
      });
      if (widget.isLoading) _controller.forward();
    });
  }

  @override
  void didUpdateWidget(LoadingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isLoading && widget.isLoading) {
      _controller.forward();
    }

    if (oldWidget.isLoading && !widget.isLoading) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// underlying UI
        Positioned.fill(child: widget.child),

        /// loading indicator semi-opaque background
        if (_overlayVisible) ...{
          FadeTransition(
            opacity: _animation,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Opacity(
                    opacity: kEmphasisHighest,
                    child: ModalBarrier(
                      dismissible: false,
                      color: (widget.color ?? context.colorScheme.surface)
                          .withOpacity(kEmphasisMedium),
                    ),
                  ),
                ),

                /// loading indicator
                Positioned.fill(
                  child: LoadingIndicatorItem(
                    message: widget.message,
                    foregroundColor: widget.foregroundColor,
                    loadingAnimationUrl: widget.lottieAnimResource,
                  ).centered(),
                ),
              ],
            ),
          ),
        },
      ],
    );
  }
}

class LoadingIndicatorItem extends StatelessWidget {
  final Color? foregroundColor;
  final String message;
  final String loadingAnimationUrl;

  const LoadingIndicatorItem({
    Key? key,
    required this.message,
    this.foregroundColor,
    this.loadingAnimationUrl = kDefaultLottieLoadingAnim,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedColumn(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          LottieBuilder.network(
            loadingAnimationUrl,
            width: context.width,
            height: context.height * 0.25,
            animate: true,
          ).align(Alignment.center),
          message
              .subtitle1(context,
                  color: foregroundColor ?? context.colorScheme.onBackground,
                  alignment: TextAlign.center)
              .top(context.height * 0.1),
        ],
      );
}
