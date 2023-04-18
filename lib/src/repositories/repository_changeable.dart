import 'package:bui/src/implements/changeable_implements.dart';
import 'package:bui/src/model/changeable/model_init_changeable.dart';
import 'package:bui/src/model/request_response/response.dart';
import 'package:bui/src/services/request_manager.dart';
import 'package:flutter/material.dart';

import '../model/changeable/model_changeable.dart';

class RepositoryChangeable extends ChangeNotifier
    implements ChangeableImplements {

  ModelInitChangeable modelInitChangeable;

  RepositoryChangeable(this.modelInitChangeable)
      : _requestManager = RequestManager(baseUrl: "https://api_ui.babakcode.com");


  final _changeableValues = <ModelChangeable>[];

  ModelChangeable? getChangeableByTagName(String tag){
    int index = _changeableValues.indexWhere((element) => element.tag == tag);
    if(index != -1){
      return _changeableValues[index];
    }
    return null;
  }

  late final RequestManager _requestManager;

  @override
  Future<Response> getAllChangeable() async {
    return _requestManager.get("path", body: {});
  }

}