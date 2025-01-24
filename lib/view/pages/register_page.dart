part of 'pages.dart';

class RegisterPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>LoginViewModel(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Sign up to create account',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Start Your Healthy Life With Us!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32),
                    Consumer<LoginViewModel>(
                      builder: (context, loginViewModel, _){
                        return Column(
                          children: [
                            Customformfield(
                              question: "Email",
                              selectedController: loginViewModel.emailController,
                              hintText: "Email Address",
                              validator: (_)=> loginViewModel.validateEmail(),
                            ),
                            SizedBox(height: 16),
                            Customformfield(
                              question: "Password",
                              selectedController: loginViewModel.passwordController,
                              hintText: "Password",
                              isPrivate: true,
                              validator: (_)=> loginViewModel.validatePassword(),

                            ),
                            SizedBox(height: 16),
                            Customformfield(
                              question: "Confirm Password",
                              selectedController: loginViewModel.confirmPasswordController,
                              hintText: "Password",
                              isPrivate: true,
                              validator: (_)=> loginViewModel.validateConfirmPassword(),
                            ),
                            SizedBox(height: 24),
                            Custombutton(
                              detail: "Continue",
                              route: '/introsurvey',
                              formKey: _formKey,
                              submitForm: loginViewModel.registerUser,
                              useLoading: loginViewModel.isLoading,
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('have a account? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forgot password',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('OR'),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: Text('Continue with Google'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        side: BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
