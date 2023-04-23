import 'package:animal_care_flutter_app/bloc/pet_bloc/pet_bloc.dart';
import 'package:animal_care_flutter_app/components/MyAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetPage extends StatefulWidget {

  const PetPage({Key? key}) : super(key: key);

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
                child: BlocBuilder<PetBloc, PetState>(
                  builder: (context, state) {
                    return
                      Column(
                        children: [
                          if (state.isLoading) const CircularProgressIndicator(),
                          Text(state.selectedPet?.petName ?? "No Information"),
                        ],
                      );
                  },
                )
            ),
          )
        ],
      ),
    );
  }
}
