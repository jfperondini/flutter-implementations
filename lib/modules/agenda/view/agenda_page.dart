import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_api/modules/menu/view/app_menu.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({Key? key}) : super(key: key);

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  final formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  String _endTime = '9:30';
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();

  final TextEditingController tituloEvento = TextEditingController();
  final TextEditingController dataEvento = TextEditingController();
  final TextEditingController horaInicial = TextEditingController();
  final TextEditingController horaFinal = TextEditingController();

  var agenda = const AgendaModel();
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MenuApp(),
        appBar: AppBar(
          title: const Text('Agenda Page'),
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CustomTextFiled(
                  controller: tituloEvento,
                  label: 'Titulo do Evento',
                  hint: 'titulo do evento...',
                  onSaved: (text) => agenda = agenda.copyWith(titulo: text),
                  // validator: (text) {
                  //   if (text == null || text.isEmpty) {
                  //     return 'este campo não pode estar vazio';
                  //   }
                  //   return null;
                  // },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFiled(
                  controller: dataEvento,
                  hint: DateFormat.yMd().format(_selectedDate),
                  onSaved: (text) => agenda = agenda.copyWith(data: text),
                  suffix: IconButton(
                    icon: const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      _getDateFromUser();
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFiled(
                        controller: horaInicial,
                        hint: _startTime,
                        onSaved: (text) =>
                            agenda = agenda.copyWith(horaInicial: text),
                        suffix: IconButton(
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            _getTimeFromUser(isStarttime: true);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: CustomTextFiled(
                        controller: horaFinal,
                        hint: _endTime,
                        onSaved: (text) =>
                            agenda = agenda.copyWith(horaFinal: text),
                        suffix: IconButton(
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            _getTimeFromUser(isStarttime: false);
                          },
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Color',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8.0),
                        Wrap(
                            children: List<Widget>.generate(3, (int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedColor = index;
                              });
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: index == 0
                                      ? Colors.blueAccent
                                      : index == 1
                                          ? Colors.redAccent
                                          : Colors.pinkAccent,
                                  child: _selectedColor == index
                                      ? const Icon(Icons.done,
                                          color: Colors.white, size: 16)
                                      : Container(),
                                )),
                          );
                        })),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 40,
                          child: ElevatedButton.icon(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                            onPressed: () {
                              formKey.currentState?.reset();
                            },
                            icon: const Icon(Icons.save),
                            label: const Text('Reset'),
                          ),
                        ),
                        const SizedBox(width: 50.0),
                        Builder(builder: (context) {
                          return SizedBox(
                            height: 40,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                if (Form.of(context)!.validate()) {
                                  formKey.currentState!.save();
                                  // ignore: avoid_print
                                  print('''
                                    Form 
                                    Titulo: ${agenda.titulo}
                                    Data: ${agenda.data}
                                    Hora Inicial: ${agenda.horaInicial}
                                    Hora Final: ${agenda.horaFinal}
                                  ''');
                                }
                              },
                              icon: const Icon(Icons.save),
                              label: const Text('Save'),
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  _getDateFromUser() async {
    DateTime? _prickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2040),
    );
    if (_prickerDate != null) {
      setState(() {
        _selectedDate = _prickerDate;
      });
    } else {
      // ignore: avoid_print
      print('teste');
    }
  }

  _getTimeFromUser({required bool isStarttime}) async {
    var pickerTime = await _showTimePicker();
    String _formatedTime = pickerTime.format(context);
    if (pickerTime == null) {
      // ignore: avoid_print
      print('Tempo cancelado');
    } else if (isStarttime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStarttime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
        ));
  }
}

// _getBRYClr(int no) {
//   switch (no) {
//     case 0:
//       return Colors.blueAccent;
//     case 1:
//       return Colors.redAccent;
//     case 2:
//       return Colors.yellowAccent;
//     default:
//       return Colors.blueAccent;
//   }
// }

class CustomTextFiled extends StatelessWidget {
  final String? label;
  final String? hint;
  final IconData? icon;
  final bool obscureText;
  final Widget? suffix;
  final TextEditingController controller;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;
  final void Function(String text)? onChanged;

  const CustomTextFiled({
    Key? key,
    this.label,
    this.icon,
    required this.controller,
    this.obscureText = false,
    this.hint,
    this.validator,
    this.onSaved,
    this.suffix,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(),
          prefixIcon: icon == null ? null : Icon(icon),
          suffixIcon: suffix,
        ));
  }
}

@immutable
class AgendaModel {
  final String titulo;
  final String data;
  final String horaInicial;
  final String horaFinal;

  const AgendaModel({
    this.titulo = '',
    this.data = '',
    this.horaInicial = '',
    this.horaFinal = '',
  });

  AgendaModel copyWith({
    String? titulo,
    String? data,
    String? horaInicial,
    String? horaFinal,
  }) {
    return AgendaModel(
      titulo: titulo ?? this.titulo,
      data: data ?? this.data,
      horaInicial: horaInicial ?? this.horaInicial,
      horaFinal: horaFinal ?? this.horaFinal,
    );
  }
}
