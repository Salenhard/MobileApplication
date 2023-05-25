import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled4/Other/extensions.dart';

import 'application.dart';

class DataFromIOT extends StatefulWidget {
  final String url;

  DataFromIOT({required String url}) : url = url;

  @override
  State<StatefulWidget> createState() => DataFromIOTState();
} // TestHttp

class DataFromIOTState extends State<DataFromIOT> {
  final _formKey = GlobalKey<FormState>();

  late String _url = "", _body = "";
  int _status = 0;

  @override
  void initState() {
    _url = widget.url;
    super.initState();
  } //initState

  _sendRequestPostBodyHeaders() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); //update form data

      try {
        var response = await http.post(_url as Uri,
            body: {'name': 'test', 'num': '10'},
            headers: {'Accept': 'application/json'});

        _status = response.statusCode;
        _body = response.body;
      } catch (error) {
        print('PostBodyHeaders(): error');
        _status = 0;
        _body = error.toString();
      }
      setState(() {}); //reBuildWidget
    }
  } //_sendRequestPost

  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            const Menu(),
            Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text('API url',
                    style: TextStyle(
                        fontSize: 20.0, color: Extensions.colorSmooth1))),
            Container(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    initialValue: _url,
                    validator: (value) {
                      if (value!.isEmpty) return 'API url isEmpty';
                    },
                    onSaved: (value) {
                      _url = value!;
                    },
                    autovalidateMode: AutovalidateMode.always)),
            const SizedBox(height: 20.0),
            ElevatedButton(
                style: Extensions.buttonStyleUsual1,
                onPressed: _sendRequestPostBodyHeaders,
                child: const Text('Send request POST with Body and Headers',
                    style: TextStyle(color: Extensions.colorBright))),
            const SizedBox(height: 20.0),
            const Text('Response status',
                style:
                    TextStyle(fontSize: 20.0, color: Extensions.colorSmooth1)),
            Text(_status == null ? '' : _status.toString(),
                style: const TextStyle(color: Extensions.colorBright)),
            const SizedBox(height: 20.0),
            const Text('Response body',
                style:
                    TextStyle(fontSize: 20.0, color: Extensions.colorSmooth1)),
            Text(_body ?? '',
                style: const TextStyle(color: Extensions.colorBright)),
          ],
        )));
  } //build
} //TestHttpState
