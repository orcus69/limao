import 'dart:math';
import 'package:caracolibras/app/core/errors/failures.dart';
import 'package:caracolibras/app/core/service/local_storage/i_local_storage.dart';
import 'package:caracolibras/app/modules/home/external/model/content_module_model.dart';
import 'package:caracolibras/app/modules/home/external/model/module_model.dart';
import 'package:caracolibras/app/modules/home/infra/datasource/get_content_datasource.dart';
import 'package:caracolibras/app/modules/home/infra/datasource/get_modules_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GetContentModuleDatasourceImpl implements IGetContentModuleDataSource {
  @override
  Future<Either<Failure, List<ContentModuleModel>>> getContentModule(int id) async {
    final localStorage = Modular.get<ILocalStorage>();

    // Map<String, dynamic> data =
    //     Map<String, dynamic>.from(localStorage.getData(key: 'modules'));

    Map<String, dynamic> data = {
      '1': {
        'id': 1,
        'module_id': 1,
        'title': 'Soma',
      },
      '2': {
        'id': 2,
        'module_id': 1,
        'title': 'Subtração',
      },
      '3': {
        'id': 3,
        'module_id': 1,
        'title': 'Multiplicação',
      },
      '4': {
        'id': 4,
        'module_id': 1,
        'title': 'Divisão',
      },
      '5': {
        'id': 5,
        'module_id': 3,
        'title': 'Letras',
      },
    };

    if (data.isEmpty) {
      return Left(Failure("Nenhum módulo encontrado"));
    }

    List modules =
        data.values.map((e) => Map<String, dynamic>.from(e)).toList();

    modules = modules
        .where((element) => element['module_id'] == id)
        .toList();

    modules = modules
        .map((e) => ContentModuleModel(
              id: e['id'],
              title: e['title'],
            ))
        .toList();

    if (modules.isEmpty) {
      return Left(Failure("Nenhum gasto encontrado"));
    }

    return Right(modules as List<ContentModuleModel>);
  }

}
