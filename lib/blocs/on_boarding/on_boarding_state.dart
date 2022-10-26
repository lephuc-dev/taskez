import 'package:equatable/equatable.dart';

class OnBoardingState extends Equatable {
  final int? indexPage;

  OnBoardingState({
    OnBoardingState? state,
    int? indexPage,
  }) : indexPage = indexPage ?? state?.indexPage;

  @override
  List<Object?> get props => [indexPage];
}
