import 'package:energy_measures_marketplace/data/models/measures.dart';

abstract class MeasuresDbInterface {

  Future<bool> createDocument(Measures name);
}