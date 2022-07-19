import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void selectSeat(String id) {
    if (!isSelected(id)) {
      print('prev id $state');
      state.add(id);
    } else {
      state.remove(id);
    }

    print('new id $state');
    emit(List.from(state));
  }

  bool isSelected(String id) {
    int index = state.indexOf(id);

    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }
}
