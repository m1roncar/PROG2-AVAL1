import 'genotype.dart';
int id = 0;

class Individual extends Genotype {
  Individual get genotype => (Individual(geno));
  String name = 'Indiv';
  Individual(String super.geno, [this.name = 'Indiv']){
    if (name == 'Indiv') {
      id++;
      this.name = 'Indiv' + id.toString();
    }
  }

  @override
  String toString() {
    return '$name(${bloodType})';
  }
}