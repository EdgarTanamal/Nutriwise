part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Text(
          '9:41',
          style: TextStyle(color: Colors.green),
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[300],
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Lala',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _buildListTile(Icons.edit, 'Edit Profile'),
                _buildListTile(Icons.settings, 'Settings'),
                _buildListTile(Icons.privacy_tip, 'Terms & Privacy Policy'),
                _buildListTile(Icons.logout, 'Log Out'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Navbar(),
    );
  }

  ListTile _buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
