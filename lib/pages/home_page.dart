import 'package:flutter/material.dart';
import 'package:imc_app/services/app_storage.dart';
import 'package:imc_app/services/calcular_imc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = "esperando...";
  var pesoController = TextEditingController(text: "");
  var alturaController = TextEditingController(text: "");
  double peso = 0;
  double altura = 0;
  AppStorage storage = AppStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    result =
        await storage.getIMC() == "" ? "esperando..." : await storage.getIMC();
    peso = await storage.getPeso();
    altura = await storage.getAltura();
    pesoController.text = peso == 0 ? "" : peso.toString();
    alturaController.text = altura == 0 ? "" : altura.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("IMC App"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "IMC claculator",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: pesoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Peso"),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Altura"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () async {
                    try {
                      result = CalcularImc.calcular(
                          double.parse(pesoController.text),
                          double.parse(alturaController.text));
                      await storage.setPeso(double.parse(pesoController.text));
                      await storage
                          .setAltura(double.parse(alturaController.text));
                      await storage.setIMC(result);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "Dados Salvos!",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.green,
                      ));
                      carregarDados();
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "Erro ao calcular!",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.green[300]),
                      elevation: const WidgetStatePropertyAll(5),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Resultado: ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    result,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
