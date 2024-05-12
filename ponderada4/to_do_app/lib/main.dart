import 'package:flutter/material.dart';
import 'package:to_do_app/segunda_tela.dart';
import 'package:http/http.dart' as http; // Importa o pacote http
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    final Map<String, String> data = {
      'email': email,
      'password': password,
    };

    final jsonData = jsonEncode(data);    

    print('Dados do corpo da requisição:');
    print('Email: $email');
    print('Password: $password');

    final response = await http.post(
      Uri.parse('http://192.168.110.237:8000/users/login'),
      headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonData,
  );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login falhou'),
        ),
      );
    }
  }

  Future<void> _signup(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

      // Crie um mapa com os dados a serem enviados
    final Map<String, String> data = {
      'email': email,
      'password': password,
    };

      // Converta o mapa para uma string JSON
    final jsonData = jsonEncode(data);

    print('Dados do corpo da requisição:');
    print('Email: $email');
    print('Password: $password');

    final response = await http.post(
      Uri.parse('http://192.168.110.237:8000/users/signup'),
      headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonData,
  );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cadastro realizado com sucesso!'),
        ),
      );
    } else {
      print('Erro no signup: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Falha ao cadastrar. Tente novamente.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController, // Adiciona o controller ao campo de texto
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController, // Adiciona o controller ao campo de texto
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _signup(context);
                  },
                  child: const Text('Sign Up'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _login(context);
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}