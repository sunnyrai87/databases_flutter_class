import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    var mWidth = mq.size.width;
    var mHeight = mq.size.height;

    print("Width:$mWidth, Height:$mHeight");

    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: mq.orientation == Orientation.landscape
            ? Row(
                children: [
                  Expanded(
                      child: Container(
                        child: Center(child: Text("Expenso", style: TextStyle(fontSize: 16))),
                    color: Colors.blue,
                  )),
                  Expanded(
                      child: OrientationBuilder(builder: (context, orientation) {
                    return orientation==Orientation.landscape
                        ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              itemCount: 11,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisExtent: 11,
                                      crossAxisSpacing: 11),
                              itemBuilder: (_, index) {
                                return Container(
                                  margin: const EdgeInsets.all(8.0),
                                  color: Colors.blue,
                                );
                              }),
                        )
                        : ListView.builder(
                            itemCount: 11,
                            itemBuilder: (_, index) {
                              return Container(
                                height: 100,
                                width: double.infinity,
                                color: Colors.blue,
                              );
                            });
                  }))
                ],
              )
            : Column(
                children: [
                  Container(width: double.infinity,height: 200, color: Colors.blue,
                      child: Center(child: Text("Expenso", style: TextStyle(fontSize: 16)))),
                  Expanded(
                      child: Container(

                    height: 200,
                    color: Colors.grey,
                    child: ListView.builder(
                        itemCount: 11,
                        itemBuilder: (_, index) {
                          return Container(
                            height: 100,
                            width: double.infinity,
                            color: Colors.blue,
                          );
                        }),
                  ))
                ],
              ));
  }
}

// body: Container(
// width: mWidth*0.4 ,
// height: mHeight*0.4,
// color: Colors.blue,
// ),
