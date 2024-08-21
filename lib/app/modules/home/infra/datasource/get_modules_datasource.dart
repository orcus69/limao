import 'package:caracolibras/app/core/errors/failures.dart';
import 'package:caracolibras/app/modules/home/external/model/module_model.dart';
import 'package:dartz/dartz.dart';

abstract class IGetModulesDataSource {
  Future<Either<Failure, List<ModuleModel>>> getModules();
}
