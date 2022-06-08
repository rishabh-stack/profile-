import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './appbar.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
              decoration: BoxDecoration(
                  border: Border(
                  right: BorderSide( //                   <--- left side
                  color: Colors.grey,
                  ),
                ),
              ),
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.25,
              //height: MediaQuery.of(context).size.height*0.50,

              child: Column(
                children: <Widget>[
                  buildTop(),
                  buildContent(),
                ],
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.65,
              //height: MediaQuery.of(context).size.height*0.50,
              color: Colors.white,
              child: Column(

                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.25,
                        child:
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('Details 1'),
                              Text('Details 2'),
                              Text('Details 3'),
                            ],
                          ),
                          ),
                      ),
                      Column(
                        children: <Widget>[
                          Text('Details 1'),
                          Text('Details 2'),
                          Text('Details 3'),
                        ],
                      )
                    ],
                  ),
                  Text('Helo world'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('click'),
        backgroundColor: Colors.red[600],
      ),
    );
  }



  Widget buildCoverImage() => Container(
      color: Colors.grey,
      child: Image.network(
        'https://media.istockphoto.com/photos/dark-blue-grunge-background-picture-id170958625?b=1&k=20&m=170958625&s=170667a&w=0&h=xG_DER6VK7CEXuPh0TUQu7H_xqlF_LZ0uNgumm40ylw=',
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      ));

  Widget buildProfileImage() => CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: Colors.grey.shade800,
      backgroundImage:
          NetworkImage('https://avatars.githubusercontent.com/u/71181112?v=4'));

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(top: top, child: buildProfileImage()),
      ],
    );
  }

  Widget buildContent() {
    return (Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const SizedBox(height: 8),
          Text('Saurav Kumar',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
            'Designation',
            style: TextStyle(fontSize: 20, color: Colors.black38),
          ),
          const SizedBox(height: 8),
          Text('gmail'),
          const SizedBox(height: 8),
          Text('Mobile'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildIcon(FontAwesomeIcons.facebook),
              buildIcon(FontAwesomeIcons.instagram),
              buildIcon(FontAwesomeIcons.twitter),
              buildIcon(FontAwesomeIcons.linkedin),
            ],
          )
        ],
      ),
    ));
  }

  Widget buildIcon(IconData icon) => CircleAvatar(
      radius: 25,
      child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Icon(icon, size: 32),
            ),
          )));
}
