import 'package:flutter/material.dart';
import 'package:food_box/ui/widgets/bigtext.widget.dart';
import 'package:food_box/ui/widgets/smalltext.widget.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                    image: AssetImage("assets/image/logo.png"),
                  width: 120,
                  height: 100,
                ),
                const SizedBox(height: 5,),
                // email input
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email, color: Theme.of(context).primaryColor,)
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20,),
                // password input
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.key, color: Theme.of(context).primaryColor,)
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                // submit button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: BigText(text: 'Login',color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SmallText(text: 'Forgot password?'),
                    ],
                  ),
                ),

                const SizedBox(height: 25,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Container(
                    height: 2,
                    color: Colors.red[200],
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(text: "Don't have account?"),
                    SizedBox(width: 3,),
                    SmallText(text: "Register", color: Theme.of(context).primaryColor,),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}
