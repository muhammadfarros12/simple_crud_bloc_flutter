import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_auth_bloc/data/datasources/product_datasource.dart';
import 'package:flutter_auth_bloc/data/models/response/product_response_model.dart';

part 'get_all_product_event.dart';
part 'get_all_product_state.dart';

class GetAllProductBloc extends Bloc<GetAllProductEvent, GetAllProductState> {
  final ProductDatasource productDatasource;
  GetAllProductBloc(
    this.productDatasource,
  ) : super(GetAllProductInitial()) {
    on<DoGetAllProductEvent>((event, emit) async {
      emit(GetAllProductLoading());
      final result = await productDatasource.getAllProduct();
      emit(GetAllProductLoaded(listProduct: result));
    });
  }
}
