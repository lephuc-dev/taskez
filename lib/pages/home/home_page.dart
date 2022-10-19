import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../base/base.dart';
import '../../blocs/blocs.dart';
import '../../models/models.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  final ProductBloc bloc;

  const HomePage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, ProductBloc> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<List<ProductModel>?>(
        stream: widget.bloc.list,
        builder: (context, snapshot) {
          bloc.loadData();
          if (!snapshot.hasData) {
            return const Center(
              child: SpinKitFadingCircle(color: Colors.blue),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data![index].name!, style: appTheme.textTheme.bodyText1),
                      trailing: Text(snapshot.data![index].price!, style: appTheme.textTheme.bodyText2),
                    ),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.addData("pen", "10"),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  ProductBloc get bloc => widget.bloc;
}
