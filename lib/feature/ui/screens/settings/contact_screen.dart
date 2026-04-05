// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ContactScreen extends StatefulWidget {
//   const ContactScreen({super.key});

//   @override
//   State<ContactScreen> createState() => _ContactScreenState();
// }

// class _ContactScreenState extends State<ContactScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _messageController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _phoneController.dispose();
//     _messageController.dispose();
//     super.dispose();
//   }

//   Future<void> _sendEmail() async {
//     if (_formKey.currentState!.validate()) {
//       final String name = _nameController.text;
//       final String phone = _phoneController.text;
//       final String message = _messageController.text;

//       final Uri emailUri = Uri(
//         scheme: 'mailto',
//         path: 'aelbadri23@gmail.com',
//         query: _encodeQueryParameters(<String, String>{
//           'subject': 'تواصل من تطبيق قرآن وأذكار - $name',
//           'body': 'الاسم: $name\nرقم الهاتف: $phone\n\nالرسالة:\n$message',
//         }),
//       );

//       try {
//         final bool launched = await launchUrl(
//           emailUri,
//           mode: LaunchMode.externalApplication,
//         );
//         if (!launched) {
//           throw Exception('Could not launch');
//         }
//       } catch (e) {
//         if (mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('تعذر فتح تطبيق البريد. يرجى مراسلتنا على: aelbadri23@gmail.com'),
//               duration: Duration(seconds: 5),
//             ),
//           );
//         }
//       }
//     }
//   }

//   String? _encodeQueryParameters(Map<String, String> params) {
//     return params.entries
//         .map((MapEntry<String, String> e) =>
//             '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
//         .join('&');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('تواصل معنا', style: TextStyle(fontWeight: FontWeight.bold)),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const Text(
//                 'نسعد بتواصلك معنا. يرجى تعبئة النموذج أدناه وسنقوم بالرد عليك في أقرب وقت.',
//                 style: TextStyle(fontSize: 16),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 24),
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'الاسم',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.person_outline),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'الرجاء إدخال الاسم';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _phoneController,
//                 keyboardType: TextInputType.phone,
//                 decoration: const InputDecoration(
//                   labelText: 'رقم الهاتف',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.phone_outlined),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'الرجاء إدخال رقم الهاتف';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _messageController,
//                 maxLines: 5,
//                 decoration: const InputDecoration(
//                   labelText: 'الرسالة',
//                   border: OutlineInputBorder(),
//                   alignLabelWithHint: true,
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'الرجاء إدخال الرسالة';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 24),
//               ElevatedButton.icon(
//                 onPressed: _sendEmail,
//                 icon: const Icon(Icons.send),
//                 label: const Text('إرسال', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
