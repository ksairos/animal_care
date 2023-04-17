import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appbarSize;

  const MyAppBar({required this.appbarSize, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      toolbarHeight: appbarSize,
      elevation: 0,
      shadowColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {},
          color: Colors.black,
          iconSize: 32,
          icon: Icon(Icons.search),
          tooltip: "Search",),
        IconButton(
          onPressed: () {},
          color: Colors.black,
          icon: Icon(Icons.menu),
          iconSize: 32,
          tooltip: "Navigation",),
      ],
      titleTextStyle: const TextStyle(color: Colors.black, fontSize: 32),
      title: InkWell(
        //TODO: Move uer to home page
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image(image: AssetImage("assets/img/no_image.png"), width: 60, height: 60),
                ),
                SizedBox(width: 8,),
                Text("봉쥬르", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appbarSize);
}
