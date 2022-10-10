import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_login_screen/core/widgets/responsive_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveScreen.isDekstop(context) ? 128 : 64,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/ic_pexel.png"),
                  height: 48,
                  width: 48,
                ),
                const SizedBox(height: 32),
                Text(
                  "Hello Again!",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  "Aenean bibendum turpis at ligula finibus interdum. Aenean et lectus sed libero imperdiet auctor.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 32),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text("Email"),
                    suffixIcon: const Icon(CupertinoIcons.mail),
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text("Passoword"),
                    suffixIcon: const Icon(CupertinoIcons.lock),
                  ),
                  obscureText: true,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    Text(
                      "Remeber Me",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Expanded(child: SizedBox()),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Forgot Password ?"),
                    )
                  ],
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text("Login"),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    icon: const Image(
                      image: AssetImage(
                        "assets/ic_google.png",
                      ),
                      width: 24,
                      height: 24,
                    ),
                    label: const Text("Login with Google"),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account yet?",
                  style: Theme.of(context).textTheme.button,
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {},
                  child: const Text("Sign Up"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
