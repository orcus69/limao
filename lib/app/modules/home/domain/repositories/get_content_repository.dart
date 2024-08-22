import 'package:caracolibras/app/modules/home/external/model/content_module_model.dart';
import 'package:dartz/dartz.dart';
import 'package:caracolibras/app/core/errors/failures.dart';

abstract class IGetContentModuleRepository {
  Future<Either<Failure, List<ContentModuleModel>>> getContentModule(int id);
}
