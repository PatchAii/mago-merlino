import 'package:{{project_name}}/components/{{project_name}}/bloc/{{project_name}}_bloc.dart';
import 'package:components/ui/widgets/common/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:theme/theme_fields.dart';

class {{project_name_capitalize}}Page extends StatelessWidget {
  const {{project_name_capitalize}}Page({
    Key key,
  }) : super(key: key);

  static const routeName = '{{project_name}}-page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<{{project_name_capitalize}}Bloc>(),
      child: Builder(
        builder: (contextBuilder) {
          return Scaffold(
            appBar: TopBar(),
            body: const Center(
              child: Text('{{project_name_capitalize}}Page'),
            ),
          );
        },
      ),
    );
  }
}
