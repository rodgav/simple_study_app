import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_group/util/routes.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextEditCtrl = TextEditingController();
  final _passwTextEditCtrl = TextEditingController();

  @override
  void initState() {
    _emailTextEditCtrl.text = 'estudiante@colegio.edu.pe';
    _passwTextEditCtrl.text = '12345678';
    super.initState();
  }

  @override
  void dispose() {
    _emailTextEditCtrl.dispose();
    _passwTextEditCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                ),
              )),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20)),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _emailTextEditCtrl,
                        decoration: const InputDecoration(
                            labelText: 'Correo electronico',
                            hintText: 'estudiante@colegio.edu.pe'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su correo electronico';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _passwTextEditCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Contraseña',
                          hintText: '12345678',
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su contraseña';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (_emailTextEditCtrl.text ==
                                      'estudiante@colegio.edu.pe' &&
                                  _passwTextEditCtrl.text == '12345678') {
                                context.go(Routes.coursesRoute);
                              }
                            }
                          },
                          child: const Text('Ingresar')),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  'assets/images/logoweb.png',
                  height: 200,
                ),
              )),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
