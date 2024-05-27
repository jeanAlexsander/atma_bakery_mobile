import 'package:atma_bakery_mobile/constraints.dart';
import 'package:atma_bakery_mobile/main%20page/customer/customer%20profile/customer_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerProfileView extends StatefulWidget {
  const CustomerProfileView({Key? key}) : super(key: key);

  @override
  State<CustomerProfileView> createState() => _CustomerProfileViewState();
}

class _CustomerProfileViewState extends State<CustomerProfileView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late Future<SharedPreferences> _prefs;

  bool _isPasswordVisible = true;

  @override
  void initState() {
    super.initState();
    _prefs = SharedPreferences.getInstance();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final SharedPreferences prefs = await _prefs;
    final String? firstName = prefs.getString('first_name');
    final String? lastName = prefs.getString('last_name');
    final String? email = prefs.getString('email');
    final String? password = prefs.getString('password_hash');

    setState(() {
      String fullName = '$firstName $lastName';
      _nameController.text = fullName;
      _emailController.text = email ?? 'email';
      _passwordController.text = password ?? 'password';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'My Profile',
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Icon(
            Icons.camera_front_rounded,
            size: 200,
          ),
        ),
        FutureBuilder<SharedPreferences>(
          future: _prefs,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Error');
            } else {
              return Container(
                height: 400,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        hintText: "Enter your Name",
                      ),
                      enabled: false,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: "Enter your email",
                      ),
                      enabled: false,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: "Enter your Password",
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
                      enabled: false,
                    ),
                  ],
                ),
              );
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    Colors.blue,
                  ),
                ),
                child: const Text(
                  'Update',
                  style: kButtonLoginStyle,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  CustomerController.sendEmail();
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    Colors.blue,
                  ),
                ),
                child: const Text(
                  'Change',
                  style: kButtonLoginStyle,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
