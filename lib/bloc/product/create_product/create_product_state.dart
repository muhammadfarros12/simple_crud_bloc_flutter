part of 'create_product_bloc.dart';

@immutable
sealed class CreateProductState {}

final class CreateProductInitial extends CreateProductState {}
final class CreateProductLoading extends CreateProductState {}
final class CreateProductLoaded extends CreateProductState {
  final ProductResponseModel productResponseModel;

  CreateProductLoaded({required this.productResponseModel});
}
final class CreateProductError extends CreateProductState {}
