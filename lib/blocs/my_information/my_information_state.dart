import 'package:equatable/equatable.dart';

class MyInformationState extends Equatable {
  final bool? isLoading;
  MyInformationState({MyInformationState? state, bool? isLoading})
      : isLoading = isLoading ?? state?.isLoading;
  @override
  List<Object?> get props => [isLoading];
}
