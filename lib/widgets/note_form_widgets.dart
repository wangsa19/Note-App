import 'package:flutter/material.dart';

class NoteFormWidgets extends StatelessWidget {
  const NoteFormWidgets({
    Key? key,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.onChangedIsImportant,
    required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
  }) : super(key: key);

  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final ValueChanged<bool> onChangedIsImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Switch(value: isImportant, onChanged: onChangedIsImportant),
                Expanded(
                  child: Slider(
                    value: number.toDouble(),
                    min: 0,
                    max: 5,
                    divisions: 5,
                    onChanged: (value) => onChangedNumber(value.toInt()),
                  ),
                ),
              ],
            ),
            buildTitleField(),
            const SizedBox(height: 8),
            buildDescriptionField(),
          ],
        ),
      ),
    );
  }

  buildTitleField() {
    return TextFormField(
      maxLines: 1,
      initialValue: title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: "Title",
        hintStyle: TextStyle(color: Colors.grey),
      ),
      validator: (title) {
        return title != null && title.isEmpty
            ? "The title cannot be empty"
            : null;
      },
      onChanged: onChangedTitle,
    );
  }

  buildDescriptionField() {
    return TextFormField(
      maxLines: null,
      initialValue: description,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: "Type something...",
        hintStyle: TextStyle(color: Colors.grey),
      ),
      validator: (desc) {
        return desc != null && desc.isEmpty
            ? "The description cannot be empty"
            : null;
      },
      onChanged: onChangedDescription,
    );
  }
}
