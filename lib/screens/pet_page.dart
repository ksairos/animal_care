import 'package:animal_care_flutter_app/components/MyAppBar.dart';
import 'package:flutter/material.dart';

class PetPage extends StatefulWidget {
  final String? petId;

  const PetPage({required this.petId, Key? key}) : super(key: key);

  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(appbarSize: 140,),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Text(widget.petId ?? "Nothing provided"),
            ),
          )
        ],
      ),
    );
  }
}
