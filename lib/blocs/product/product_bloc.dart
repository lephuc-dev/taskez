import '../../base/base.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';
import '../blocs.dart';

class ProductBloc extends BaseBloc<ProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository);

  Stream<List<ProductModel>?> get list => stateStream.map((event) => event.list);

  Future<void> loadData() async {
    emitLoading(true);

    await productRepository
        .getData()
        .then((value) => emit(ProductState(state: state, list: value)))
        .catchError((error) => {})
        .whenComplete(() => emitLoading(false));
  }

  Future<void> addData(String name, String price) async {
    emitLoading(true);
    try {
      await productRepository.addProduct(name: name, price: price);
      emitLoading(false);
    } catch (e) {
      emitLoading(false);
    }
  }
}
