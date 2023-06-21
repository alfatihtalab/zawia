import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_version_state.dart';

class AppVersionCubit extends Cubit<AppVersionState> {
  AppVersionCubit() : super(AppVersionInitial());
}
