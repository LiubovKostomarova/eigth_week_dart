//import 'dart:html';
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    body: ButterfliesList(),
    appBar: AppBar(title: const Text("Butterflies")),
  )));
}

class ButterfliesList extends StatefulWidget {
  @override
  _ButterfliesListState createState() => _ButterfliesListState();
}

/*void main() {
  runApp(ButterfliesApp());
}
class ButterfliesApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ButterfliesAppState();
}

class _ButterfliesAppState extends State<ButterfliesApp> {*/

class Butterfly {
  final String name;

  final String descriptions;

  Butterfly(this.name, this.descriptions);
}

class _ButterfliesListState extends State<ButterfliesList> {
  Butterfly _selectedButterfly;

  final List<Butterfly> butterflies = [
    Butterfly ("Adonis",
        "This beautiful species of butterfly is one of the most characteristic of unimproved southern chalk downland, where it can be seen flying low over shortly grazed turf (typically steep, south-facing slopes). The males have brilliant sky-blue wings, while the females are chocolate brown and far less conspicuous. Both sexes have distinctive black lines that enter or cross the white fringes of the wings."),
    Butterfly("Duke of Burgundy",
        "Small and orange and brown, like a tiny fritillary. Undersides of hind wings have rows of white spots. Lives in small colonies on grassland or woodland clearings. This small butterfly frequents scrubby grassland and sunny woodland clearings, typically in very low numbers. The adults rarely visit flowers and most sightings are of the territorial males as they perch on a prominent leaf at the edge of scrub. The females are elusive and spend much of their time resting or flying low to the ground looking for suitable egg-laying sites."),
    Butterfly("Monarch",
        "The Monarch is the largest butterfly seen in the British Isles and is also one of our rarest migrants. Known for its ability to travel large distances, the migrations in North America are one of the greatest natural phenomena in the world - where the adult butterflies can migrate from as far north as Canada to the overwintering grounds in Mexico, the west coast of California and Florida."),
    Butterfly("Painted Lady",
        "The Painted Lady is a long-distance migrant, which causes the most spectacular butterfly migrations observed in Britain and Ireland. Each year, it spreads northwards from the desert fringes of North Africa, the Middle East, and central Asia, recolonising mainland Europe and reaching Britain and Ireland. In some years it is an abundant butterfly, frequenting gardens and other flowery places in late summer."),
    Butterfly("Swallowtail",
        "A large, strong-flying butterfly restricted to the Norfolk Broads, although migrants are occasionally seen elsewhere. Pale yellow wings with black veins and blue margins.This is one of our rarest and most spectacular butterflies. The British race britannicus is a specialist of wet fenland and is currently restricted to the Norfolk Broads. Here the adults can be seen flying powerfully over open fen vegetation, stopping to feed on flowers such as thistles and Ragged-Robin."),
  ];

  int _selectedIndex = -1;

  //final controller = TextEditingController();

  /*void _setText() {
    setState(() {
      text = controller.text;
    });
  }*/

  String text = "";

  Color _color = const Color(0xFF69E6F7);
  Color _color2 = const Color(0x66355EE6);
  Color _changedColor = const Color(0xFFF8507A);

  bool styleOBJ = true;

  bool textValidate = false;

 
  bool validateTextField(String text) {
    if (text.isEmpty) {
      setState(() {
        textValidate = true;
      });
      return false;
    }
    setState(() {
      textValidate = false;
    });
    return true;
  }

  changeStyle() {
    setState(() {
      styleOBJ = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextField(
          decoration: InputDecoration(
            hintText: 'Enter the butterfly name',
            errorText: textValidate ? 'Please, enter the name' : null,
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
          ),
          //controller: controller,
          onSubmitted: (String str) {
            setState(
              () {
                text = str;
                /*var index;
              if (text == butterflies[index].name) {
                _selectedIndex = index;
              }*/
              },
            );
            validateTextField(text);
            changeStyle();
          }),
      Text(
          _selectedIndex == -1
              ? " \u{1F98B} "
              : "\u{1F98B} ${butterflies[_selectedIndex].name}",
          style: TextStyle(fontSize: 30)),
      Expanded(
          child: SizedBox(
              height: 200.0,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemExtent: 200,
                  itemCount: butterflies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) => ListTile(
                      /*onTap: () {
                        setState(() {
                          // устанавливаем индекс выделенного элемента
                          _selectedIndex = index;
                        });
                      },*/
                      title: Column(children: <Widget>[
                        Text(
                            text != butterflies[index].name &&
                                    _selectedIndex == -1
                                ? "There is no such a butterfly"
                                : "\u{1F98B} ${butterflies[index].name}",
                            style: styleOBJ
                                ? TextStyle(fontSize: 24, color: Colors.black)
                                : TextStyle(fontSize: 26, color: Colors.red))
                      ]),
                      selected: index == _selectedIndex)))),
      SizedBox(
          height: 400.0,
          //padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text(
              _selectedIndex == -1
                  ? ''
                  : butterflies[_selectedIndex].descriptions,
              style: const TextStyle(fontSize: 20)))
    ]);
  }
}
