///Example 1  => Obscured input:
// import 'package:flutter/material.dart';
//
// /// Flutter code sample for [TextField].
//
// class ObscuredTextFieldSample extends StatelessWidget {
//   const ObscuredTextFieldSample({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox(
//       width: 250,
//       child: TextField(
//         obscureText: true,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           labelText: 'Password',
//         ),
//       ),
//     );
//   }
// }
//
// class TextFieldExampleApp extends StatelessWidget {
//   const TextFieldExampleApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Obscured Textfield')),
//         body: const Center(child: ObscuredTextFieldSample()),
//       ),
//     );
//   }
// }
//
// void main() => runApp(const TextFieldExampleApp());
///Example 2 => Reading values:

// import 'package:flutter/material.dart';
//
// /// Flutter code sample for [TextField].
//
// void main() => runApp(const TextFieldExampleApp());
//
// class TextFieldExampleApp extends StatelessWidget {
//   const TextFieldExampleApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: TextFieldExample());
//   }
// }
//
// class TextFieldExample extends StatefulWidget {
//   const TextFieldExample({super.key});
//
//   @override
//   State<TextFieldExample> createState() => _TextFieldExampleState();
// }
//
// class _TextFieldExampleState extends State<TextFieldExample> {
//   late TextEditingController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: TextField(
//           controller: _controller,
//           onSubmitted: (String value) async {
//             await showDialog<void>(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: const Text('Thanks!'),
//                   content: Text(
//                     'You typed "$value", which has length ${value.characters.length}.',
//                   ),
//                   actions: <Widget>[
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text('OK'),
//                     ),
//                   ],
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
///Example 3 => Filled and OutLined:

// import 'package:flutter/material.dart';
//
// /// Flutter code sample for Material Design 3 [TextField]s.
//
// void main() {
//   runApp(const TextFieldExamplesApp());
// }
//
// class TextFieldExamplesApp extends StatelessWidget {
//   const TextFieldExamplesApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(colorSchemeSeed: const Color(0xff6750a4)),
//       home: Scaffold(
//         appBar: AppBar(title: const Text('TextField Examples')),
//         body: const Column(
//           children: <Widget>[
//             Spacer(),
//             FilledTextFieldExample(),
//             Spacer(),
//             OutlinedTextFieldExample(),
//             Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// /// An example of the filled text field type.
// ///
// /// A filled [TextField] with default settings matching the spec:
// /// https://m3.material.io/components/text-fields/specs#6d654d1d-262e-4697-858c-9a75e8e7c81d
// class FilledTextFieldExample extends StatelessWidget {
//   const FilledTextFieldExample({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const TextField(
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.search),
//         suffixIcon: Icon(Icons.clear),
//         labelText: 'Filled',
//         hintText: 'hint text',
//         helperText: 'supporting text',
//         filled: true,
//       ),
//     );
//   }
// }
//
// /// An example of the outlined text field type.
// ///
// /// A Outlined [TextField] with default settings matching the spec:
// /// https://m3.material.io/components/text-fields/specs#68b00bd6-ab40-4b4f-93d9-ed1fbbc5d06e
// class OutlinedTextFieldExample extends StatelessWidget {
//   const OutlinedTextFieldExample({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const TextField(
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.search),
//         suffixIcon: Icon(Icons.clear),
//         labelText: 'Outlined',
//         hintText: 'hint text',
//         helperText: 'supporting text',
//         border: OutlineInputBorder(),
//       ),
//     );
//   }
// }
///Example 4 => Scrolling considerations:

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Flutter code sample for [TextField].

void main() {
  runApp(const TextFieldExampleApp());
}

class TextFieldExampleApp extends StatelessWidget {
  const TextFieldExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('TextField Shift+Enter Example')),
        body: const TextFieldShiftEnterExample(),
      ),
    );
  }
}

class TextFieldShiftEnterExample extends StatefulWidget {
  const TextFieldShiftEnterExample({super.key});

  @override
  State<TextFieldShiftEnterExample> createState() =>
      _TextFieldShiftEnterExampleState();
}

class _TextFieldShiftEnterExampleState
    extends State<TextFieldShiftEnterExample> {
  final FocusNode _focusNode = FocusNode();

  final TextEditingController _controller = TextEditingController();

  String? _submittedText;

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }
  @override
  void initState() {
    _focusNode.canRequestFocus=true;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(
              _submittedText == null
                  ? 'Please submit some text\n\n'
                  'Press Shift+Enter for a new line\n'
                  'Press Enter to submit'
                  : 'Submitted text:\n\n${_submittedText!}',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Shortcuts(
          shortcuts: <ShortcutActivator, Intent>{
            // Map the `Shift+Enter` combination to our custom intent.
            const SingleActivator(LogicalKeyboardKey.enter, shift: true):
            _InsertNewLineTextIntent(),
          },
          child: Actions(
            actions: <Type, Action<Intent>>{
              // When the _InsertNewLineTextIntent is invoked, CallbackAction's
              // onInvoke callback is executed.
              _InsertNewLineTextIntent:
              CallbackAction<_InsertNewLineTextIntent>(
                onInvoke: (_InsertNewLineTextIntent intent) {
                  final TextEditingValue value = _controller.value;
                  final String newText = value.text.replaceRange(
                    value.selection.start,
                    value.selection.end,
                    '\n',
                  );
                  _controller.value = value.copyWith(
                    text: newText,
                    selection: TextSelection.collapsed(
                      offset: value.selection.start + 1,
                    ),
                  );

                  return null;
                },
              ),
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                focusNode: _focusNode,
                autofocus: true,
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Text',
                ),
                maxLines: null,
                textInputAction: TextInputAction.done,
                onSubmitted: (String? text) {
                  setState(() {
                    _submittedText = text;
                    _controller.clear();
                    _focusNode.requestFocus();
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// A custom [Intent] to represent the action of inserting a newline.
class _InsertNewLineTextIntent extends Intent {}