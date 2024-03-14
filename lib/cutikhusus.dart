import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class cutikhusus extends StatefulWidget {
  const cutikhusus({super.key});

  @override
  State<cutikhusus> createState() => cutikhususState();
}

class cutikhususState extends State<cutikhusus> {
  String? selectedValue;
  SignatureController controller = SignatureController(
      penStrokeWidth: 3,
      penColor: Colors.black,
      exportBackgroundColor: Colors.lightBlue);
  DateTimeRange? selectDateTime;
  void show() async {
    final DateTimeRange? result = await showDateRangePicker(
        context: context,
        firstDate: DateTime(
          2022,
          2,
        ),
        lastDate: DateTime(2030, 12, 31),
        currentDate: DateTime.now(),
        saveText: "Done");
    if (result != null) {
      print(result.start.toString());
      setState(() {
        selectDateTime = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuti Khusus'),
      ),
      body: ListView(padding: const EdgeInsets.all(16.0), children: [
        Container(
          height: 60,
          margin: EdgeInsets.only(top: 32),
          // padding: EdgeInsets.only(left: 9.0, right: 9.0),

          // decoration:
          //     BoxDecoration(border: Border.all(color: Colors.black)),
          child: DropdownButtonFormField<String?>(
            decoration: InputDecoration(
                labelText: "Jenis  Cuti", border: OutlineInputBorder()),
            // underline: SizedBox.shrink(),
            // hint: Text(
            //   "Pilih Jenis Cuti",
            //   style: TextStyle(color: Color(0xFF), fontSize: 18),
            // ),

            value: selectedValue,
            style: TextStyle(color: Color(0xFF393939), fontSize: 17),
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            isExpanded: true,
            items: ["Melahirkan", "Menikah", "Kematian", "Hajatan"]
                .map<DropdownMenuItem<String?>>((e) => DropdownMenuItem(
                      child: Text(e.toString()),
                      value: e,
                    ))
                .toList(),
          ),
        ),
        SizedBox(height: 25), // Tambahkan jarak di sini
        InkWell(
          onTap: () {
            show();
          },
          child: IgnorePointer(
            ignoring: true,
            child: SizedBox(
              height: 70,
              child: TextField(
                controller: TextEditingController(
                    text: selectDateTime?.start.toString()),
                decoration: const InputDecoration(
                  labelText: "Tanggal Mulai",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),

                    // enabledBorder:
                    //     OutlineInputBorder(borderSide: BorderSide.none),
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide:
                    //       BorderSide(color: Color.fromARGB(255, 26, 32, 42)),
                    // ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10), // Tambahkan jarak di sini
        IgnorePointer(
          ignoring: true,
          child: SizedBox(
            height: 70,
            child: TextField(
              controller:
                  TextEditingController(text: selectDateTime?.end.toString()),
              decoration: const InputDecoration(
                labelText: "Tanggal Selesai",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 15), // Tambahkan jarak di sini
        Container(
          height: 100,

          // child: Container(
          // height: 100,
          child: TextField(
            minLines: 1,
            maxLines: 10,
            decoration: const InputDecoration(
              labelText: "Deskripsi",
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          // ),
        ),

        SizedBox(
          height: 0,
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black45)),
          child: Signature(
            controller: controller,
            width: 350,
            height: 100,
            backgroundColor: Color(0xFFffff),
          ),
        ),

        SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.only(top: 20.0),
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0000EF),
            ),
            onPressed: () {},
            //   String tUser = "mifta";
            //   String tEmail = "mifta@gmail.com";
            //   String tPass = "12345";
            //   if (formkey.currentState!.validate()) {
            //     if (cUser.text == tUser && cPass.text == tPass) {
            //       //perintah utk memanggil halaman baru
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => LoginPage(),
            //           ));
            //       //Navigator.pushAndRemoveUntil(
            //       //  context,
            //       //MaterialPageRoute(
            //       //builder: (context) => const cutikhusus(),
            //       //),
            //       //  (route) => false);
            //     }
            //     showDialog(
            //         context: context,
            //         builder: (context) {
            //           return AlertDialog(
            //             title: Text("Konfirmasi Registrasi "),
            //             content: Text("Registrasi Berhasil"),
            //             actions: [
            //               TextButton(
            //                   onPressed: () {
            //                     cUser.text = '';
            //                     cMail.text = '';
            //                     cPass.text = '';
            //                     Navigator.of(context).pop();
            //                   },
            //                   child: Text('Ok'))
            //             ],
            //           );
            //         });

            //     ;
            //   }
            // },
            child: Text(
              "Simpan",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),

        // Container(
        //   height: 200,
        //   child: TextField(
        //     decoration: const InputDecoration(
        //         border: OutlineInputBorder(
        //             borderSide: BorderSide(color: Colors.black))),
        //   ),
        // )
      ]),
    );

    // Future<void> _selectDate() async {
    //   await showDatePicker(
    //       context: context,
    //       initialDate: DateTime.now(),
    //       firstDate: DateTime(2000),
    //       lastDate: DateTime(2090));
    // }
  }
}
