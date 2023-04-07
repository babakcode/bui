import 'package:bui/bui.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class IndexListView extends StatefulWidget {
  final int itemCount;
  final bool shrinkWrap;
  final bool reverse;
  final bool addSemanticIndexes;
  final bool addAutomaticKeepAlive;
  final EdgeInsets? padding;
  final Axis scrollDirection;
  final double initialAlignment;
  final double? minCacheExtent;
  final int initialScrollIndex;
  final int? semanticChildCount;
  final IndexedWidgetBuilder itemBuilder;
  final ScrollPhysics? physics;
  final bool addRepaintBoundaries;

  /// new features
  final IndexListController? controller;
  final ValueSetter<int>? onChangeMinIndex;
  final ValueSetter<int>? onChangeMaxIndex;

  const IndexListView({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    this.controller,
    this.shrinkWrap = false,
    this.reverse = false,
    this.addSemanticIndexes = true,
    this.addAutomaticKeepAlive = true,
    this.addRepaintBoundaries = true,
    this.padding,
    this.semanticChildCount,
    this.scrollDirection = Axis.vertical,
    this.initialAlignment = 0.0,
    this.initialScrollIndex = 0,
    this.minCacheExtent,
    this.onChangeMinIndex,
    this.onChangeMaxIndex,
    this.physics,
  }) : super(key: key);



  static ChatIndexListView chat({
    Key? key,
    shrinkWrap = false,
    reverse = false,
    addSemanticIndexes = true,
    addAutomaticKeepAlive = true,
    addRepaintBoundaries = true,
    EdgeInsets? padding,
    Axis scrollDirection = Axis.vertical,
    double initialAlignment = 0.0,
    double? minCacheExtent,
    int initialScrollIndex = 0,
    int? semanticChildCount,
    required IndexedWidgetBuilder itemBuilder,
    required int itemCount,
    IndexListController? controller,
    ScrollPhysics? physics,
    VoidCallback? onPressedGoEndOfList,
    ValueSetter<int>? onChangeMinIndex,
    ValueSetter<int>? onChangeMaxIndex,
  }) => ChatIndexListView(
    itemCount: itemCount,
    itemBuilder: itemBuilder,
    controller: controller,
    onChangeMaxIndex: onChangeMaxIndex,
    semanticChildCount: semanticChildCount,
    minCacheExtent: minCacheExtent,
    initialScrollIndex: initialScrollIndex,
    initialAlignment: initialAlignment,
    addRepaintBoundaries: addRepaintBoundaries,
    scrollDirection: scrollDirection,
    padding: padding,
    addSemanticIndexes: addSemanticIndexes,
    reverse: reverse,
    key: key,
    physics: physics,
    shrinkWrap: shrinkWrap,
    addAutomaticKeepAlive: addAutomaticKeepAlive,
    onChangeMinIndex: onChangeMinIndex,
  );

  @override
  State<IndexListView> createState() => _IndexListViewState();
}

class _IndexListViewState extends State<IndexListView> {

  late IndexListController _controller;
  int? min, max;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? IndexListController();
    _controller.itemPositionsListener.itemPositions.addListener(() {
      if(min != _controller.minIndexOfChatListOnViewPort){
        widget.onChangeMinIndex?.call(_controller.minIndexOfChatListOnViewPort);
        min = _controller.minIndexOfChatListOnViewPort;
      }
      if(max != _controller.maxIndexOfChatListOnViewPort){
        widget.onChangeMaxIndex?.call(_controller.maxIndexOfChatListOnViewPort);
        max = _controller.maxIndexOfChatListOnViewPort;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      key: widget.key,
      itemCount: widget.itemCount,
      // prototypeItem: const ListTile(),
      shrinkWrap: widget.shrinkWrap,
      reverse: widget.reverse,
      addSemanticIndexes: widget.addSemanticIndexes,
      addAutomaticKeepAlives: widget.addAutomaticKeepAlive,
      padding: widget.padding,
      scrollDirection: widget.scrollDirection,
      addRepaintBoundaries: widget.addRepaintBoundaries,
      initialAlignment: widget.initialAlignment,
      initialScrollIndex: widget.initialScrollIndex,
      itemPositionsListener: _controller.itemPositionsListener,
      itemScrollController: _controller.itemScrollController,
      minCacheExtent: widget.minCacheExtent,
      semanticChildCount: widget.semanticChildCount,
      physics: widget.physics,
      itemBuilder: widget.itemBuilder,
    );
  }
}

