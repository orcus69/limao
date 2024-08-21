import 'package:caracolibras/app/modules/home/external/model/module_model.dart';
import 'package:dartz/dartz.dart';
import 'package:caracolibras/app/core/errors/failures.dart';

abstract class IGetModulesRepository {
  Future<Either<Failure, List<ModuleModel>>> getModules();
}
