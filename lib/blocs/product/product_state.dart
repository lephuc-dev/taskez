import 'package:equatable/equatable.dart';
import '../../models/models.dart';

class ProductState extends Equatable {
  final List<ProductModel>? list;

  ProductState({ProductState? state, final List<ProductModel>? list}) :
        list = list ?? state?.list;

  @override
  List<Object?> get props => [list];
}