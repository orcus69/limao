import 'package:caracolibras/app/modules/home/domain/repositories/get_modules_repository.dart';
import 'package:caracolibras/app/modules/home/external/model/module_model.dart';
import 'package:dartz/dartz.dart';
import 'package:caracolibras/app/core/errors/failures.dart';

abstract class IGetModulesUsecase {
  Future<Either<Failure, List<ModuleModel>>> call();
}

class IGetModulesUsecaseImpl implements IGetModulesUsecase {
  final IGetModulesRepository getModules;

  IGetModulesUsecaseImpl({required this.getModules});
  @override
  Future<Either<Failure, List<ModuleModel>>> call() async {
    var result = await getModules.getModules();
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
