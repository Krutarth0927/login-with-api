
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginwithapi/login_controller.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Logincontroller controller = Get.put(Logincontroller());

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Center(child: Text('Login Form' ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.emailcontroller.value,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              TextFormField(
                controller: controller.passwordcontroller.value,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 50),
              Obx(() {
               return InkWell(
                 onTap: (){
                   controller.loginApi();
                 },
                 child: controller.loading.value ? CircularProgressIndicator() : Container(
                   color: Colors.yellow,
                   height: 40,
                   child: Center(
                     child: Text('Login'),
                   ),
                 ),
               ) ;
              })
            ],
          ),
        ),
      ),
    );
  }
}
