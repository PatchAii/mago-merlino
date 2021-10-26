import 'package:mason/mason.dart';

export 'feature/create_feature.dart';
export 'feature/update_feature.dart';
export 'feature_test/create_feature_test.dart';
export 'feature_test/update_feature_test.dart';

typedef GeneratorBuilder = Future<MasonGenerator> Function(MasonBundle);
