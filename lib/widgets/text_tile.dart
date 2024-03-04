import 'package:flutter/material.dart';

class TextTile extends StatefulWidget {
  final String tilename;

  const TextTile({
    super.key,
    required this.tilename,
  });

  @override
  State<TextTile> createState() => _TextTileState();
}

class _TextTileState extends State<TextTile> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: ShapeDecoration(
            color: isSelected ? Color(0xFF238F20) : Colors.white,
            shape: RoundedRectangleBorder(
                side: isSelected
                    ? BorderSide.none
                    : BorderSide(width: 1, color: Color(0xFFD6D6D6)),
                borderRadius: BorderRadius.circular(6)),
            shadows: isSelected
                ? [
                    BoxShadow(
                      color: Color(0x28000000),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ]
                : [],
          ),
          child: isSelected
              ? Center(
                  child: Text(
                    widget.tilename,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                )
              : Center(
                  child: Text(
                    widget.tilename,
                    style: TextStyle(
                      color: Color(0xFF727272),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
