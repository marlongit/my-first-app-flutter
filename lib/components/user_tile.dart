import 'package:flutter/material.dart';
import 'package:lista_compras/models/user.dart';
import 'package:lista_compras/provider/users.dart';
import 'package:lista_compras/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));

    return ListTile(
        leading: avatar,
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.orange,
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.HOME_FORM, arguments: user);
                  }),
              IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              title: Text("Informação"),
                              content:
                                  Text('Deseja realmente excluir o registro?'),
                              actions: <Widget>[
                                FlatButton(
                                    child: Text('Confirm'),
                                    onPressed: () =>
                                        Navigator.of(context).pop(true)),
                                FlatButton(
                                    child: Text('Cancel'),
                                    onPressed: () =>
                                        Navigator.of(context).pop(false))
                              ],
                            )).then((confirmed) => {
                          if (confirmed)
                            {
                              Provider.of<Users>(context, listen: false)
                                  .remove(user)
                            }
                        });
                  })
            ],
          ),
        ));
  }
}
