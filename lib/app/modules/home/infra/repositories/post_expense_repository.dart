import 'package:caracolibras/app/core/errors/failures.dart';
import 'package:caracolibras/app/modules/home/domain/repositories/ipost_expense_repository.dart';
import 'package:caracolibras/app/modules/home/external/model/module_model.dart';
import 'package:caracolibras/app/modules/home/infra/datasource/ipost_expense_datasource.dart';
import 'package:dartz/dartz.dart';

class PostExpenseRepositoryImpl implements IPostModulesRepository {
  final IPostExpenseDataSource postExpenseDataSource;

  PostExpenseRepositoryImpl({required this.postExpenseDataSource});
  @override
  Future<Either<Failure, ModuleModel>> call(ModuleModel expense) async {
    var result = await postExpenseDataSource(expense);

    return result;
  }
}

class PostRemoveExpenseByIdRepositoryImpl
    implements IPostRemoveExpenseByIdRepository {
  final IPostRemoveExpenseByIdDataSource postRemoveExpenseByIdDataSource;

  PostRemoveExpenseByIdRepositoryImpl(
      {required this.postRemoveExpenseByIdDataSource});
  @override
  Future<Either<Failure, void>> call(int id) async {
    var result = await postRemoveExpenseByIdDataSource(id);

    return result;
  }
}

