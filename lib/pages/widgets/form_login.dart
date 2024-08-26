import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
final GlobalKey<FormState> _stateForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5.0)));
    const inputTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );
    return Scaffold(
      backgroundColor: const Color.fromRGBO(36, 41, 51, 1),
      body: Container(
        width: double.infinity,
        height: 640,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/background-image.png'))),
            
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Form(
              key: _stateForm,
              child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Usuario',
                        style: inputTextStyle,
                      ),
                      SizedBox(
                          width: 228,
                          height: 41,
                          child: TextFormField(
                              style: const TextStyle(),
                              decoration: inputDecoration,
                              validator: (value) {
                                   final userRegex = RegExp(r'^[a-zA-Z0-9._-]{6,30}$');
                                if(!userRegex.hasMatch(value!)) {
                                  return 'no pasa';
                                }else {
                                  return null;
                                }
                              }
                              )),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Contraseña', style: inputTextStyle),
                      SizedBox(
                        width: 228,
                        height: 41,
                        child: TextFormField(
                        //  obscureText: true,
                          decoration: inputDecoration,
                          validator: (value) {
                             final passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                             if(!passwordRegex.hasMatch(value!)) {
                              return 'no pasa';
                             }if (value.isEmpty){
                              return 'ok';
                             } return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 32),
                      width: 101,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          if(_stateForm.currentState!.validate()) {
                            print ('ingresando...');
                          }else {
                            print ('no paso el formulario');
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              const Color.fromRGBO(101, 85, 147, 1)),
                        ),
                        child: const Text('Ingresar',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            )),
                      )),
                  const SizedBox(height: 32),
                  const Text(
                    '¿Olvidasre tu contraseña?',
                    style: inputTextStyle,
                  ),
                ],
            )
            ),
      
           Column(
            children: [
              Container(
                 padding: const EdgeInsets.only(top: 50.0),
              width: 110,child: Image.asset('lib/assets/images/advisor_image.png')),
              Container(
                 padding: const EdgeInsets.only(bottom: 25.0),
                child: const Text('Advisor', style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.white
                ),),
              )
            ],
            
            ),
   
          
          ],
        ),
      )
        
          
    );
  }
}
