import 'package:airplane/models/destination.dart';
import 'package:airplane/services/destination_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void fecthDestinations() async {
    try {
      emit(DestinationLoading());

      List<DestinationModel> destinationModels =
          await DestinationService().fetchDestination();

      emit(DestinationSuccess(destinationModels));
    } catch (e) {
      emit(DestinationFailed(e.toString()));
    }
  }
}
