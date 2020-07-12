import 'package:avatar_glow/avatar_glow.dart';
import 'package:application/core/app_theme.dart';
import 'package:application/ui_helper/widgets/fade.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  //final User user;
  final String imageUrl;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;
  final bool isLarge;
  final bool isShowingUsernameLabel;
  final bool isCurrentUserStory;
  final bool useGlowAnimation;
  final Widget labelWidget;

  const AvatarWidget({
    //@required this.user,
    this.imageUrl,
    this.onTap,
    this.padding = const EdgeInsets.fromLTRB(5.0,5.0,0.0,5.0),
    this.isLarge = false,
    this.isShowingUsernameLabel = false,
    this.isCurrentUserStory = false,
    this.useGlowAnimation = false,
    this.labelWidget,
  });

  static const _gradientBorderDecoration = BoxDecoration(
    shape: BoxShape.circle,
    // https://brandpalettes.com/instagram-color-codes/
    gradient: SweepGradient(
      colors: [
        Color(0xFF833AB4), // Purple
        Color(0xFFF77737), // Orange
        Color(0xFFE1306C), // Red-pink
        Color(0xFFC13584), // Red-purple
      ],
    ),
  );
  static const _whiteBorderDecoration = BoxDecoration(
    shape: BoxShape.circle,
    border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 3.0)),
  );
  static const _greyBoxShadowDecoration = BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1.0, spreadRadius: 1.0)],
  );

  @override
  Widget build(BuildContext context) {
    final radius = isLarge ? 26.0 : 16.0;
    final avatar = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: isShowingUsernameLabel ? 5.0 : 0.0),
          height: radius * 2 + 9.0,
          width: radius * 2 + 9.0,
          decoration: /*user.stories.isEmpty ? null :*/ _gradientBorderDecoration,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                decoration: _whiteBorderDecoration,
                child: Container(
                    decoration: _greyBoxShadowDecoration,
                    child: useGlowAnimation
                        ? AvatarGlow(
                      startDelay: const Duration(milliseconds: 1000),
                      glowColor: Colors.white,
                      endRadius: 40.0,
                      duration: const Duration(milliseconds: 2000),
                      repeat: true,
                      showTwoGlows: true,
                      repeatPauseDuration: const Duration(milliseconds: 100),
                      child: CircleAvatar(
                        radius: radius,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(/*user.*/ imageUrl.toString()),
                      ),
                    )
                        : CircleAvatar(
                      radius: radius,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(/*user.*/ imageUrl.toString()),
                    )),
              ),
            ],
          ),
        ),
        if (isShowingUsernameLabel)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: labelWidget,
          ),
      ],
    );

    return Padding(
      padding: padding,
      child: GestureDetector(onTap: onTap, child: avatar),
    );
  }
}
