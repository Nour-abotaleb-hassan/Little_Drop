import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color mainPurple = Color(0xFF5147B8);
const Color darkPurple = Color(0xFF282453);

void main() {
  runApp(const LittleDropApp());
}

class LittleDropApp extends StatelessWidget {
  const LittleDropApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Little Drop',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: mainPurple),
        scaffoldBackgroundColor: mainPurple,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          backgroundColor: darkPurple,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: mainPurple,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: mainPurple,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(34),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final double imageHeight =
                      (constraints.maxHeight * 0.39)
                          .clamp(220.0, 340.0)
                          .toDouble();

                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 10, 24, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/task_illustration.png',
                              height: imageHeight,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Hello',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 34,
                                height: 1.15,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF202020),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Welcome To Little Drop, where\nyou manage your daily tasks',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF777777),
                                fontSize: 16,
                                height: 1.35,
                              ),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              height: 52,
                              child: ElevatedButton(
                                onPressed: () =>
                                    showMessage(context, 'Login selected'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: mainPurple,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: const StadiumBorder(),
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                child: const Text('Login'),
                              ),
                            ),
                            const SizedBox(height: 14),
                            SizedBox(
                              width: double.infinity,
                              height: 52,
                              child: OutlinedButton(
                                onPressed: () => showMessage(
                                  context,
                                  'Sign Up selected',
                                ),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: darkPurple,
                                  side: const BorderSide(
                                    color: darkPurple,
                                    width: 1.4,
                                  ),
                                  shape: const StadiumBorder(),
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                child: const Text('Sign Up'),
                              ),
                            ),
                            const SizedBox(height: 24),
                            const Text(
                              'Sign up using',
                              style: TextStyle(
                                color: Color(0xFF777777),
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SocialButton(
                                  label: 'f',
                                  color: const Color(0xFF4267A9),
                                  onTap: () => showMessage(
                                    context,
                                    'Facebook selected',
                                  ),
                                ),
                                const SizedBox(width: 15),
                                SocialButton(
                                  label: 'G+',
                                  color: const Color(0xFFDB4A3A),
                                  onTap: () => showMessage(
                                    context,
                                    'Google+ selected',
                                  ),
                                ),
                                const SizedBox(width: 15),
                                SocialButton(
                                  label: 'in',
                                  color: const Color(0xFF1686A8),
                                  onTap: () => showMessage(
                                    context,
                                    'LinkedIn selected',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.label,
    required this.color,
    required this.onTap,
    super.key,
  });

  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42,
      height: 42,
      child: Material(
        color: color,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
