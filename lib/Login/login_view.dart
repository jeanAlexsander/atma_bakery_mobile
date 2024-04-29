import 'package:atma_bakery_mobile/Login/login_controller.dart';
import 'package:atma_bakery_mobile/constraints.dart';
import 'package:atma_bakery_mobile/main%20page/admin/home%20page/home_page_view.dart';
import 'package:atma_bakery_mobile/main%20page/customer/home%20page/customer_home_page._view.dart';
import 'package:atma_bakery_mobile/main%20page/mo/home%20page/mo_home_page_view.dart';
import 'package:atma_bakery_mobile/main%20page/owner/home%20page/owner_home_page_view.dart';
import 'package:atma_bakery_mobile/register/register_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isPasswordVisible = true;
  // bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showErrorDialog(String message, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _login() async {
    try {
      final email = _emailController.text;
      final password = _passwordController.text;
      final result = await LoginController().loginController(email, password);
      switch (result.data.first.roleName) {
        case "admin":
          {
            // ignore: use_build_context_synchronously
            await Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AdminHomepage(),
              ),
            );
          }
          break;
        case "customer":
          {
            // ignore: use_build_context_synchronously
            await Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomerHomepage(),
              ),
            );
          }
          break;
        case "manager":
          {
            // ignore: use_build_context_synchronously
            await Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MOHomepage(),
              ),
            );
          }
          break;
        case "owner":
          {
            // ignore: use_build_context_synchronously
            await Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const OwnerHomePage(),
              ),
            );
          }
          break;
      }
    } catch (e) {
      _showErrorDialog("Login Failed", "$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Logo Kue.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: "Enter your email",
                    labelStyle: kTextFieldStyle,
                    hintStyle: kTextFieldStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  style: kTextFieldStyle.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: "Enter your Password",
                    labelStyle: kTextFieldStyle,
                    hintStyle: kTextFieldStyle,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: _isPasswordVisible,
                  style: kTextFieldStyle.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: kTextFieldStyle.copyWith(
                      color: Colors.blue,
                      fontSize: 14,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // setState(() {
                    //   _isLoading = true;
                    // });
                    await _login();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(98, 102, 206, 244),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(
                      const Size(
                        double.infinity,
                        50,
                      ),
                    ),
                  ),
                  child:
                      // _isLoading
                      //     ? const CircularProgressIndicator()
                      //     :
                      const Text(
                    'Login',
                    style: kButtonLoginStyle,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account yet?",
                      style: kTextFieldStyle.copyWith(
                        fontSize: 14,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterView(),
                          ),
                        );
                      },
                      child: Text(
                        "Register here",
                        style: kTextFieldStyle.copyWith(
                          color: Colors.blue,
                          fontSize: 14,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
