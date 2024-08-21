import 'package:caracolibras/app/core/errors/failures.dart';
import 'package:caracolibras/app/modules/home/external/model/module_model.dart';
import 'package:dartz/dartz.dart';

abstract class IPostExpenseDataSource {
  @override
  Future<Either<Failure, ModuleModel>> call(ModuleModel package);
}

//Remover serviço por id
abstract class IPostRemoveExpenseByIdDataSource {
  @override
  Future<Either<Failure, void>> call(int id);
}
