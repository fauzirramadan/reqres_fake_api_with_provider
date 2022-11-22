import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reqres_fake_api/provider/user_provider.dart';
import 'package:reqres_fake_api/widgets/loading_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Consumer<UserProvider>(builder: (context, bloc, _) {
          return bloc.isLoading
              ? const LoadingView()
              : bloc.isFailed
                  ? const Center(
                      child: Text("GAGAL MENGAMBIL DATA"),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          itemCount: bloc.dataUser.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 2,
                                  childAspectRatio: 1 / 1.2),
                          itemBuilder: (context, index) {
                            var data = bloc.dataUser[index];
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.indigo[200],
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          data.avatar.toString(),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data.email ?? "error",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(data.firstName ?? "error"),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            );
                          }),
                    );
        }),
      ),
    );
  }
}
