import 'package:caracolibras/app/core/errors/failures.dart';
import 'package:caracolibras/app/core/service/local_storage/i_local_storage.dart';
import 'package:caracolibras/app/modules/home/external/model/module_model.dart';
import 'package:caracolibras/app/modules/home/infra/datasource/ipost_expense_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PostExpenseDataSourceImpl implements IPostExpenseDataSource {
  @override
  Future<Either<Failure, ModuleModel>> call(ModuleModel expense) async {
    final localStorage =
        Modular.get<ILocalStorage>(); //Acessa banco de dados local

    Map data = expense.toMap();

    bool result = await localStorage.saveKeyData(
        boxKey: 'modules',
        dataKey: expense.id.toString(),
        data: Map<dynamic, dynamic>.from(data));

    if (!result) {
      throw Failure;
    }

    return Right(expense);
  }
}

class PostRemoveServiceByIdDataSourceImpl
    implements IPostRemoveExpenseByIdDataSource {
  @override
  Future<Either<Failure, void>> call(int id) async {
    final localStorage =
        Modular.get<ILocalStorage>(); //Acessa banco de dados local

    //Remove o serviço do banco de dados local
    bool result = await localStorage.removeKeyData(
        boxKey: 'modules', dataKey: id.toString());

    if (!result) {
      throw Failure;
    }

    return const Right(null);
  }
}
