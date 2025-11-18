import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'intro_state.dart';

class IntroCubit extends Cubit<int> {
  int cuurectIndex=0;
  IntroCubit() : super(0);

  chageindex(int index)
  {
    emit(cuurectIndex=index);
  }
}
