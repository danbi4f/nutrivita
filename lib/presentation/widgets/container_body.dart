import 'package:flutter/material.dart';

class ContainerBody extends StatelessWidget {
  const ContainerBody({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .surface, // Kolor tła zgodny z motywem
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Dostosowanie cienia
              spreadRadius: 4,
              blurRadius: 6,
              offset: const Offset(0, 3), // Pozycja cienia
            ),
          ],
        ),
        child: ListView(
          //scrollDirection: Axis.horizontal,
          children: children,
        ),
      ),
    );
  }
}
