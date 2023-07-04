import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik_clean/user/domain/useCases/user_usecases.dart';
import 'package:toktik_clean/user/presentation/login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
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
                  "Registro",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 45),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(240, 239, 240, 200), // Color crema para el fondo
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.orange, width: 2.0), // Contorno de color naranja
                  ),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      hintText: 'Username',
                      hintStyle: TextStyle(color: Color.fromARGB(255, 177, 177, 177)), // Color del hintText
                      border: InputBorder.none, // Eliminar el borde predeterminado del TextFormField
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Agregar espacio interno
                    ),
                    style: const TextStyle(color: Colors.black, height: 1.5),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(240, 239, 240, 200),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.orange, width: 2.0),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Color.fromARGB(255, 177, 177, 177)), // Color del hintText
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    style: const TextStyle(color: Colors.black, height: 1.5),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(240, 239, 240, 200),
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
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {},
                  child: const Text(
                    'Registrar',
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
                   onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Volver',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}