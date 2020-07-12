import 'package:flutter/material.dart';

class DraggableSearchableListView extends StatefulWidget {
  const DraggableSearchableListView({
    Key key,
  }) : super(key: key);

  @override
  _DraggableSearchableListViewState createState() => _DraggableSearchableListViewState();
}

class _DraggableSearchableListViewState extends State<DraggableSearchableListView> {
  final TextEditingController searchTextController = TextEditingController();
  final ValueNotifier<bool> searchTextCloseButtonVisibility = ValueNotifier<bool>(false);
  final ValueNotifier<bool> searchFieldVisibility = ValueNotifier<bool>(false);

  @override
  void dispose() {
    searchTextController.dispose();
    searchTextCloseButtonVisibility.dispose();
    searchFieldVisibility.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        if (notification.extent == 1) {
          searchFieldVisibility.value = true;
        } else {
          searchFieldVisibility.value = false;
        }
        return true;
      },
      child: DraggableScrollableActuator(
        child: Stack(
          children: <Widget>[
            DraggableScrollableSheet(
              initialChildSize: 0.30,
              minChildSize: 0.15,
              maxChildSize: 1.0,
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: ListView.builder(
                    controller: scrollController,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: Card(child: ListTile(title: Text('Item $index'))));
                    },
                  ),
                );
              },
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              child: ValueListenableBuilder<bool>(
                  valueListenable: searchFieldVisibility,
                  builder: (context, value, child) {
                    return value
                        ? PreferredSize(
                            preferredSize: const Size.fromHeight(56.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Theme.of(context).dividerColor),
                                ),
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              child: SearchBar(
                                closeButtonVisibility: searchTextCloseButtonVisibility,
                                textEditingController: searchTextController,
                                onClose: () {
                                  searchFieldVisibility.value = false;
                                  DraggableScrollableActuator.reset(context);
                                },
                                onSearchSubmit: (String value) {},
                              ),
                            ),
                          )
                        : Container();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final TextEditingController textEditingController;
  final ValueNotifier<bool> closeButtonVisibility;
  final ValueChanged<String> onSearchSubmit;
  final VoidCallback onClose;

  const SearchBar({
    Key key,
    @required this.textEditingController,
    @required this.closeButtonVisibility,
    @required this.onSearchSubmit,
    @required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 56.0,
            width: 56.0,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  textEditingController.clear();
                  closeButtonVisibility.value = false;
                  onClose();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: theme.textTheme.caption.color,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          ValueListenableBuilder<bool>(
              valueListenable: closeButtonVisibility,
              builder: (context, value, child) {
                return value
                    ? SizedBox(
                        width: 56.0,
                        height: 56.0,
                        child: Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            onTap: () {
                              closeButtonVisibility.value = false;
                              textEditingController.clear();
                            },
                            child: Icon(
                              Icons.close,
                              color: theme.textTheme.caption.color,
                            ),
                          ),
                        ),
                      )
                    : Container();
              })
        ],
      ),
    );
  }
}
