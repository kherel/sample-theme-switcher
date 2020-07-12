import 'package:animator/animator.dart';
import 'package:application/ui_helper/dialogs/build_pages_more_options.dart';
import 'package:application/ui_helper/dialogs/comment_dialog/comment.dart';
import 'package:flutter/material.dart'
    show
    showGeneralDialog,
    BuildContext,
    required,
    Colors,
    Align,
    Alignment,
    Tween,
    Offset,
    FractionalTranslation,
    ClipRRect,
    SizedBox,
    EdgeInsets,
    SlideTransition,
    Container,
    BorderRadius,
    Radius,
    BoxDecoration;

void buildPagesPopupMenu(BuildContext context) {
    const bool _fromTop = false;
    showGeneralDialog(
        barrierLabel: "Label",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 500),
        context: context,
        pageBuilder: (context, anim1, anim2) {
            return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 250,
                    margin: const EdgeInsets.only(left: 12, right: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: SizedBox.expand(child: BuildPagesMoreOptions()),
                ),
            );
        },
        transitionBuilder: (context, anim1, anim2, child) {
            return SlideTransition(
                position: Tween<Offset>(begin: const Offset(0, 0.5), end: const Offset(0, 0)).animate(anim1),
                child: child,
            );
        },
    );
}

void showCommentDialog({@required BuildContext context, @required bool fullScreenDialog}) {
    const bool _fromTop = true;
    showGeneralDialog(
        barrierLabel: "Label",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 200),
        context: context,
        pageBuilder: (context, anim1, anim2) {
            return Align(
                alignment: _fromTop ? Alignment.topCenter : Alignment.bottomCenter,
                child: Animator(
                    tweenMap: {
                        //"opacity": Tween<double>(begin: 0.8, end: 1),
                        "translation": Tween<Offset>(begin: const Offset(0, _fromTop ? -0.1 : 0.1), end: const Offset(0, 0)),
                    },
                    repeats: 1,
                    duration: const Duration(milliseconds: 550),
                    builderMap: (anim) => FractionalTranslation(
                        translation: anim["translation"].value as Offset,
                        child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                            ),
                            child: CommentMessageDialog(
                                fullScreen: fullScreenDialog,
                                fromTop: true,
                            ),
                        ),
                    ),
                ),
            );
        },
    );
}
