import 'package:caracolibras/app/core/service/modular/widget_module.dart';
import 'package:caracolibras/app/modules/home/domain/repositories/get_content_repository.dart';
import 'package:caracolibras/app/modules/home/domain/repositories/get_modules_repository.dart';
import 'package:caracolibras/app/modules/home/domain/repositories/ipost_expense_repository.dart';
import 'package:caracolibras/app/modules/home/domain/usecases/get_content_usecase.dart';
import 'package:caracolibras/app/modules/home/domain/usecases/get_modules_usecase.dart';
import 'package:caracolibras/app/modules/home/domain/usecases/post_expense_usecase.dart';
import 'package:caracolibras/app/modules/home/external/get_content_datasource.dart';
import 'package:caracolibras/app/modules/home/external/get_modules_datasource.dart';
import 'package:caracolibras/app/modules/home/external/model/module_model.dart';
import 'package:caracolibras/app/modules/home/external/post_expense_datasource.dart';
import 'package:caracolibras/app/modules/home/infra/datasource/get_content_datasource.dart';
import 'package:caracolibras/app/modules/home/infra/datasource/get_modules_datasource.dart';
import 'package:caracolibras/app/modules/home/infra/datasource/ipost_expense_datasource.dart';
import 'package:caracolibras/app/modules/home/infra/repositories/get_content_repository.dart';
import 'package:caracolibras/app/modules/home/infra/repositories/get_modules_repository.dart';
import 'package:caracolibras/app/modules/home/infra/repositories/post_expense_repository.dart';
import 'package:caracolibras/app/modules/home/presenter/home_page.dart';
import 'package:caracolibras/app/modules/home/presenter/home_store.dart';
import 'package:caracolibras/app/modules/home/presenter/view/module_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends WidgetModule {
  @override
  void binds(i) {
    i.add<HomeStore>(HomeStore.new);

    //GetModules
    i.addSingleton<IGetModulesDataSource>(
      GetModulesDatasourceImpl.new,
    );
    i.addSingleton<IGetModulesRepository>(
      GetModulesRepositoryImpl.new,
    );
    i.addSingleton<IGetModulesUsecase>(
      IGetModulesUsecaseImpl.new,
    );
    
    //GetContentModule
    i.addSingleton<IGetContentModuleDataSource>(
      GetContentModuleDatasourceImpl.new,
    );
    i.addSingleton<IGetContentModuleRepository>(
      GetContentModuleRepositoryImpl.new,
    );
    i.addSingleton<IGetContentModuleUsecase>(
      IGetContentModuleUsecaseImpl.new,
    );

  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (ctx) => const HomePage(),
      transition: TransitionType.leftToRightWithFade,
    );

    r.child('/view', child: (ctx) => ModuleView(module: r.args.data as ModuleModel));
  }

  @override
  Widget get view => HomePage();
}
