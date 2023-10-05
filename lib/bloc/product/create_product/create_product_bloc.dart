import 'package:bloc/bloc.dart';
import 'package:flutter_auth_bloc/data/models/response/product_response_model.dart';
import 'package:meta/meta.dart';

import 'package:flutter_auth_bloc/data/datasources/product_datasource.dart';
import 'package:flutter_auth_bloc/data/models/request/product_model.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  final ProductDatasource productDatasource;
  CreateProductBloc(
    this.productDatasource,
  ) : super(CreateProductInitial()) {
    on<DoCreateProductEvent>((event, emit) async {
      emit(CreateProductLoading());
      final result = await productDatasource.createProduct(event.productModel);
      emit(CreateProductLoaded(productResponseModel: result));
    });
  }
}
