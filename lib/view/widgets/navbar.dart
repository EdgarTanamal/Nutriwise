part of'widgets.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0; // Track the currently selected index

  // Function to handle index changes
  void _onItemTapped(int index) {
    // Hanya ubah state jika indeks yang dipilih berbeda dari indeks aktif
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      switch (index) {
        case 0: // Home
        // Periksa apakah sudah berada di halaman Home
          if (ModalRoute.of(context)?.settings.name != '/home') {
            Navigator.pushNamed(context, '/home');
          }
          break;
        case 1: // Search
        // Periksa apakah sudah berada di halaman Search
          if (ModalRoute.of(context)?.settings.name != '/search') {
            Navigator.pushNamed(context, '/search');
          }
          break;
        case 2: // Camera
        // Periksa apakah sudah berada di halaman Camera
          if (ModalRoute.of(context)?.settings.name != '/camera') {
            Navigator.pushNamed(context, '/camera');
          }
          break;
        case 3: // Article
        // Periksa apakah sudah berada di halaman History
          if (ModalRoute.of(context)?.settings.name != '/article') {
            Navigator.pushNamed(context, '/article');
          }
          break;
        case 4: // Profile
        // Periksa apakah sudah berada di halaman Profile
          if (ModalRoute.of(context)?.settings.name != '/profile') {
            Navigator.pushNamed(context, '/profile');
          }
          break;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Hindari perubahan ukuran
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,

        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
                AppPicture.home,
              width: 20,
              height: 20,
            ),
            activeIcon: Image.asset(
                AppPicture.homeActive,
              width: 20,
              height: 20,
            ),
            label: 'home',

          ),

          BottomNavigationBarItem(
            icon: Image.asset(
                AppPicture.search,
              width: 20,
              height: 20,
            ),
            activeIcon: Image.asset(
                AppPicture.searchActive,
              width: 20,
              height: 20,
            ),
              label: 'search'

          ),

            BottomNavigationBarItem(
            icon: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.button,
                borderRadius: BorderRadius.all(Radius.circular(24))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                    AppPicture.camera,
                  width: 16,
                  height: 16,
                ),
              ),
            ),
                label: 'camera'


          ),

            BottomNavigationBarItem(
            icon: Image.asset(
                AppPicture.history,
              width: 20,
              height: 20,
            ),
            activeIcon: Image.asset(
                AppPicture.historyActive,
              width: 20,
              height: 20,
            ),
                label: 'history'


          ),

             BottomNavigationBarItem(
            icon: Image.asset(
                AppPicture.user,
              width: 20,
              height: 20,
            ),
            activeIcon: Image.asset(
                AppPicture.userActive,
              width: 20,
              height: 20,
            ),
                 label: 'Profile'


          ),


        ]);
  }
}
