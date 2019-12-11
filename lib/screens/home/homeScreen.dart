import 'package:bloc_example/bloc/connectivityBloc/connectivityBloc.dart';
import 'package:bloc_example/bloc/connectivityBloc/connectivityState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConnectivityBloc>(
      create: (context) => ConnectivityBloc(),
      child: Builder(
        builder: (context) => MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text("Bloc example"),
              actions: [
                BlocBuilder<ConnectivityBloc, ConnectivityState>(
                  builder: (context, state) => state.connected
                      ? SizedBox.shrink()
                      : IconButton(
                          icon: Icon(Icons.warning, color: Colors.orangeAccent),
                          onPressed: () => Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("There's no connection to the internet"),
                            ),
                          ),
                        ),
                )
              ],
            ),
            body: ListView(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
