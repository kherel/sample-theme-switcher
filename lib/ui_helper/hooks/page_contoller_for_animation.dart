import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

PageController usePageControllerForAnimation(){
  return Hook.use(_PageControllerForAnimationHook());
}

class _PageControllerForAnimationHook extends Hook<PageController>{
  @override
  _PageControllerForAnimationHookState createState()=>_PageControllerForAnimationHookState();
}

class _PageControllerForAnimationHookState extends HookState<PageController,_PageControllerForAnimationHook>{
  PageController _pageController;

  @override
  void initHook() {
    _pageController = PageController(initialPage: 1);
  }
  @override
  PageController build(BuildContext context) =>_pageController;

  @override
  void dispose() {
    _pageController.dispose();
  }
}