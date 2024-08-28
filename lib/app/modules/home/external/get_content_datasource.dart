import 'dart:math';
import 'package:caracolibras/app/core/errors/failures.dart';
import 'package:caracolibras/app/core/service/local_storage/i_local_storage.dart';
import 'package:caracolibras/app/modules/home/external/model/content_module_model.dart';
import 'package:caracolibras/app/modules/home/infra/datasource/get_content_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GetContentModuleDatasourceImpl implements IGetContentModuleDataSource {
  @override
  Future<Either<Failure, List<ContentModuleModel>>> getContentModule(
      int id) async {
    final localStorage = Modular.get<ILocalStorage>();

    // Map<String, dynamic> data =
    //     Map<String, dynamic>.from(localStorage.getData(key: 'modules'));

    //TODO: content must have an id to be used as key
    Map<String, dynamic> data = {
      '1': {
        'id': 1,
        'module_id': 1,
        'title': 'Letras',
        'content': [
          {
            'src': 'assets/images/modules/1/a.jpeg',
            'type': 'image',
            'title': 'A',
            'description': 'Descrição da imagem A',
          },
          {
            'src': 'assets/images/modules/1/b.jpeg',
            'type': 'image',
            'title': 'B',
            'description': 'Descrição da imagem B',
          },
          {
            'src': 'assets/images/modules/1/c.jpeg',
            'type': 'image',
            'title': 'C',
            'description': 'Descrição da imagem C',
          },
          {
            'src': 'assets/images/modules/1/d.jpeg',
            'type': 'image',
            'title': 'D',
            'description': 'Descrição da imagem D',
          },
          {
            'src': 'assets/images/modules/1/e.jpeg',
            'type': 'image',
            'title': 'E',
            'description': 'Descrição da imagem E',
          },
          {
            'src': 'assets/images/modules/1/f.jpeg',
            'type': 'image',
            'title': 'F',
            'description': 'Descrição da imagem F',
          },
          {
            'src': 'assets/images/modules/1/g.jpeg',
            'type': 'image',
            'title': 'G',
            'description': 'Descrição da imagem G',
          },
          {
            'src': 'assets/images/modules//1/h.gif',
            'type': 'gif',
            'title': 'H',
            'description': 'Descrição da imagem H',
          },
          {
            'src': 'assets/images/modules/1/i.jpeg',
            'type': 'image',
            'title': 'I',
            'description': 'Descrição da imagem I',
          },
          {
            'src': 'assets/images/modules/1/j.gif',
            'type': 'gif',
            'title': 'J',
            'description': 'Descrição da imagem J',
          },
          {
            'src': 'assets/images/modules/1/k.gif',
            'type': 'gif',
            'title': 'K',
            'description': 'Descrição da imagem K',
          },
          {
            'src': 'assets/images/modules/1/l.jpeg',
            'type': 'image',
            'title': 'L',
            'description': 'Descrição da imagem L',
          },
          {
            'src': 'assets/images/modules/1/m.jpeg',
            'type': 'image',
            'title': 'M',
            'description': 'Descrição da imagem M',
          },
          {
            'src': 'assets/images/modules/1/n.jpeg',
            'type': 'image',
            'title': 'N',
            'description': 'Descrição da imagem N',
          },
          {
            'src': 'assets/images/modules/1/o.jpeg',
            'type': 'image',
            'title': 'O',
            'description': 'Descrição da imagem O',
          },
          {
            'src': 'assets/images/modules/1/p.jpeg',
            'type': 'image',
            'title': 'P',
            'description': 'Descrição da imagem P',
          },
          {
            'src': 'assets/images/modules/1/q.jpeg',
            'type': 'image',
            'title': 'Q',
            'description': 'Descrição da imagem Q',
          },
          {
            'src': 'assets/images/modules/1/r.jpeg',
            'type': 'image',
            'title': 'R',
            'description': 'Descrição da imagem R',
          },
          {
            'src': 'assets/images/modules/1/s.jpeg',
            'type': 'image',
            'title': 'S',
            'description': 'Descrição da imagem S',
          },
          {
            'src': 'assets/images/modules/1/t.jpeg',
            'type': 'image',
            'title': 'T',
            'description': 'Descrição da imagem T',
          },
          {
            'src': 'assets/images/modules/1/u.jpeg',
            'type': 'image',
            'title': 'U',
            'description': 'Descrição da imagem U',
          },
          {
            'src': 'assets/images/modules/1/v.jpeg',
            'type': 'image',
            'title': 'V',
            'description': 'Descrição da imagem V',
          },
          {
            'src': 'assets/images/modules/1/w.jpeg',
            'type': 'image',
            'title': 'W',
            'description': 'Descrição da imagem W',
          },
          {
            'src': 'assets/images/modules/1/x.gif',
            'type': 'gif',
            'title': 'X',
            'description': 'Descrição da imagem X',
          },
          {
            'src': 'assets/images/modules/1/y.gif',
            'type': 'gif',
            'title': 'Y',
            'description': 'Descrição da imagem Y',
          },
          {
            'src': 'assets/images/modules/1/z.gif',
            'type': 'gif',
            'title': 'Z',
            'description': 'Descrição da imagem Z',
          }
        ]
      },
      '2': {
        'id': 2,
        'module_id': 1,
        'title': 'Alfabeto',
        'content': [
          {
            'src': 'assets/images/modules/1/alfabeto.mp4',
            'type': 'video',
            'title': 'Alfabeto',
            'description': 'Descrição do vídeo Alfabeto',
          },]
      },
      '3': {
        'id': 3,
        'module_id': 2,
        'title': 'Comidas',
        'content': [
          {
            'src': 'assets/images/modules/2/carne.gif',
            'type': 'gif',
            'title': 'Carne',
            'description': 'Sinal de carne',
          },
          {
            'src': 'assets/images/modules/2/frango.gif',
            'type': 'gif',
            'title': 'Frango',
            'description': 'Sinal de frango',
          },
          {
            'src': 'assets/images/modules/2/feijao.gif',
            'type': 'gif',
            'title': 'Feijão',
            'description': 'Sinal de feijão',
          }
          ]
      },
      '4': {
        'id': 4,
        'module_id': 2,
        'title': 'Bebidas',
        'content': [
          {
            'src': 'assets/images/modules/2/agua.gif',
            'type': 'gif',
            'title': 'Água',
            'description': 'Sinal de água',
          },{
            'src': 'assets/images/modules/2/suco.gif',
            'type': 'gif',
            'title': 'suco',
            'description': 'Sinal de suco',
          }]
      },
      '5': {
        'id': 5,
        'module_id': 3,
        'title': 'Dias da Semana',
        'content': [
          {
            'src': 'assets/images/modules/3/Domingo.mp4',
            'type': 'video',
            'title': 'Domingo',
            'description': 'Aprenda a sinalizar *Segunda-feira* em Libras.',
          },
          {
            'src': 'assets/images/modules/3/Segunda.mp4',
            'type': 'video',
            'title': 'Segunda',
            'description': 'Aprenda a sinalizar *Segunda-feira* em Libras.',
          },
          {
            'src': 'assets/images/modules/3/Terca.mp4',
            'type': 'video',
            'title': 'Terça',
            'description': 'Aprenda a sinalizar *Terça-feira* em Libras.',
          },
          {
            'src': 'assets/images/modules/3/Quarta.mp4',
            'type': 'video',
            'title': 'Quarta',
            'description': 'Aprenda a sinalizar *Quarta-feira* em Libras.',
          },
          {
            'src': 'assets/images/modules/3/Quinta.mp4',
            'type': 'video',
            'title': 'Quinta',
            'description': 'Aprenda a sinalizar *Quinta-feira* em Libras.',
          },
          {
            'src': 'assets/images/modules/3/Sexta.mp4',
            'type': 'video',
            'title': 'Sexta',
            'description': 'Aprenda a sinalizar *Sexta-feira* em Libras.',
          },
          {
            'src': 'assets/images/modules/3/Sabado.mp4',
            'type': 'video',
            'title': 'Sábado',
            'description': 'Aprenda a sinalizar *Sábado* em Libras.',
          },
        ]
      },
      // '5': {
      //   'id': 5,
      //   'module_id': 3,
      //   'title': 'Letras',
      //   'content': []
      // },
    };

    if (data.isEmpty) {
      return Left(Failure("Nenhum módulo encontrado"));
    }

    List modules =
        data.values.map((e) => Map<String, dynamic>.from(e)).toList();

    modules = modules.where((element) => element['module_id'] == id).toList();

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
