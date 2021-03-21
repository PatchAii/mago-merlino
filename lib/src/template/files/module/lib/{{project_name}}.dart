library {{project_name}};

import 'package:{{project_name}}/components/{{project_name}}/ui/widget/{{project_name}}_widget.dart';
import 'package:{{project_name}}/core/injections.dart';
import 'package:automodule/models/app_module.dart';
import 'package:flutter/material.dart';


class {{project_name_capitalize}}AutoModule extends AppBuilderModule {

  @override
  // ignore: missing_return
  Future<Map<String, dynamic>> init() async {
    configureDependencies();
  }

  @override
  Widget render() {
    return const {{project_name_capitalize}}Widget();
  }
}