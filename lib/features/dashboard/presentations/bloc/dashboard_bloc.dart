import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../../domain/usecases/get_dashboard_data_use_cases.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDashboardDataUseCase getDashboardDataUseCase;

  DashboardBloc(this.getDashboardDataUseCase)
      : super(DashboardInitial()) {
    on<LoadDashboardEvent>(_onLoadDashboard);
  }

  Future<void> _onLoadDashboard(
    LoadDashboardEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading());

    final result = await getDashboardDataUseCase();

    result.fold(
      (failure) {
        emit(DashboardError(failure.message));
      },
      (data) {
        emit(DashboardLoaded(data));
      },
    );
  }
}
