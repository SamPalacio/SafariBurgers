import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/hamburguers.dart';
import 'package:badges/badges.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeView> {
  final String title = " 🎁 ¡No hay navidad como la nuestra! 🔔";

  int products = 0;
  List<Hamburguer> hamburguersListDefault = <Hamburguer>[
    Hamburguer("La Leona", 20.959,
        "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=999&q=80"),
    Hamburguer("La Foca", 22.399,
        "https://images.unsplash.com/photo-1605789538467-f715d58e03f9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"),
    Hamburguer("La Marrana", 28.399,
        "https://images.pexels.com/photos/3616956/pexels-photo-3616956.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
    Hamburguer("La Potra", 17.399,
        "https://images.pexels.com/photos/918581/pexels-photo-918581.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
    Hamburguer("La Ballena", 22.300,
        "https://images.pexels.com/photos/2983098/pexels-photo-2983098.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
    Hamburguer("La Jirafa", 22.300,
        "https://images.pexels.com/photos/1146759/pexels-photo-1146759.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
    Hamburguer("La Vaca", 22.300,
        "https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
    Hamburguer("La Garrapata", 22.300,
        "https://images.pexels.com/photos/3727243/pexels-photo-3727243.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
    Hamburguer("La Mosca", 22.300,
        "https://images.pexels.com/photos/580612/pexels-photo-580612.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
    Hamburguer("La Gallina", 22.300,
        "https://images.pexels.com/photos/11299737/pexels-photo-11299737.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
    Hamburguer("La Serpiente", 22.300,
        "https://images.pexels.com/photos/1797171/pexels-photo-1797171.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
    Hamburguer("La Caracol", 22.300,
        "https://images.pexels.com/photos/3356409/pexels-photo-3356409.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
  ];

  late List<Hamburguer> hamburguersList = List.from(hamburguersListDefault);

  void _incrementCounter() {
    setState(() {
      products++;
    });
  }

  String inputValue = "";
  void search() {
    setState(() {
      hamburguersList.clear();
      var matchList = hamburguersListDefault.where((element) =>
          element.description.toLowerCase().contains(inputValue.toLowerCase()));

      for (var element in matchList) {
        hamburguersList.add(element);
      }
    });
  }

  void changeInput(String value) {
    setState(() {
      inputValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreateHeader(),
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [Content()],
            ),
          ),
        );
      }),
    );
  }

  Column Content() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Wrap(
        direction: Axis.horizontal,
        spacing: 8,
        runSpacing: 12,
        children: populateBurguers(),
      ),
    ]);
  }

  populateBurguers() {
    var burgers = <Container>[];

    hamburguersList.forEach((i) {
      return burgers.add(CreateBurguer(i.src, i.price, i.description));
    });
    return burgers;
  }

  Container CreateBurguer(String src, double price, String description) {
    return Container(
      width: 320,
      height: 320,
      child: CreateBurguerCard(src, price, description),
    );
  }

  Card CreateBurguerCard(String src, double price, String description) {
    return Card(
        color: Color.fromARGB(255, 254, 253, 235),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: const EdgeInsets.all(15),
        elevation: 10,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: Image(
                    image: NetworkImage(src),
                    fit: BoxFit.cover,
                    height: 130,
                    width: 130,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '$price COP',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        child: const Text("Añadir al carrito",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 72, 67, 26))),
                        onPressed: () => _incrementCounter())
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Row Search() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Flexible(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(),
          Flexible(
            child: Image.network(
                "https://i.ibb.co/fFN27Hn/Agregar-un-t-tulo-400-110-px-3.png"),
          ),
          Spacer(),
          Flexible(
            flex: 4,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '¿Qué hamburguesa quieres ordernar hoy?',
              ),
              onChanged: (text) {
                changeInput(text);
              },
            ),
          ),
          Flexible(
            child: FloatingActionButton(
              onPressed: () {
                search();
              },
              child: const Icon(Icons.search),
              backgroundColor: Colors.yellow[700]!,
            ),
          ),
          const Spacer(),
          Flexible(
            child: FloatingActionButton(
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Badge(
                    position: BadgePosition.topEnd(),
                    badgeContent: Text(products.toString()),
                    child: IconButton(
                      icon: Icon(Icons.shopping_bag),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.yellow[700]!,
            ),
          ),
          const Spacer(),
        ],
      )),
    ]);
  }

  AppBar CreateHeader() {
    return AppBar(
      title: Center(
        child: Column(
          children: [
            Container(
              color: Colors.yellow[700]!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 13,
                          color: Colors.black)),
                ],
              ),
            ),
            Search(),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      toolbarHeight: 125,
    );
  }
}
