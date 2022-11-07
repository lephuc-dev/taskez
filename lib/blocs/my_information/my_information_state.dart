import 'package:equatable/equatable.dart';

class MyInformationState extends Equatable {
  final int? indexPage;

  MyInformationState({
    MyInformationState? state,
    int? indexPage,
  }) : indexPage = indexPage ?? state?.indexPage;

  @override
  List<Object?> get props => [indexPage];
}
