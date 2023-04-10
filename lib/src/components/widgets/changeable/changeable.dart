// import 'package:flutter/material.dart';
//
// class Changeable extends StatefulWidget {
//   final String tag;
//
//   /// The data that will be used to create the snapshots provided until a
//   /// non-null [future] has completed.
//   ///
//   /// If the future completes with an error, the data in the [AsyncSnapshot]
//   /// provided to the [builder] will become null, regardless of [initialData].
//   /// (The error itself will be available in [AsyncSnapshot.error], and
//   /// [AsyncSnapshot.hasError] will be true.)
//   final Widget? initialData;
//
//   /// The build strategy currently used by this builder.
//   ///
//   /// The builder is provided with an [AsyncSnapshot] object whose
//   /// [AsyncSnapshot.connectionState] property will be one of the following
//   /// values:
//   ///
//   ///  * [ConnectionState.none]: [future] is null. The [AsyncSnapshot.data] will
//   ///    be set to [initialData], unless a future has previously completed, in
//   ///    which case the previous result persists.
//   ///
//   ///  * [ConnectionState.waiting]: [future] is not null, but has not yet
//   ///    completed. The [AsyncSnapshot.data] will be set to [initialData],
//   ///    unless a future has previously completed, in which case the previous
//   ///    result persists.
//   ///
//   ///  * [ConnectionState.done]: [future] is not null, and has completed. If the
//   ///    future completed successfully, the [AsyncSnapshot.data] will be set to
//   ///    the value to which the future completed. If it completed with an error,
//   ///    [AsyncSnapshot.hasError] will be true and [AsyncSnapshot.error] will be
//   ///    set to the error object.
//   ///
//   /// This builder must only return a widget and should not have any side
//   /// effects as it may be called multiple times.
//   final AsyncWidgetBuilder builder;
//
//   const Changeable(
//     this.tag, {
//     Key? key,
//     this.initialData,
//     required this.builder,
//   }) : super(key: key);
//
//   @override
//   State<Changeable> createState() => _ChangeableState();
// }
//
// class _ChangeableState extends State<Changeable> {
//   /// An object that identifies the currently active callbacks. Used to avoid
//   /// calling setState from stale callbacks, e.g. after disposal of this state,
//   /// or after widget reconfiguration to a new Future.
//   // Object? _activeCallbackIdentity;
//   late AsyncSnapshot _snapshot;
//   // final BabakUIRequests _requests = BabakUIRequests(_configModel);
//   // final ChangeableController changeableController = ChangeableController();
//   // final BabakUICryptoManager cryptoManager = BabakUICryptoManager(
//   //     encryptKey: _configModel!.encryptKey, type: _configModel!.aesType);
//
//   @override
//   void initState() {
//     super.initState();
//     // int i = _changeableTagModels.indexWhere(
//     //     (element) => element.tag == BabakUIConstant.tagPreName + widget.tag);
//     // if (i != -1) {
//     //   String? decryptedChangeable = cryptoManager.decryptData(EncryptModel(
//     //       _changeableTagModels[i].content, _changeableTagModels[i].iv));
//     //
//     //
//     // }
//     // _snapshot = widget.initialData == null
//     //     ? const AsyncSnapshot.nothing()
//     //     : AsyncSnapshot.withData(ConnectionState.none, widget.initialData);
//     // _subscribe();
//   }
//
//   @override
//   Widget build(BuildContext context) => widget.builder(context, _snapshot);
//
//   @override
//   void dispose() {
//     _unsubscribe();
//     super.dispose();
//   }
//
//   void _subscribe() {
//     final Object callbackIdentity = Object();
//     _activeCallbackIdentity = callbackIdentity;
//
//     // _requests.changeable(widget.tag).then((Response response) {
//     //   if (response.statusCode != 200) {
//     //     _snapshot = const AsyncSnapshot.withData(ConnectionState.done, null);
//     //     return;
//     //   }
//     //
//     //   if (_activeCallbackIdentity == callbackIdentity) {
//     //     setState(() {
//     //       _snapshot =
//     //           AsyncSnapshot.withData(ConnectionState.done, response.body);
//     //     });
//     //   }
//     // }, onError: (Object error, StackTrace stackTrace) {
//     //   if (_activeCallbackIdentity == callbackIdentity) {
//     //     setState(() {
//     //       _snapshot =
//     //           AsyncSnapshot.withError(ConnectionState.done, error, stackTrace);
//     //     });
//     //   }
//     // });
//     // _snapshot = _snapshot.inState(ConnectionState.waiting);
//   }
//
//   void _unsubscribe() => _activeCallbackIdentity = null;
// }
