import 'package:flutter/material.dart';
import 'package:pet_app/src/models/mascota_model.dart';
import 'package:pet_app/src/models/vacuna_model.dart';
import 'package:pet_app/src/theme/color_theme.dart';
import 'package:pet_app/src/widgets/custom_button.dart';
import 'package:pet_app/src/widgets/custom_input.dart';
import 'package:uuid/uuid.dart';

class AddVacuna extends StatefulWidget {
  final Function onAdd;
  final Mascota mascota;
  const AddVacuna({Key? key, required this.onAdd, required this.mascota})
      : super(key: key);

  @override
  State<AddVacuna> createState() => _AddVacunaState();
}

class _AddVacunaState extends State<AddVacuna> {
  String vacuna = "";
  String descripcion = "";
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
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: ColorTheme.backgroundModal,
          titlePadding: EdgeInsets.only(left: 10, right: 10, top: 8),
          title: Container(
            child: Row(
              children: [
                SizedBox(width: 10),
                Text("Añadir Vacuna"),
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
              Text("Vacuna"),
              CustomInput(
                hint: "",
                label: "Vacuna",
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  vacuna = value;
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
              Text("Descripción"),
              CustomInput(
                hint: "",
                label: "Descripción",
                keyboardType: TextInputType.multiline,
                onChanged: (value) {
                  descripcion = value;
                  setState(() {});
                },
              ),
              Center(
                child: CustomButton(
                  text: "Agregar",
                  onPressed: () {
                    widget.onAdd(
                      Vacuna(
                          id: Uuid().v1(),
                          nombre: vacuna,
                          descripcion: descripcion,
                          fecha: selectedDate),
                      widget.mascota,
                    );
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
