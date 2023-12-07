import 'package:get_it/get_it.dart';
import 'package:task_management/get_it/get_it_register.dart';
import 'package:task_management/views/create_task/create_task_view_model.dart';
import 'package:task_management/views/home_screen/home_page/home_page_view_model.dart';
import 'package:task_management/views/home_screen/home_view_model.dart';

class ViewModelRegister extends IGetItRegister {
  final GetIt instance = GetIt.instance;

  @override
  Future<void> register() async {
    instance.registerFactory<HomeViewModel>(
      () => HomeViewModel(),
    );
    instance.registerFactory<HomePageViewModel>(
      () => HomePageViewModel(),
    );
    instance.registerFactory<CreateTaskViewModel>(
      () => CreateTaskViewModel(),
    );
  }
}
