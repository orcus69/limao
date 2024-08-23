import 'dart:math';
import 'package:caracolibras/app/core/errors/failures.dart';
import 'package:caracolibras/app/core/service/local_storage/i_local_storage.dart';
import 'package:caracolibras/app/modules/home/external/model/content_module_model.dart';
import 'package:caracolibras/app/modules/home/infra/datasource/get_content_datasource.dart';
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
        'content': [
          {
            'src': 'https://www.youtube.com/embed/1zv4Zv6ZJ4w',
            'type': 'video',
            'title': 'Vídeo 1',
            'description': 'Descrição do vídeo 1',
          },
          {
            'src': 'https://www.youtube.com/embed/1zv4Zv6ZJ4w',
            'type': 'video',
            'title': 'Vídeo 2',
            'description': 'Descrição do vídeo 2',
          }
        ]
      },
      '2': {
        'id': 2,
        'module_id': 1,
        'title': 'Subtração',
        'content': []
      },
      '3': {
        'id': 3,
        'module_id': 1,
        'title': 'Multiplicação',
        'content': []
      },
      '4': {
        'id': 4,
        'module_id': 1,
        'title': 'Divisão',
        'content': []
      },
      '5': {
        'id': 5,
        'module_id': 3,
        'title': 'Letras',
        'content': []
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
              idModule: e['module_id'],
              title: e['title'],
              content: List<ContentListModel>.from(
                e['content']?.map((x) => ContentListModel.fromMap(x)),
              ),
            ))
        .toList();

    if (modules.isEmpty) {
      return Left(Failure("Nenhum conteúdo encontrado"));
    }

    return Right(modules as List<ContentModuleModel>);
  }

}
