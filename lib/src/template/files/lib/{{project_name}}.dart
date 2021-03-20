library {{project_name}};

import 'package:automodule/models/app_module.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


class {{project_name_capitalize}}AutoModule extends AppBuilderModule {

  @override
  // ignore: missing_return
  Future<Map<String, dynamic>> init() async {
    configureDependencies();
  }

  @override
  Widget render() {
    return {{project_name_capitalize}}Widget();
  }
}