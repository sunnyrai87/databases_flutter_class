
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import 'counter_cubit.dart';
import 'counter_state.dart';
import 'list_cubit.dart';
import 'list_state.dart';
import 'next_page.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => ListCubit(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cubit"),
      ),
      body: BlocBuilder<ListCubit, ListState>(
        builder: (_, state) {
          var dataFromCubit = state.mData;

          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.isError) {
            return Center(
              child: Text(
                "${state.errorMsg}",
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          return state.mData.isNotEmpty
              ? ListView.builder(
                  itemCount: dataFromCubit.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NextPage(
                                isUpdate: true,
                                mIndex: index,
                                mTitle: '${dataFromCubit[index]['title']}',
                                mDesc: '${dataFromCubit[index]['desc']}',
                              ),
                            ));
                      },
                      title: Text('${dataFromCubit[index]['title']}'),
                      subtitle: Text('${dataFromCubit[index]['desc']}'),
                      trailing: IconButton(
                        onPressed: () {
                          BlocProvider.of<ListCubit>(context).deleteNote(index);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    );
                  })
              : Center(child: Text("no notes yet"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //BlocProvider.of<CounterCubit>(context).incrementCount();
          //context.read<CounterCubit>().incrementCount();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NextPage()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
