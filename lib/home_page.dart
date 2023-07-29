
import 'package:currency4/service/currency_service.dart';
import 'package:flutter/material.dart';
import 'package:currency4/service/currency_service.dart';

import 'models/status_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home Page")),
        body: FutureBuilder(
            future: StatusService.getHome(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (snapshot.data is String) {
                return Center(
                  child: Text(snapshot.data),
                );
              } else {
                List<StatusService> data = snapshot.data as List<StatusService>;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                     title: Text(data[index].hashCode.toString()),
                      
                    );
                  },
                  itemCount: data.length,
                );
              }
            }));
  }
}