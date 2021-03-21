import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:{{project_name}}/core/injections.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  $initGetIt(getIt);
}