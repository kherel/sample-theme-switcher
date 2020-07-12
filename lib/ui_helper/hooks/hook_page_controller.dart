import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

PageController useHookPageController(int index){
  return Hook.use(_PageController(index:index));
}

class _PageController extends Hook<PageController> {
  final int _index;
  const _PageController({@required int index}): _index = index;

  @override
  _PageControllerState createState()=>_PageControllerState();
}

class _PageControllerState extends HookState<PageController,_PageController> {
  PageController _pageController;

  @override
  void initHook() {
    _pageController = PageController(initialPage: 0,keepPage: false);
  }
  @override
  PageController build(BuildContext context) =>_pageController;

  @override
  void dispose() {
    _pageController.dispose();
  }
}