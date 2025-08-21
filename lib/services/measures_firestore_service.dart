import 'package:energy_measures_marketplace/data/models/measures.dart';
import 'package:energy_measures_marketplace/domain/interfaces/measures_db_interface.dart';

class MeasuresFirestoreService implements MeasuresDbInterface{
  @override
  Future<bool> createDocument(Measures name) {
    // TODO: implement createDocument
    throw UnimplementedError();
  }
}