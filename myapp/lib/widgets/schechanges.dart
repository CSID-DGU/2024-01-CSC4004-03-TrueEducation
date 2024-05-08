import 'package:flutter/material.dart';

class ScheChanges extends StatefulWidget {
  final Color bgColor;
  final String text;
  final String date;

  const ScheChanges({
    super.key,
    required this.bgColor,
    required this.text,
    required this.date,
  });

  @override
  State<ScheChanges> createState() => _ScheChangesState();
}

class _ScheChangesState extends State<ScheChanges> {
  @override
  Widget build(BuildContext context) {
    void DeleteSche() {
      setState(() {});
    }

    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Container(
                  width: 324,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.bgColor,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.date,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              widget.text,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: DeleteSche,
                icon: const Icon(Icons.cancel_outlined),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
