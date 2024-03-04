import 'package:flutter/material.dart';
import 'package:simple_users_list/models/randomuser_model.dart';
import 'package:simple_users_list/widgets/inforow_widget.dart';

class DetailsScreen extends StatelessWidget {
  final RandomuserModel character;
  const DetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Image.network(character.bigpictureUrl),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("${character.firstname} ${character.secondname}"),
              const SizedBox(
                height: 10,
              ),
              Text('${character.city} • ${character.state} • ${character.country}'),
              const SizedBox(
                height: 10,
              ),
              InforowWidget('E-mail:', character.email),
              const SizedBox(
                height: 10,
              ),
              InforowWidget('Gender:', character.gender),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}