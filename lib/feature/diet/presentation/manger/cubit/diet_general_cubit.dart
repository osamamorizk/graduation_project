import 'package:bloc/bloc.dart';
import 'package:graduation_project/feature/diet/data/models/diet_gp_model.dart';
import 'package:graduation_project/feature/diet/data/repos/diet_gp_repo/diet_general_plan_repo.dart';
import 'package:meta/meta.dart';

part 'general_diet_cubit_state.dart';

class DietGeneralCubit extends Cubit<DietGeneralCubitState> {
  DietGeneralCubit(this.dietGeneralPlanRepo) : super(GeneralDietCubitInitial());
  final DietGeneralPlanRepo dietGeneralPlanRepo;
  Future<void> getAllDietPlans() async {
    emit(GeneralDietCubitLoading());
    final failureOrSuccess = await dietGeneralPlanRepo.getGeneralDietPlans();
    failureOrSuccess.fold(
      (failure) => emit(GeneralDietCubitFailure(failure.errorMessage)),
      (dietPlans) => emit(GeneralDietCubitSuccess(dietPlans)),
    );
  }
}
