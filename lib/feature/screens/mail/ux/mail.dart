import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/constants/image_constants.dart';
import '../mobx/mail_store.dart';

class MailScreen extends StatelessWidget {
  final MailStore _mailStore = MailStore();

  MailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inbox', style: GoogleFonts.girassol(fontSize: 24)),
        ),
        body: Observer(
          builder: (_) => ListView.builder(
            itemCount: _mailStore.mails.length,
            itemBuilder: (context, index) {
              final mail = _mailStore.mails[index];
              return Column(
                children: [
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(mail['image']!),
                      ),
                    ),
                    title: Text(
                      mail['subject']!,
                      style: GoogleFonts.girassol(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      mail['snippet']!,
                      style: GoogleFonts.girassol(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    trailing: Text(
                      mail['timestamp']!,
                      style: GoogleFonts.girassol(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () {},
                  ),
                  if (index != _mailStore.mails.length - 1)
                    Divider(
                      color: Colors.grey.shade400,
                      thickness: 1.0,
                      indent: 16.0,
                      endIndent: 16.0,
                    ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFe8d5d9),
          onPressed: () {
            _mailStore.addMail({
              'sender': 'Adam Luke',
              'subject': 'Support Education for Gaza',
              'image': LLCImageConstant.profile7,
              'snippet': 'Help us raise funds for Gaza!.',
              'timestamp': '11:20 AM',
            });
          },
          child: Text(
            'Email',
            style: GoogleFonts.girassol(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
