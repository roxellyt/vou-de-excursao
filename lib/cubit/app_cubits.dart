// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:roxellytavaresp1/cubit/app_cubit_states.dart';
import 'package:roxellytavaresp1/model/data_model.dart';
import 'package:roxellytavaresp1/pages/detail_page.dart';
import 'package:roxellytavaresp1/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  DetailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
