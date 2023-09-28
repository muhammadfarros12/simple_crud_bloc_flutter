part of 'create_product_bloc.dart';

@immutable
sealed class CreateProductEvent {}

class DoCreateProductEvent extends CreateProductEvent {
  final ProductModel productModel;
  DoCreateProductEvent({
    required this.productModel,
  });
}
