import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik_clean/user/domain/useCases/user_usecases.dart';

import '../register/register_screen.dart';



class LoginScreen extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
            child: Column(
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
                const Text(
                  "TokTik",
                  style: TextStyle(
                    fontSize: 47,
                    fontFamily: "KoHo",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    "Iniciar sesión",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "KoHo",
                    ),
                  ),
                ),
                const SizedBox(height: 45),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(239, 242, 243, 210), // Color crema para el fondo
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.orange, width: 2.0), // Contorno de color naranja
                  ),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Color.fromARGB(255, 177, 177, 177)), // Color del hintText
                      border: InputBorder.none, // Eliminar el borde predeterminado del TextFormField
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Agregar espacio interno
                    ),
                    style: const TextStyle(color: Colors.black, height: 1.5),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(239, 242, 243, 210),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.orange, width: 2.0),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Color.fromARGB(255, 177, 177, 177)), // Color del hintText
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    style: const TextStyle(color: Colors.black, height: 1.5),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {},
                  child: const Text(
                    'Iniciar sesión',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Si no tienes cuenta puedes'),
                InkWell(
                  child: const Text(
                    'Registrarte',
                    style: TextStyle(
                      color: Color.fromARGB(255, 148, 47, 47),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
