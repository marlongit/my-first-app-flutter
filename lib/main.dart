import 'package:flutter/material.dart';
import 'package:lista_compras/provider/users.dart';
import 'package:lista_compras/routes/app_routes.dart';
import 'package:lista_compras/views/user_form.dart';
import 'package:lista_compras/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Users(),
          )
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.green,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            //home: UserList(),
            routes: {
              AppRoutes.HOME: (_) => UserList(),
              AppRoutes.HOME_FORM: (_) => UserForm()
            }));
  }
}
