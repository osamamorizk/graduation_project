import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'diet_cubit_state.dart';

class DietCubitCubit extends Cubit<DietCubitState> {
  DietCubitCubit() : super(DietCubitInitial());
}
