import 'package:flutter/material.dart';

PreferredSizeWidget buildAppBar() =>
    AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.home),
      ),
      title: const Text('JOURNZ'),
      centerTitle: true,
      backgroundColor: Colors.indigoAccent,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
          child: TextButton.icon(
            style: TextButton.styleFrom(
              fixedSize: Size.fromHeight(10),
              textStyle: TextStyle(color: Colors.blue),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            onPressed: () => {},
            icon: Icon(
              Icons.logout,
            ),
            label: Text(
              'Logout',
            ),
          ),
        ),
      ],
    );