import 'package:get_it/get_it.dart';
import 'package:velocio/src/common/di/cubit_model.dart';
import 'package:velocio/src/common/di/data_source_model.dart';
import 'package:velocio/src/common/di/interactors_model.dart';
import 'package:velocio/src/common/di/page_module.dart';
import 'package:velocio/src/common/di/repositories_module.dart';


GetIt get i => GetIt.instance;

void injectDependencies() {
  initDataSource();
  initRepositories();
  initInteractors();
  initSharedCubits();
  initCubits();
  initPages();
}
