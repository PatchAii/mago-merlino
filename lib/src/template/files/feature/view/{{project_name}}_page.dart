import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:CHANGEME/core/core.dart';
import 'package:CHANGEME/feature/{{project_name}}/bloc/{{project_name}}_bloc.dart';
import 'package:CHANGEME/feature/{{project_name}}/view/widget/{{project_name}}_widget.dart';

class {{project_name_capitalize}}PageBuilder extends StatelessWidget {
  const {{project_name_capitalize}}PageBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<{{project_name_capitalize}}Bloc>()..add(const {{project_name_capitalize}}Event.fetch()),
      child: Builder(
        builder: (context) {
          return BlocBuilder<{{project_name_capitalize}}Bloc, {{project_name_capitalize}}State>(
            builder: (context, state) {
              return state.map(
                loaded: (state) => const {{project_name_capitalize}}Page(),
                loading: (state) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class {{project_name_capitalize}}Page extends StatelessWidget {
  const {{project_name_capitalize}}Page({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const {{project_name_capitalize}}Widget();
  }
}
