import 'package:caracolibras/app/core/service/client/client_http_dio_impl.dart';
import 'package:caracolibras/app/core/service/client/i_client_http.dart';
import 'package:caracolibras/app/core/service/local_file/file_access.dart';
import 'package:caracolibras/app/core/service/local_file/i_file_access.dart';
import 'package:caracolibras/app/core/service/local_storage/i_local_storage.dart';
import 'package:caracolibras/app/core/service/local_storage/local_storage_hive_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'pages/splash/splash_page.dart';

class CoreModule extends Module {
  @override
  void binds(i) {
    i.addInstance(Dio());
    i.addInstance(ImagePicker());
    i.add<IFileAccess>(FileAccess.new);
    i.addSingleton<IClientHttp>(ClientHttpDioImpl.new);
    i.addSingleton<ILocalStorage>(LocalStorageHiveImpl.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
  }
}
