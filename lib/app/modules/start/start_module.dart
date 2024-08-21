import 'package:flutter_modular/flutter_modular.dart';
// import 'package:caracolibras/app/modules/calculator/caculator_module.dart';

import 'presenter/pages/start/manager_start_store.dart';
import 'presenter/pages/start/mananger_start_page.dart';

class StartModule extends Module {
  @override
  void binds(i) {
    i.add<ManagerStartStore>(ManagerStartStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (ctx) =>
          ManagerStartPage(controller: Modular.get<ManagerStartStore>()),
      transition: TransitionType.leftToRight,
      children: [
        // ModuleRoute('/calculator', module: CalculatorModule()),
      ],
    );
  }
}
