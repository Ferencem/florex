import 'package:flutter/material.dart';
import 'package:multi_store_app/customer_screens/customer_orders.dart';
import 'package:multi_store_app/customer_screens/wishlist.dart';
import 'package:multi_store_app/main_screens/cart.dart';
import 'package:multi_store_app/widgets/appbar_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State <ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          Container(
            height: 205,
            decoration: const BoxDecoration(
              color: Colors.green,),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                pinned: true,
                elevation: 0,
                backgroundColor: Colors.white,
                expandedHeight: 140,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    return FlexibleSpaceBar(
                      title: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: constraints.biggest.height <= 120 ? 1 : 0,
                        child: const Text(
                          'Számla adatok',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      background: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25, left: 30),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('images/inapp/guest.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Text(
                                  'Vendég'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 24, fontWeight: FontWeight.w600),

                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.black54, // Gomb háttere
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30))),
                            child: TextButton(
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: const Center(
                                  child: Text(
                                    'Kosár',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10), //Szöveg szine
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const CartScreen(
                                              back: AppbarBackButton(),
                                            )));
                              },
                            ),
                          ),
                          Container(
                            color: Colors.green,
                            child: TextButton(
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: const Center(
                                  child: Text(
                                    'Rendelések',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CustomerOrders()));
                              },
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30))),
                            child: TextButton(
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: const Center(
                                  child: Text(
                                    'Kivánságok',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Wishlist()));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.grey.shade300,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 150,
                            child: Image(
                                image: AssetImage('images/inapp/logo.png')),
                          ),
                          const ProfileHeaderLabel(
                            headerLabel: '   Adatok   ',
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 260,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Column(
                                children: const [
                                  RepeatedListTile(
                                      icon: Icons.email,
                                      subTitle: 'example@email.com',
                                      title: 'E-mail cím:'),
                                  YellowDivider(),
                                  RepeatedListTile(
                                      icon: Icons.phone,
                                      subTitle: '+3630...',
                                      title: 'Telefonszám:'),
                                  YellowDivider(),
                                  RepeatedListTile(
                                      icon: Icons.location_pin,
                                      subTitle: 'Pl.: Debrecen, Hét vezér 59.',
                                      title: 'Cím:'),
                                ],
                              ),
                            ),
                          ),
                          const ProfileHeaderLabel(
                              headerLabel: '  Szerkesztés  '),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 260,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Column(
                                children: [
                                  RepeatedListTile(
                                    title: 'Profil szerkesztése',
                                    subTitle: '',
                                    icon: Icons.edit,
                                    onPressed: () {},
                                  ),
                                  const YellowDivider(),
                                  RepeatedListTile(
                                    title: 'Jelszó változtatás',
                                    icon: Icons.lock,
                                    onPressed: () {},
                                  ),
                                  const YellowDivider(),
                                  RepeatedListTile(
                                    title: 'Kilépés',
                                    icon: Icons.logout,
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, '/welcome_screen');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class YellowDivider extends StatelessWidget {
  const YellowDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        color: Colors.green,
        thickness: 1,
      ),
    );
  }
}

class RepeatedListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Function()? onPressed;
  const RepeatedListTile(
      {Key? key,
      required this.icon,
      this.onPressed,
      this.subTitle = '',
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        leading: Icon(icon),
      ),
    );
  }
}

class ProfileHeaderLabel extends StatelessWidget {
  final String headerLabel;
  const ProfileHeaderLabel({Key? key, required this.headerLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Text(
            headerLabel,
            style: const TextStyle(
                color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
