import 'package:caracolibras/app/modules/home/domain/repositories/get_content_repository.dart';
import 'package:caracolibras/app/modules/home/external/model/content_module_model.dart';
import 'package:caracolibras/app/modules/home/infra/datasource/get_content_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:caracolibras/app/core/errors/failures.dart';

class GetContentModuleRepositoryImpl implements IGetContentModuleRepository {
  final IGetContentModuleDataSource datasource;

  GetContentModuleRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<ContentModuleModel>>> getContentModule(int id) async {
    try {
      var result = await datasource.getContentModule(id);
      return result;
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }
}
