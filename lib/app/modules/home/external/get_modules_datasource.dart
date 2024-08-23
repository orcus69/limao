import 'dart:math';
import 'package:caracolibras/app/core/errors/failures.dart';
import 'package:caracolibras/app/core/service/local_storage/i_local_storage.dart';
import 'package:caracolibras/app/modules/home/external/model/module_model.dart';
import 'package:caracolibras/app/modules/home/infra/datasource/get_modules_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GetModulesDatasourceImpl implements IGetModulesDataSource {
  @override
  Future<Either<Failure, List<ModuleModel>>> getModules() async {
    final localStorage = Modular.get<ILocalStorage>();

    // Map<String, dynamic> data =
    //     Map<String, dynamic>.from(localStorage.getData(key: 'modules'));

    Map<String, dynamic> data = {
      '1': {
        'id': 1,
        'category': {
          'id': 1,
          'name': 'Basicos',
          'color': '0xFF0095FF',
        },
        'title': 'Matemática Básica',
        'date': '2021-10-10',
        'tags': ['soma', 'subtração', 'multiplicação', 'divisão'],
        'reference': 'lamp',
      },
      '2': {
        'id': 2,
        'category': {
          'id': 2,
          'name': 'Identificação',
          'color': '0xFFFFE100',
        },
        'title': 'Como se identificar e pedir identificação',
        'date': '2021-10-10',
        'tags': [],
        'reference': 'idcard',
      },
      '3': {
        'id': 3,
        'category': {
          'id': 1,
          'name': 'Basicos',
          'color': '0xFF0095FF',
        },
        'title': 'Alfabeto e Números',
        'date': '2021-10-10',
        'tags': ['Letras', 'Números'],
        'reference': 'lamp',
      },
    };

    if (data.isEmpty) {
      return Left(Failure("Nenhum módulo encontrado"));
    }

    List modules =
        data.values.map((e) => Map<String, dynamic>.from(e)).toList();

    modules = modules
        .map((e) => ModuleModel(
              id: e['id'],
              category: Map<String, dynamic>.from(e['category']),
              title: e['title'],
              date: DateTime.parse(e['date']),
              tags: List<String>.from(e['tags']),
              reference: e['reference'],
            ))
        .toList();

    if (modules.isEmpty) {
      return Left(Failure("Nenhum módulo encontrado"));
    }

    return Right(modules as List<ModuleModel>);
  }
}
