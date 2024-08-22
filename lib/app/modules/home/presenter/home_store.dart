import 'package:caracolibras/app/app_widget_store.dart';
import 'package:caracolibras/app/core/utils/functions.dart';
import 'package:caracolibras/app/modules/home/domain/repositories/ipost_expense_repository.dart';
import 'package:caracolibras/app/modules/home/domain/usecases/get_content_usecase.dart';
import 'package:caracolibras/app/modules/home/domain/usecases/get_modules_usecase.dart';
import 'package:caracolibras/app/modules/home/external/model/content_module_model.dart';
import 'package:caracolibras/app/modules/home/external/model/module_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final AppWidgetStore appStore = Modular.get<AppWidgetStore>();

  final IGetModulesUsecase getModulesUsecase;
  final IGetContentModuleUsecase getContentModuleUsecase;

  _HomeStoreBase(
      {required this.getModulesUsecase,
      required this.getContentModuleUsecase,}) {}

  @observable
  bool loading = false;
  @observable
  ObservableList<ModuleModel> modulesLbr = ObservableList<ModuleModel>();
  @observable
  ObservableList<ContentModuleModel> contentModule = ObservableList<ContentModuleModel>();


  @action
  Future<void> getModules() async {
    loading = true;
    modulesLbr.clear();
    var result = await getModulesUsecase();

    result.fold((l) => showSnackbarError(l.message), (r) async {
      var modules = r
          .map<ModuleModel>((e) => ModuleModel(
                id: e.id,
                category: e.category,
                title: e.title,
                date: e.date,
                tags: e.tags,
                reference: e.reference,
              ))
          .toList();
      modulesLbr.addAll(modules);
    });
    loading = false;
  }

  @action
  Future<void> getContentModule(int id) async{
    contentModule.clear();
    var result = await getContentModuleUsecase(id);

    result.fold((l) => showSnackbarError(l.message), (r) async {
      contentModule.addAll(r);
    });
  }

  //Salva o gasto diário no banco de dados
  Future<void> saveDailyExpense(ModuleModel dailyExpenseEntity) async {
    // var result = await postModulesRepository(dailyExpenseEntity);
    // result.fold((l) => showSnackbarError('Erro ao salvar o serviço!'), (r) {});
  }

  //Adiciona um gasto diário
  @action
  Future<void> addExpense() async {
    // var module = ModulesModel(
    //   id: DateTime.now().millisecondsSinceEpoch,
    //   date: ,
    //   title: titleController.text,
    //   amount: double.parse(amountController.text.replaceAll(',', '.')),
    // );

    // await saveDailyExpense(module);
  }

  //Atualiza um gasto diário
  @action
  Future<void> updateExpense(ModuleModel expense) async {
    // var dailyExpense = ModulesModel(
    //   id: expense.id,
    //   date: date,
    //   title: titleController.text,
    //   amount: double.parse(amountController.text.replaceAll(',', '.')),
    // );

    // var result = await postModulesRepository(dailyExpense);

    // result.fold((l) => showSnackbarError('Erro ao atualizar o serviço!'),
    //     (r) {
    // });

    await getModules();
  }

  //Deleta um gasto diário
  @action
  Future<void> deleteExpense(int id) async {
    // var result = await postRemoveExpenseByIdRepository(id);
    // result.fold((l) => showSnackbarError('Erro ao deletar o serviço!'),
    //     (r) async {
    //   // showSnackbarError('Saída deletada com sucesso!');
    //   await getModules();
    // });
  }
}
