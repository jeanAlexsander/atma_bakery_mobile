import 'package:atma_bakery_mobile/Login/login_view.dart';
import 'package:atma_bakery_mobile/constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _isPasswordVisible = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController controllerTanggalLahir = TextEditingController();
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    );

    if (picked != null) {
      setState(() {
        controllerTanggalLahir.text =
            DateFormat('yyyy-MM-dd').format(picked).toString().split(" ")[0];
      });
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
                  width: 50,
                  height: 50,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: "Enter your Password",
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
                TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType
                      .number, // Tipe keyboard yang hanya menampilkan angka
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter
                        .digitsOnly // Menerapkan pembatasan input hanya menerima angka
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    hintText: "Enter your Phone Number",
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
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    hintText: "Enter your Last Name",
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
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    hintText: "Enter your First Name",
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
                Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Gender"),
                        Text("Date of Birth"),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CheckboxListTile(
                                  value: isMaleSelected,
                                  onChanged: (newVal) {
                                    setState(() {
                                      isMaleSelected = newVal!;
                                      if (isFemaleSelected) {
                                        isFemaleSelected = false;
                                      }
                                    });
                                  },
                                  title: const Text(
                                    "male",
                                    style: kCheckBoxStyle,
                                  ),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                ),
                                CheckboxListTile(
                                  value: isFemaleSelected,
                                  onChanged: (newVal) {
                                    setState(() {
                                      isFemaleSelected = newVal!;
                                      if (isMaleSelected) {
                                        isMaleSelected = false;
                                      }
                                    });
                                  },
                                  title: const Text(
                                    "female",
                                    style: kCheckBoxStyle,
                                  ),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: IconButton(
                                onPressed: () {
                                  _selectDate();
                                },
                                icon: TextFormField(
                                  controller: controllerTanggalLahir,
                                  enabled: false,
                                  // onTap: _selectDate,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    // suffixIcon: Icon(Icons.calendar_month),
                                    suffix: IconButton(
                                      onPressed: () {
                                        _selectDate();
                                      },
                                      icon: const Icon(Icons.calendar_month),
                                    ),
                                  ),
                                  style: kTextFieldStyle.copyWith(
                                    color: Colors.black,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {},
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
                  child: const Text(
                    'Register',
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
                      "Already have an account?",
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
                            builder: (context) => const LoginView(),
                          ),
                        );
                      },
                      child: Text(
                        "Login",
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
