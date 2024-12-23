import 'package:flutter/material.dart';
import 'package:sos360_app/pages/service_pages/call_info.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  Image currentService(int index) {
    if (index % 2 == 0) {
      return Image.asset(
        'assets/police.png',
        width: 50,
        height: 50,
      );
    } else if (index % 3 == 0) {
      return Image.asset(
        'assets/ambulance.png',
        width: 50,
        height: 50,
      );
    } else {
      return Image.asset(
        'assets/firemen.png',
        width: 50,
        height: 50,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Text(
                    'Histórico',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.9)
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                    CallInfo()));
                      },
                      contentPadding: const EdgeInsets.all(10.0),
                      title: Text('Chamado $index'),
                      subtitle: Text('Descrição do chamado $index'),
                      leading: currentService(index),
                      trailing: const Icon(Icons.arrow_forward),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
