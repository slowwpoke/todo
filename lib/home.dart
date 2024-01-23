import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String _userToDo;
  List todoList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoList.addAll(['Отнести документы в университет', 'Сходить в деканат']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBDE0FE),
      appBar: AppBar(title: Text('Список дел', style: TextStyle(
        fontFamily: 'MontserratAlternates',
        fontWeight: FontWeight.w600,
        fontSize: 26
      ),),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todoList[index]),
                child: Card(
                  color: Colors.white,
                  child: ListTile(title: Text(todoList[index], style: TextStyle(
                      fontFamily: 'MontserratAlternates',
                      fontWeight: FontWeight.w400
                  ))),
                ),
              onDismissed: (direction) {
                setState(() {
                  todoList.removeAt(index);
                });
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFFAFCC),
        onPressed: () {
showDialog(context: context, builder: (BuildContext context){
return AlertDialog(
  title: Text('Добавить элемент', style: TextStyle(
      fontFamily: 'MontserratAlternates',
      fontWeight: FontWeight.w600,
      fontSize: 20
  )),
  backgroundColor: Color(0xFFFFAFCC),
  content: TextField(
    decoration: InputDecoration(
  focusedBorder: UnderlineInputBorder(
  borderSide: BorderSide(color: Colors.black),
    ),),
    onChanged: (String value) {
      _userToDo = value;
    },
  ),
  actions: [
    ElevatedButton(onPressed: () {
      setState(() {
        todoList.add(_userToDo);
      });
      Navigator.of(context).pop();
    }, child: Text('Добавить', style: TextStyle(
  fontFamily: 'MontserratAlternates',
  fontWeight: FontWeight.w600,
  fontSize: 15,
      color: Colors.black
  )),
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Color(0xFFBDE0FE)),
    )
    )
  ],
    actionsAlignment: MainAxisAlignment.center
);
});
        },
        child: Icon (
          Icons.add_box_outlined,
          color: Colors.white
        )
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat // AppBar
    ); // Scaffold
  }
}