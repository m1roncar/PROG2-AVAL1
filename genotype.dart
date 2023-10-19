import 'dart:core';

class Genotype{
  final String geno;

  Genotype(this.geno){
    if (RegExp(r'\b[A][A]\b|\b[A][i]\b|\b[B][B]\b|\b[B][i]\b|\b[A][B]\b|\b[i][i]\b').hasMatch(geno) == false){
      throw Exception('You must inform a valid genotype value!');
    }
  }

  String get bloodType  {
    if (geno == 'AA' || geno =='Ai'){
      return 'A';}
    else if (geno == 'BB' || geno == 'Bi'){
      return 'B';}
    else if (geno == 'AB'){
      return 'AB';}
    else if (geno == 'ii'){
      return 'O';}
    else {
      return 'Not valid!';
    }
  }

  List<String> get alleles {
    if (geno == 'AA'){
      return ['A'];
      }
    else if (geno == 'Ai'){
      return ['A', 'i'];
    }
    else if (geno == 'BB'){
      return ['B'];
      }
    else if (geno == 'Bi'){
      return ['B', 'i'];
    }
    else if (geno == 'AB'){
      return ['A', 'B'];
      }
    else if (geno == 'ii'){
      return ['i'];
      }
    else {
      return ['Not valid!'];
    }
  }

  List <String> get agglutinogens {
    if (geno == 'AA' || geno =='Ai'){
      return ['A'];}
    else if (geno == 'BB' || geno == 'Bi'){
      return ['B'];}
    else if (geno == 'AB'){
      return ['A, B'];}
    else if (geno == 'ii'){
      return ['i'];}
    else {
      return ['Not valid!'];
    }
  }

  List <String> get agglutinins {
    if (geno == 'AA' || geno =='Ai'){
      return ['B'];}
    else if (geno == 'BB' || geno == 'Bi'){
      return ['A'];}
    else if (geno == 'AB'){
      return [];}
    else if (geno == 'ii'){
      return ['A', 'B'];}
    else {
      return ['Not valid!'];
    }
  }

  List<String> offsprings(Genotype other){
    String firstComb,secondComb, thirdComb, fourthComb;
    RegExp alphabeticalOrder = RegExp(r'\b[B][A]\b');
    RegExp recessiveOrder = RegExp(r'\b[i][A]|\b[i][B]');
    List<String> genoMod = geno.split('');
    List<String> othergenoMod = other.geno.split('');
    String offspringMatches = [
      genoMod[0], othergenoMod[0], 
      genoMod[0], othergenoMod[1], 
      genoMod[1], othergenoMod[0],
      genoMod[1], othergenoMod[1]].join();
      
    // all allele combinations
    firstComb = offspringMatches.substring(0, 2);
    secondComb = offspringMatches.substring(2, 4);
    thirdComb = offspringMatches.substring(4, 6);
    fourthComb = offspringMatches.substring(6, 8);

    // alphabetical order - A -> B , recessive order - Bi, Ai
    String orderCombinations(String comb){
      if (recessiveOrder.hasMatch(comb) == true && comb != 'ii'){
        comb = comb.split('').reversed.join();
        return comb;
      } else if (alphabeticalOrder.hasMatch(comb) == true){
        comb = comb.split('').reversed.join();
        return comb;
      } else{
        return comb;
      }
    }
    firstComb = orderCombinations(firstComb);
    secondComb = orderCombinations(secondComb);
    thirdComb = orderCombinations(thirdComb);
    fourthComb = orderCombinations(fourthComb);

    //  check if any combinations are equal 
    if (firstComb == secondComb) {
      if (firstComb == thirdComb){
        if (firstComb == fourthComb){
            return ([firstComb]);
        } 
        else {
            return ([firstComb, fourthComb]);
        }
      } 
      else {
        if (thirdComb == fourthComb){
            return ([firstComb, thirdComb]);
          }
        else{
          if (fourthComb == firstComb){
            return ([firstComb, thirdComb]);
          }            
          else{
            return ([firstComb, thirdComb, fourthComb]);
          }
        }
      }
    } 
    else if (firstComb == thirdComb){
      if (firstComb == fourthComb){
            return ([firstComb, secondComb]);
      } else {
          if (fourthComb == secondComb){
            return ([firstComb, secondComb]);
          } else{
            return ([firstComb, secondComb, fourthComb]);
          }
        }
    } else if (firstComb == fourthComb){
        if (thirdComb == secondComb){
            return ([firstComb, secondComb]);
        } else {
            return ([firstComb, secondComb, thirdComb]);
        }
    } else if (secondComb == thirdComb){
        if (secondComb == fourthComb){
          return ([firstComb, secondComb]);
        } else{
          if (fourthComb == firstComb){
            return ([firstComb, secondComb]);
          } else{
            return([firstComb, secondComb, fourthComb]);
          }
        }
    } else if (secondComb == fourthComb){
        if (thirdComb == firstComb){
            return ([firstComb, secondComb]);
        } else{
            return ([firstComb, secondComb, thirdComb]);
        }
    } else if (thirdComb == fourthComb){
        if (firstComb == secondComb){
          return ([firstComb, thirdComb]);
        } else{
          return ([firstComb, secondComb, thirdComb]);
        }
    } else {
      return ([firstComb, secondComb, thirdComb, fourthComb]);
    }
  }


  bool compatible(Genotype other){
    if ((bloodType == 'A') && ((other.bloodType == 'A') || (other.bloodType == 'AB'))){
      return true;
    } else if ((bloodType == 'B') && ((other.bloodType == 'B') || (other.bloodType == 'AB'))){
      return true;
    } else if ((bloodType == 'AB') && (other.bloodType == 'AB')){
      return true;
    } else if (bloodType == 'O'){
      return true;
    } else {
      return false;
    }
  }

}