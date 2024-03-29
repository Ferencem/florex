import 'package:flutter/material.dart';
import 'package:multi_store_app/main_screens/category.dart';
import 'package:multi_store_app/main_screens/dashboard.dart';
import 'package:multi_store_app/main_screens/home.dart';
import 'package:multi_store_app/main_screens/stores.dart';

class SupplierHomeScreen extends StatefulWidget {
  const SupplierHomeScreen({Key? key}) : super(key: key);

  @override
  State<SupplierHomeScreen> createState() => _SupplierHomeScreenState();
}

class _SupplierHomeScreenState extends State<SupplierHomeScreen> {
  int _selectedIndex = 0;
  final List _tabs = const [
    HomeScreen(),
    CategoryScreen(),
    StoresScreen(),
    DashboardScreen(),
    Center(
      child: Text('Feltölt'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Kategória',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Üzlet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Vezérlő',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: 'Feltöltés',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
