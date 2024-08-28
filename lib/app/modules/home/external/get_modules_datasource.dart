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
          'name': 'Básicos',
          'color': '0xFF2679B5',
        },
        'title': 'Alfabeto',
        'date': '2024-08-25',
        'tags': ['Alfabeto', 'Letras'],
        'reference': 'lamp',
      },
      '2': {
        'id': 2,
        'category': {
          'id': 1,
          'name': 'Avançado',
          'color': '0xFF258664',
        },
        'title': 'Comida e Bebidas',
        'date': '2024-08-21',
        'tags': ['Comida', 'Bebidas', 'Alimentos'],
        'reference': 'lamp',
      },
      '3': {
        'id': 3,
        'category': {
          'id': 2,
          'name': 'Intemediário',
          'color': '0xFF9A8D2E',
        },
        'title': 'Dias da Semana e Meses',
        'date': '2024-08-25',
        'tags': [
          'Dias da Semana',
          'Meses',
        ],
        'reference': 'lamp',
      },
      '4': {
        'id': 4,
        'category': {
          'id': 1,
          'name': 'Básicos',
          'color': '0xFF2679B5',
        },
        'title': 'Cores',
        'date': '2024-08-26',
        'tags': ['Cor'],
        'reference': 'lamp',
      },
      '5': {
        'id': 5,
        'category': {
          'id': 1,
          'name': 'Básicos',
          'color': '0xFF2679B5',
        },
        'title': 'Saudações',
        'date': '2024-08-26',
        'tags': ['Oi', 'Cumprimentos'],
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
