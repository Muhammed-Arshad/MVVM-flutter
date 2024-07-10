import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samplep/utils/routes/routes_name.dart';
import 'package:samplep/view_model/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final userPreference = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: (){
              userPreference.remove().then((val){
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
            child: const Center(
              child: Text('Logout'),
            ),
          )
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
