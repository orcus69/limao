import 'package:caracolibras/app/modules/home/domain/repositories/get_modules_repository.dart';
import 'package:caracolibras/app/modules/home/external/model/module_model.dart';
import 'package:caracolibras/app/modules/home/infra/datasource/get_modules_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:caracolibras/app/core/errors/failures.dart';

class GetModulesRepositoryImpl implements IGetModulesRepository {
  final IGetModulesDataSource datasource;

  GetModulesRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<ModuleModel>>> getModules() async {
    try {
      var result = await datasource.getModules();
      return result;
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }
}
