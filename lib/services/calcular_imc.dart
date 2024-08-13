import 'dart:math';

class CalcularImc {
  // double peso = ;
  // double altura;

  // CalcularImc(this.peso, this.altura);

  static String calcular(peso, altura) {
    double imc = peso / pow(altura, 2);
    String status = "";
    if (imc < 16) {
      status = "MAGREZA GRAVE";
    } else if (imc >= 16 && imc < 17) {
      status = "MAGREZA MODERADA";
    } else if (imc >= 17 && imc < 18.5) {
      status = "MAGREZA LEVE";
    } else if (imc >= 18.5 && imc < 25) {
      status = "SAUDÁVEL";
    } else if (imc >= 25 && imc < 30) {
      status = "SOBREPESO";
    } else if (imc >= 30 && imc < 35) {
      status = "OBESIDADE GRAU I";
    } else if (imc >= 35 && imc < 40) {
      status = "OBESIDADE GRAU II (SEVERA)";
    } else {
      status = "OBESIDADE GRAU III (MÓRBIDA)";
    }
    return status;
  }
}
