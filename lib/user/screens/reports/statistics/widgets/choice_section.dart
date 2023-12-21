part of '../statistics_imports.dart';

class ChoiceSection extends StatelessWidget {
  const ChoiceSection({
    Key? key,
    required this.label,
    this.icon,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final IconData? icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: FieldSection(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Icon(
              icon ?? Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
