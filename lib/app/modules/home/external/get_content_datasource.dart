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
            'description': 'Sinal da letra A',
          },
          {
            'src': 'assets/images/modules/1/b.jpeg',
            'type': 'image',
            'title': 'B',
            'description': 'Sinal da letra B',
          },
          {
            'src': 'assets/images/modules/1/c.jpeg',
            'type': 'image',
            'title': 'C',
            'description': 'Sinal da letra C',
          },
          {
            'src': 'assets/images/modules/1/d.jpeg',
            'type': 'image',
            'title': 'D',
            'description': 'Sinal da letra D',
          },
          {
            'src': 'assets/images/modules/1/e.jpeg',
            'type': 'image',
            'title': 'E',
            'description': 'Sinal da letra E',
          },
          {
            'src': 'assets/images/modules/1/f.jpeg',
            'type': 'image',
            'title': 'F',
            'description': 'Sinal da letra F',
          },
          {
            'src': 'assets/images/modules/1/g.jpeg',
            'type': 'image',
            'title': 'G',
            'description': 'Sinal da letra G',
          },
          {
            'src': 'assets/images/modules/1/h.gif',
            'type': 'gif',
            'title': 'H',
            'description': 'Sinal da letra H',
          },
          {
            'src': 'assets/images/modules/1/i.jpeg',
            'type': 'image',
            'title': 'I',
            'description': 'Sinal da letra I',
          },
          {
            'src': 'assets/images/modules/1/j.gif',
            'type': 'gif',
            'title': 'J',
            'description': 'Sinal da letra J',
          },
          {
            'src': 'assets/images/modules/1/k.gif',
            'type': 'gif',
            'title': 'K',
            'description': 'Sinal da letra K',
          },
          {
            'src': 'assets/images/modules/1/l.jpeg',
            'type': 'image',
            'title': 'L',
            'description': 'Sinal da letra L',
          },
          {
            'src': 'assets/images/modules/1/m.jpeg',
            'type': 'image',
            'title': 'M',
            'description': 'Sinal da letra M',
          },
          {
            'src': 'assets/images/modules/1/n.jpeg',
            'type': 'image',
            'title': 'N',
            'description': 'Sinal da letra N',
          },
          {
            'src': 'assets/images/modules/1/o.jpeg',
            'type': 'image',
            'title': 'O',
            'description': 'Sinal da letra O',
          },
          {
            'src': 'assets/images/modules/1/p.jpeg',
            'type': 'image',
            'title': 'P',
            'description': 'Sinal da letra P',
          },
          {
            'src': 'assets/images/modules/1/q.jpeg',
            'type': 'image',
            'title': 'Q',
            'description': 'Sinal da letra Q',
          },
          {
            'src': 'assets/images/modules/1/r.jpeg',
            'type': 'image',
            'title': 'R',
            'description': 'Sinal da letra R',
          },
          {
            'src': 'assets/images/modules/1/s.jpeg',
            'type': 'image',
            'title': 'S',
            'description': 'Sinal da letra S',
          },
          {
            'src': 'assets/images/modules/1/t.jpeg',
            'type': 'image',
            'title': 'T',
            'description': 'Sinal da letra T',
          },
          {
            'src': 'assets/images/modules/1/u.jpeg',
            'type': 'image',
            'title': 'U',
            'description': 'Sinal da letra U',
          },
          {
            'src': 'assets/images/modules/1/v.jpeg',
            'type': 'image',
            'title': 'V',
            'description': 'Sinal da letra V',
          },
          {
            'src': 'assets/images/modules/1/w.jpeg',
            'type': 'image',
            'title': 'W',
            'description': 'Sinal da letra W',
          },
          {
            'src': 'assets/images/modules/1/x.gif',
            'type': 'gif',
            'title': 'X',
            'description': 'Sinal da letra X',
          },
          {
            'src': 'assets/images/modules/1/y.gif',
            'type': 'gif',
            'title': 'Y',
            'description': 'Sinal da letra Y',
          },
          {
            'src': 'assets/images/modules/1/z.gif',
            'type': 'gif',
            'title': 'Z',
            'description': 'Sinal da letra Z',
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
            'description': 'Alfabeto completo',
          },
        ]
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
          },
          {
            'src': 'assets/images/modules/2/suco.gif',
            'type': 'gif',
            'title': 'suco',
            'description': 'Sinal de suco',
          }
        ]
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
      '6': {
        'id': 6,
        'module_id': 4,
        'title': 'Cores',
        'content': [
          {
            'src': 'assets/images/modules/4/amarelo.mp4',
            'type': 'video',
            'title': 'Amarelo',
            'description': 'Sinal de amarelo',
          },
          {
            'src': 'assets/images/modules/4/azul.mp4',
            'type': 'video',
            'title': 'Azul',
            'description':
                'Sinal de azul, configuração inicial de mão na letra "A" e movimento na forma da letra "Z", finalizando com a letra "L"',
          },
          {
            'src': 'assets/images/modules/4/verde.mp4',
            'type': 'video',
            'title': 'Verde',
            'description':
                'Sinal de verde, configuração de mão na letra "V" com o movimento',
          },
          {
            'src': 'assets/images/modules/4/vermelho.mp4',
            'type': 'video',
            'title': 'Vermelho',
            'description': 'Sinal de vermelho',
          },
          {
            'src': 'assets/images/modules/4/branco.mp4',
            'type': 'video',
            'title': 'Branco',
            'description': 'Sinal de branco',
          },
          {
            'src': 'assets/images/modules/4/preto.mp4',
            'type': 'video',
            'title': 'Preto',
            'description': 'Sinal de preto',
          },
          {
            'src': 'assets/images/modules/4/cinza.mp4',
            'type': 'video',
            'title': 'Cinza',
            'description':
                'Sinal de cinza, configuração de mão na letra "C" com o movimento',
          },
          {
            'src': 'assets/images/modules/4/marrom.mp4',
            'type': 'video',
            'title': 'Marrom',
            'description':
                'Sinal de marrom, configuração de mão na letra "M" com o movimento',
          },
          {
            'src': 'assets/images/modules/4/laranja.mp4',
            'type': 'video',
            'title': 'Laranja',
            'description': 'Sinal de laranja',
          },
          {
            'src': 'assets/images/modules/4/roxo.mp4',
            'type': 'video',
            'title': 'Roxo',
            'description':
                'Sinal de roxo, configuração de mão na letra "R" com o movimento',
          },
          {
            'src': 'assets/images/modules/4/rosa.mp4',
            'type': 'video',
            'title': 'Rosa',
            'description':
                'Sinal de rosa, configuração de mão na letra "R" com o movimento no rosto',
          },
        ]
      },
      '7': {
        'id': 7,
        'module_id': 5,
        'title': 'Saudações',
        'content': [
          {
            'src': 'assets/images/modules/5/oi.mp4',
            'type': 'video',
            'title': 'Oi',
            'description':
                'Sinal de oi, configuração de mão na letra "O" mais o "I"',
          },
          {
            'src': 'assets/images/modules/5/adeus.mp4',
            'type': 'video',
            'title': 'Adeus',
            'description': 'Sinal de adeus',
          },
          {
            'src': 'assets/images/modules/5/bom_dia.mp4',
            'type': 'video',
            'title': 'Bom dia',
            'description':
                'Sinal de bom dia, segunda parte da sinalização representando o movimento do sol no céu',
          },
          {
            'src': 'assets/images/modules/5/boa_tarde.mp4',
            'type': 'video',
            'title': 'Boa tarde',
            'description': 'Sinal de boa tarde',
          },
          {
            'src': 'assets/images/modules/5/boa_noite.mp4',
            'type': 'video',
            'title': 'Boa noite',
            'description':
                'Sinal de boa noite, segunda parte da sinalização representando o por do sol',
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
