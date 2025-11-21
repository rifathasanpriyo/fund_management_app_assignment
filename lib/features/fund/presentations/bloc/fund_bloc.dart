import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/fund_entity.dart';
import '../../domain/usecases/get_fund_details.dart';

part 'fund_event.dart';
part 'fund_state.dart';

class FundBloc extends Bloc<FundEvent, FundState> {
  final GetFundDetailsUseCase useCase;

  FundBloc(this.useCase) : super(FundInitial()) {
    on<LoadFundEvent>(_loadFund);
  }

  void _loadFund(LoadFundEvent event, Emitter<FundState> emit) async {
    emit(FundLoading());

    final result = await useCase();

    result.fold(
      (failure) => emit(FundError(failure.message)),
      (data) => emit(FundLoaded(data)),
    );
  }
}
