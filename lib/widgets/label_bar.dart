import 'package:flutter/material.dart';

class LabelBarWidget extends StatelessWidget {
  final String label;
  final Function onTap;

  LabelBarWidget({this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff27cc3b),
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 3.0),
                  child: Text(
                    "See All",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
