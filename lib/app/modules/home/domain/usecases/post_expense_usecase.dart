import 'package:caracolibras/app/core/errors/failures.dart';
import 'package:caracolibras/app/modules/home/domain/repositories/ipost_expense_repository.dart';
import 'package:caracolibras/app/modules/home/external/model/module_model.dart';
import 'package:dartz/dartz.dart';

abstract class IPostExpenseUsecase {
  Future<Either<Failure, ModuleModel>> call(ModuleModel expense);
}

abstract class IPostRemoveExpenseByIdUsecase {
  Future<Either<Failure, void>> call(int package);
}

//Salva o serviço
class PostExpenseUsecaseImpl implements IPostExpenseUsecase {
  final IPostModulesRepository postExpenseRepository;
  PostExpenseUsecaseImpl({required this.postExpenseRepository});
  @override
  Future<Either<Failure, ModuleModel>> call(ModuleModel package) async {
    return postExpenseRepository(package);
  }
}

//Remover serviço por id
class PostRemoveExpenseByIdUsecaseImpl
    implements IPostRemoveExpenseByIdUsecase {
  final IPostRemoveExpenseByIdRepository postRemoveExpenseByIdRepository;
  PostRemoveExpenseByIdUsecaseImpl(
      {required this.postRemoveExpenseByIdRepository});
  @override
  Future<Either<Failure, void>> call(int id) async {
    return postRemoveExpenseByIdRepository(id);
  }
}
