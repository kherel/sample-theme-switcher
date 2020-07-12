import 'dart:io';
import 'package:camera/camera.dart';
import 'package:application/core/app_theme.dart';
import 'package:application/core/components/after_layout.dart';
import 'package:application/core/global_bloc.dart';
import 'package:application/core/media_model.dart';
import 'package:application/core/theme_manager.dart';
import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AttachmentDraggableBottomSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DraggableBottomSheet();
}

class _DraggableBottomSheet extends State with TickerProviderStateMixin, AfterLayoutMixin {
  CameraController _cameraController;
  List cameras;
  static const selectionLimit = 10;
  final DragSelectGridViewController controller = DragSelectGridViewController();
  Selection currentSelection;
  final ValueNotifier<int> _selectedCameraIdx = ValueNotifier<int>(-1);
  final ValueNotifier<bool> visibleCamera = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _showAppBar = ValueNotifier<bool>(false);
  final ValueNotifier<MediaDropDownStructure> _chooseFolderName = ValueNotifier<MediaDropDownStructure>(null);
  final ValueNotifier<List<MediaDropDownStructure>> _mediaFoldersList = ValueNotifier<List<MediaDropDownStructure>>(null);
  @override
  void initState() {
    super.initState();
    controller.addListener(handleSelectionChange);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalBloc _globalBloc = Provider.of<GlobalBloc>(context);
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        if (notification.extent >= 0.90) {
          _showAppBar.value = true;
          Provider.of<ThemeManager>(context, listen: false).changeStatusBarColor(changeColor: true);
        } else if(notification.extent <= 0.90) {
          _showAppBar.value = false;
          Provider.of<ThemeManager>(context, listen: false).changeStatusBarColor(changeColor: false);
        }
        return true;
      },
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: <Widget>[
            DraggableScrollableSheet(
              initialChildSize: 0.50,
              minChildSize: 0.50,
              maxChildSize: 1.0,
              builder: (BuildContext context, ScrollController scrollController) {
                return ValueListenableBuilder<bool>(
                  valueListenable: _showAppBar,
                  builder:(context,value, child)=> Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular( value ? 0 : 16.0 ),
                          topRight: Radius.circular( value ? 0 : 16.0 ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only( left: 0.0, top: 5.0, right: 0.0 ),
                              child: StreamBuilder<List<MediaModel>>(
                                  stream: _globalBloc.storageMediaBloc.imagesMedia$,
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: CircularProgressIndicator( ),
                                      );
                                    }
                                    final List<MediaModel> _allImages = snapshot.data;
                                    changeValueNotifierValue(_allImages);

                                    final List<File> _imagesFiles = _allImages[0].files.map((e) => File('$e')).toList();
                                    return ClipRRect(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: DragSelectGridView(
                                        gridController: controller,
                                        scrollController: scrollController,
                                        padding: const EdgeInsets.all(8),
                                        itemCount: _imagesFiles.length,
                                        itemBuilder: (context, index, selected) {
                                          if(index == 0){
                                            return Container(
                                              color: Colors.black,
                                              child: ValueListenableBuilder<bool>(
                                                valueListenable: visibleCamera,
                                                builder: (BuildContext context, bool value, Widget child) {
                                                  if (value) {
                                                    return _cameraPreviewWidget( );
                                                  } else {
                                                    return Stack(
                                                      children: <Widget>[
                                                        Align(
                                                          alignment: Alignment.center,
                                                          child: Icon(
                                                            Icons.camera,
                                                            color: Colors.white,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }
                                                },
                                              ),
                                            );
                                          }else {
                                            /*return SelectableMediaItem(
                                              index: index,
                                              selected: selected,
                                              media: _imagesFiles[index],
                                            );*/
                                          }
                                        },
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 5.0,
                                          crossAxisSpacing: 5.0,
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                );
              },
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _showAppBar,
              builder: (context, value, child) {
                if (value) {
                  return PreferredSize(
                    preferredSize: Size.fromHeight(kToolbarHeight),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        height: kToolbarHeight,
                        child: AppBar(
                          automaticallyImplyLeading: false,
                          backgroundColor: Colors.white,
                          title:Container(
                            width: 150.0,
                            padding: const EdgeInsets.only(right:8.0),
                            child: ValueListenableBuilder(
                              valueListenable: _mediaFoldersList,
                                builder: (context, List<MediaDropDownStructure> items,child)=>DropdownButtonHideUnderline(
                                  child: ValueListenableBuilder(
                                    valueListenable: _chooseFolderName,
                                    builder:(context, MediaDropDownStructure selectedItem,child)=>DropdownButton<MediaDropDownStructure>(
                                      value: selectedItem,
                                      hint: Text("یک پوشه انتخاب کنید",style: AppTheme.of(context).caption(),),
                                      items: items.map((MediaDropDownStructure menuItem) {
                                        return DropdownMenuItem<MediaDropDownStructure>(
                                          value: menuItem,
                                          child: Text(menuItem.folderPath),
                                        );
                                      }).toList(),
                                      onChanged: (MediaDropDownStructure item)=>_chooseFolderName.value = item,
                                    ) ,
                                  ),
                                ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    width: 0.0,
                    height: 0.0,);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Widget _cameraPreviewWidget() {
    // ignore: null_aware_in_logical_operator
    if (_cameraController != null && _cameraController.value?.isInitialized) {
      return Stack(
        children: <Widget>[
          CameraPreview(_cameraController),
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.camera,
              color: Colors.white,
              size: 50.0,
            ),
          ),
        ],
      );
    } else {
      return Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.camera,
              color: Colors.white,
              size: 50.0,
            ),
          ),
        ],
      );
    }
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (_cameraController != null) {
      await _cameraController.dispose();
    }

    _cameraController = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    _cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (_cameraController.value.hasError) {
        // ignore: avoid_print
        print('Camera error ${_cameraController.value.errorDescription}');
      }
    });

    try {
      await _cameraController.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _showCameraException(CameraException e) {
    final String errorText = 'Error: ${e.code}\nError Message: ${e.description}';
    // ignore: avoid_print
    print(errorText);
    // ignore: avoid_print
    print('Error: ${e.code}\n${e.description}');
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 750), () {
      availableCameras().then((availableCameras) {
        cameras = availableCameras;
        if (cameras.isNotEmpty) {
          _selectedCameraIdx.value = 0;
          _initCameraController(cameras[_selectedCameraIdx.value] as CameraDescription).then((void v) => visibleCamera.value = true);
        } else {
          //print("No camera available");
        }
      }).catchError((err) {
        // ignore: avoid_print
        print('Error: $err.code\nError Message: $err.message');
      });
    });
  }

  Future<void> changeValueNotifierValue(List<MediaModel> allImages)async {
    await Future.delayed(const Duration(microseconds: 1));
    _mediaFoldersList.value = allImages.map( (image) => MediaDropDownStructure( image.folder, image.folder ) ).toList();
  }

  void handleSelectionChange() {
    if (controller.selection.amount > selectionLimit) {
      setState(() => controller.selection = currentSelection);
    } else {
      setState(() {
        currentSelection = Selection(
          Set.of(controller.selection.selectedIndexes),
        );
      });
    }
  }
}

class MediaDropDownStructure{
    final String folderName;
    final String folderPath;
    MediaDropDownStructure(this.folderName, this.folderPath);
}