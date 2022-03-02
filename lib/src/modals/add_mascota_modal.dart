import 'package:flutter/material.dart';
import 'package:pet_app/src/models/mascota_model.dart';
import 'package:pet_app/src/theme/color_theme.dart';
import 'package:pet_app/src/widgets/custom_button.dart';
import 'package:pet_app/src/widgets/custom_input.dart';
import 'package:uuid/uuid.dart';

class AddMascota extends StatefulWidget {
  final Function onAdd;
  const AddMascota({
    Key? key,
    required this.onAdd,
  }) : super(key: key);

  @override
  State<AddMascota> createState() => _AddMascotaState();
}

class _AddMascotaState extends State<AddMascota> {
  String sexo = "M";
  String nombre = "";
  String peso = "";
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: ColorTheme.backgroundModal,
      titlePadding: EdgeInsets.only(left: 10, right: 10, top: 8),
      title: Container(
        child: Row(
          children: [
            SizedBox(width: 10),
            Text("Añadir Mascota"),
            Spacer(),
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.close),
            )
          ],
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Nombre"),
          CustomInput(
            hint: "",
            label: "Nombre",
            keyboardType: TextInputType.name,
            onChanged: (value) {
              nombre = value;
              setState(() {});
            },
          ),
          Text("Fecha"),
          GestureDetector(
            onTap: () => _selectDate(context),
            child: CustomInput(
              onChanged: () => {},
              hint: "",
              label:
                  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
              enabled: false,
            ),
          ),
          Text("Sexo"),
          Row(
            children: [
              ChoiceChip(
                selectedColor: ColorTheme.female,
                labelStyle: TextStyle(color: Colors.white),
                label: Text("F"),
                selected: sexo == "F",
                shape: CircleBorder(),
                onSelected: (isSelect) {
                  if (isSelect) sexo = "F";
                  setState(() {});
                },
              ),
              ChoiceChip(
                selectedColor: ColorTheme.male,
                labelStyle: TextStyle(color: Colors.white),
                label: Text("M"),
                selected: sexo == "M",
                shape: CircleBorder(),
                onSelected: (isSelect) {
                  if (isSelect) sexo = "M";
                  setState(() {});
                },
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Text("Peso"),
          CustomInput(
            hint: "",
            label: "Peso",
            keyboardType: TextInputType.number,
            onChanged: (value) {
              peso = value;
              setState(() {});
            },
          ),
          Center(
            child: CustomButton(
              text: "Agregar",
              onPressed: () {
                widget.onAdd(
                  Mascota(
                    id: Uuid().v1(),
                    nombre: nombre,
                    fechaNacimiento: selectedDate,
                    sexo: sexo,
                    peso: peso,
                  ),
                );
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
