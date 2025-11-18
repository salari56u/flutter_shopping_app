import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottomnav_state.dart';

class BottomnavCubit extends Cubit<int> {
  BottomnavCubit() : super(0);

  int screenIndex = 0;

  void onTab(int index)
  {
    emit(screenIndex=index);
  }
}
