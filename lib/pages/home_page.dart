import 'package:flutter/material.dart';
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
                  decoration: InputDecoration(hintText: "Peso"),
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
                  onPressed: () {
                    try {
                      setState(() {
                        result = CalcularImc.calcular(
                            double.parse(pesoController.text),
                            double.parse(alturaController.text));
                      });
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
                  Text(
                    "Resultado: ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 20),
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
