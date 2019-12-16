import 'package:bloc_example/bloc/connectivityBloc/connectivityBloc.dart';
import 'package:bloc_example/bloc/connectivityBloc/connectivityState.dart';
import 'package:bloc_example/bloc/randomNumbersBloc/randomNumbersBloc.dart';
import 'package:bloc_example/bloc/randomNumbersBloc/randomNumbersEvent.dart';
import 'package:bloc_example/bloc/randomNumbersBloc/randomNumbersState.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityBloc>(create: (context) => ConnectivityBloc()),
        BlocProvider<RandomNumbersBloc>(create: (context) => RandomNumbersBloc()),
      ],
      child: Builder(
        builder: (context) => MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text("Bloc example"),
              actions: [
                IconButton(
                  icon: Icon(Icons.undo),
                  onPressed: () => BlocProvider.of<RandomNumbersBloc>(context).add(NewRandomNumbersEvent(count: 10, max: 10000)),
                ),
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
                ),
              ],
            ),
            body: BlocBuilder<RandomNumbersBloc, RandomNumbersState>(
              builder: (context, state) => ListView.separated(
                itemCount: state.numbers.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) => ListTile(
                  dense: true,
                  title: Text("$index: ${state.numbers[index]}"),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => BlocProvider.of<RandomNumbersBloc>(context).add(MoreRandomNumbersEvent(count: 10)),
            ),
          ),
        ),
      ),
    );
  }
}
