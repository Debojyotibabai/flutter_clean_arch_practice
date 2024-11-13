import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownWithIcon extends StatefulWidget {
  const DropdownWithIcon({
    super.key,
    required this.selectTitle,
    this.options = const [],
    this.onChanged,
  });

  final String selectTitle;
  final List<String> options;
  final Function(int?)? onChanged;

  @override
  State<DropdownWithIcon> createState() => _DropdownWithIconState();
}

class _DropdownWithIconState extends State<DropdownWithIcon> {
  String? selectedValue;

  List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
    if (widget.options.isEmpty) {
      return [];
    }

    return widget.options.expand((item) {
      return [
        DropdownMenuItem<String>(
          value: item,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              item,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
        if (item != widget.options.last)
          const DropdownMenuItem<String>(
            enabled: false,
            child: Divider(),
          ),
      ];
    }).toList();
  }

  List<double> _getCustomItemsHeights() {
    if (widget.options.isEmpty) {
      return [];
    }
    return List<double>.generate((widget.options.length * 2) - 1, (index) {
      return index.isEven ? 40 : 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: _buildHintText(context),
        items: _buildDropdownMenuItems(),
        value: selectedValue,
        onChanged: widget.options.isNotEmpty
            ? (String? value) {
                setState(() {
                  selectedValue = value;
                });
                widget.onChanged!(widget.options.indexOf(value!));
              }
            : null,
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        dropdownStyleData: const DropdownStyleData(
          maxHeight: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white,
          ),
          elevation: 8,
        ),
        menuItemStyleData: MenuItemStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          customHeights: _getCustomItemsHeights(),
        ),
        iconStyleData: const IconStyleData(
          openMenuIcon: Icon(Icons.arrow_drop_up),
        ),
      ),
    );
  }

  Widget _buildHintText(BuildContext context) {
    return Text(
      widget.selectTitle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
    );
  }
}
