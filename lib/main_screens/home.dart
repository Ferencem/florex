import 'package:flutter/material.dart';
import 'package:multi_store_app/widgets/fake_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const FakeSearch(),
          bottom: const TabBar(
            indicatorColor: Colors.green,
            indicatorWeight: 8,
            isScrollable: true,
            tabs: [
              RepeatedTab(label: 'Beltéri'),
              RepeatedTab(label: 'Bonsai'),
              RepeatedTab(label: 'Vízparti'),
              RepeatedTab(label: 'Fa, cserje'),
              RepeatedTab(label: 'Futónövény'),
              RepeatedTab(label: 'Gyömölcstermő'),
              RepeatedTab(label: 'Kerti virág'),
              RepeatedTab(label: 'Kültéri'),
              RepeatedTab(label: 'Örökzöld'),
              RepeatedTab(label: 'Fűszernövény'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Beltéri növények')),
            Center(child: Text('Bonsai')),
            Center(child: Text('Vízpartí növények')),
            Center(child: Text('Fák, cserjék')),
            Center(child: Text('Futónövények')),
            Center(child: Text('Gyömölcstermők')),
            Center(child: Text('Kerti virágok')),
            Center(child: Text('Kültéri növények')),
            Center(child: Text('Örökzöldek')),
            Center(child: Text('Fűszer növények')),
          ],
        ),
      ),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  final String label;
  const RepeatedTab({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
      ),
    );
  }
}
