import 'package:flutter/material.dart';
import 'package:quiz_123230092/screen/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usmController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  bool islogin = false;

  void _login(){
    String usm = _usmController.text;
    String pw = _pwController.text;

    if(usm == "092" && pw == "092"){
      setState(() {
        islogin = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Login berhasil")
          )
      );
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(usm: usm),
          ),
        );
    }else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Login Gagal")
            )
        );
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Login", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Welcome to UjangResto"),
              _usmField(_usmController),
              _pwField(_pwController),
              _btnLogin()
            ],
          ),
        ),
      )
    );
  }

  Widget _usmField(TextEditingController usm){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: usm,
        decoration: InputDecoration(
          hintText: "Username",
          contentPadding: EdgeInsets.all(5),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))
        )
      ),
    );
  }

  Widget _pwField(TextEditingController pw){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: pw,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password",
          contentPadding: EdgeInsets.all(8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))
        ),
      ),
    );
  }

  Widget _btnLogin(){
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _login, 
          child: Text("Login")),
    );
  }
}