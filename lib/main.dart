// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/widget/list_item.dart';

import './screens/new_todo.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: TodoList(),
      routes: {
        NewTodo.routeName: (context) => NewTodo(),
      },
    );
  }
}

class TodoList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numbers = ref.watch(numbersProvider);
    print(numbers);
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.teal.shade100),
        child: Center(
          child: Column(
            children: numbers.map((val) {
              return Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(color: Colors.teal.shade200),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListItem(val),
                      GestureDetector(
                        onTap: () {
                          ref.read(numbersProvider.notifier).remove(val);
                        },
                        child: Icon(
                          Icons.delete_forever,
                          size: 30,
                          color: Colors.pink.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(NewTodo.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
