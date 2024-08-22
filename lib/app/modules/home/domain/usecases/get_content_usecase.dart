import 'package:caracolibras/app/modules/home/domain/repositories/get_content_repository.dart';
import 'package:caracolibras/app/modules/home/external/model/content_module_model.dart';
import 'package:dartz/dartz.dart';
import 'package:caracolibras/app/core/errors/failures.dart';

abstract class IGetContentModuleUsecase {
  Future<Either<Failure, List<ContentModuleModel>>> call(int id);
}

class IGetContentModuleUsecaseImpl implements IGetContentModuleUsecase {
  final IGetContentModuleRepository getContentModule;

  IGetContentModuleUsecaseImpl({required this.getContentModule});
  @override
  Future<Either<Failure, List<ContentModuleModel>>> call(int id) async {
    var result = await getContentModule.getContentModule(id);
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
