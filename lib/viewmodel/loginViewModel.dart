part of 'viewmodel.dart';

class LoginViewModel extends ChangeNotifier{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? validateEmail() {
    if (emailController.text.isEmpty) {
      return "Please enter your email";
    }
    // Validasi format email
    String emailPattern = r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    if (!RegExp(emailPattern).hasMatch(emailController.text)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  String? validatePassword() {
    if (passwordController.text.isEmpty) {
      return "Please enter your password";
    }
    if (passwordController.text.length < 6) {
      return "Password must be at least 6 characters";
    }
    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$').hasMatch(passwordController.text)) {
      return "Password must contain letters and numbers";
    }
    return null;
  }

  String? validateLoginPassword() {
    if (passwordController.text.isEmpty) {
      return "Please enter your password";
    }
    return null;
  }

  String? validateConfirmPassword() {
    if (confirmPasswordController.text.isEmpty) {
      return "Please confirm your password";
    }
    if (passwordController.text != confirmPasswordController.text) {
      return "Passwords do not match";
    }
    return null;
  }
  String? validateRegisterForm() {
    return validateEmail() ?? validatePassword() ?? validateConfirmPassword();
  }
  String? validateLoginForm() {
    return validateEmail() ?? validateLoginPassword();
  }
  Future<void> registerUser() async {
    final error = validateRegisterForm();
    if (error != null) {
      throw (error); // Tangani error di UI
    }

    _isLoading=true;
    notifyListeners();
    final FirebaseAuthService authService = FirebaseAuthService();
    try{
      final User? user = await authService.signUpWithEmail(emailController.text, passwordController.text);
      final UserRepository userRepository = UserRepository();
      if (user != null) {
        UserModel userModel = UserModel(
          id: user.uid,
          username: '',
          email: user.email ?? '',
          phone: '', // Nama bisa ditambahkan nanti
        );
        await userRepository.createUser(userModel);
        print('Registrasi berhasil untuk user ID: ${user.uid}');
      }
    }catch(e){
      rethrow;
    }finally{
      _isLoading=false;
      notifyListeners();
    }
  }
  Future<void> loginUser() async {
    final error = validateLoginForm();
    if (error != null) {
      throw (error); // Tangani error di UI
    }
    _isLoading = true;
    notifyListeners();
    final FirebaseAuthService authService = FirebaseAuthService();
    try{
      final User? user = await authService.signInWithEmail(emailController.text, passwordController.text);
      final UserRepository userRepository = UserRepository();
      if (user != null) {
        UserModel? userModel = await userRepository.readUserbyUid(user.uid);

        if (userModel != null) {
          print('Login berhasil. Nama user: ${userModel.id}');
        } else {
          print('Data user tidak ditemukan di Firestore.');
        }
      }
    }catch(e){
      rethrow;
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}