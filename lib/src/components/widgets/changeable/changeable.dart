import 'package:bui/src/app/app.dart';
import 'package:flutter/material.dart';

import '../../../model/changeable/model_changeable.dart';

class Changeable extends StatefulWidget {
  final String tag;

  /// The data that will be used to create the snapshots provided until a
  /// non-null [future] has completed.
  ///
  /// If the future completes with an error, the data in the [AsyncSnapshot]
  /// provided to the [builder] will become null, regardless of [child].
  /// (The error itself will be available in [AsyncSnapshot.error], and
  /// [AsyncSnapshot.hasError] will be true.)
  final Widget? child;

  /// The build strategy currently used by this builder.
  ///
  /// The builder is provided with an [AsyncSnapshot] object whose
  /// [AsyncSnapshot.connectionState] property will be one of the following
  /// values:
  ///
  ///  * [ConnectionState.none]: [future] is null. The [AsyncSnapshot.data] will
  ///    be set to [child], unless a future has previously completed, in
  ///    which case the previous result persists.
  ///
  ///  * [ConnectionState.waiting]: [future] is not null, but has not yet
  ///    completed. The [AsyncSnapshot.data] will be set to [child],
  ///    unless a future has previously completed, in which case the previous
  ///    result persists.
  ///
  ///  * [ConnectionState.done]: [future] is not null, and has completed. If the
  ///    future completed successfully, the [AsyncSnapshot.data] will be set to
  ///    the value to which the future completed. If it completed with an error,
  ///    [AsyncSnapshot.hasError] will be true and [AsyncSnapshot.error] will be
  ///    set to the error object.
  ///
  /// This builder must only return a widget and should not have any side
  /// effects as it may be called multiple times.
  final AsyncWidgetBuilder builder;

  const Changeable(
    this.tag, {
    Key? key,
    this.child,
    required this.builder,
  }) : super(key: key);

  @override
  State<Changeable> createState() => _ChangeableState();
}

class _ChangeableState extends State<Changeable> {
  BUI bui = BUI.changeable;

  @override
  void initState() {
    super.initState();
    bui.repositoryChangeable.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    ModelChangeable? model =
        bui.repositoryChangeable.getChangeableByTagName(widget.tag);
    if (model == null) {
      return const CircularProgressIndicator();
    }
    return ValueListenableBuilder<String?>(
      valueListenable: model.valueNotifier,
      builder: (context, value, child) {
        return Text(value!);
      },
    );
  }
}
