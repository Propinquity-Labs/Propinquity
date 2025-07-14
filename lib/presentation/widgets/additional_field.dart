import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/data/models/field_models.dart";

class Field {
  Field(this.icon, this.fieldTitle);
  final IconData icon;
  final String fieldTitle;
}

class AdditionalField extends ConsumerWidget {
  const AdditionalField(
      {super.key,
      required this.fieldType,
      required this.fieldValue,
      this.onTap});
  final FieldType fieldType;
  final String fieldValue;
  final void Function()? onTap;

  Field enumToField(FieldType value) {
    switch (value) {
      case FieldType.email:
        {
          return Field(Icons.email_rounded, "Email");
        }
      case FieldType.phone:
        {
          return Field(Icons.phone, "Phone");
        }
      case FieldType.dateBirthday:
        {
          return Field(Icons.calendar_month_rounded, "Birthday");
        }
      default:
        {
          return Field(Icons.cancel_rounded, "Not Assigned");
        }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    final Field fieldData = enumToField(fieldType);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.secondary
            ]),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  fieldData.fieldTitle,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
                Text(
                  fieldValue,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary),
                )
              ],
            ),
            const Spacer(),
            Icon(
              fieldData.icon,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
