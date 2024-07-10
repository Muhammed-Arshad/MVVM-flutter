import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samplep/data/response/status.dart';
import 'package:samplep/utils/routes/routes_name.dart';
import 'package:samplep/view_model/home_view_model.dart';
import 'package:samplep/view_model/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {

    homeViewModel.fetchBookListApi();
    super.initState();
  }

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
      body: ChangeNotifierProvider(
        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context,val,_){
            switch(val.bookList.status){
              case Status.LOADING:
                return CircularProgressIndicator();
              case Status.ERROR:
                return Text(val.bookList.message.toString());
              case Status.COMPLETED:
                return ListView.builder(
                  itemCount: val.bookList.data!.data!.length,
                    itemBuilder: (context,i){

                    final bookName = val.bookList.data!.data![i].name;

                      return Card(
                        child: Text(bookName.toString()),
                      );
                    });
              case null:
                return Container();
            }
          }),
      ),
    );
  }
}
