import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:pase_contactapp/contact_model.dart';
import 'package:pase_contactapp/contactdetails._view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> data = [
    {
      "name": "Denise Hill",
      "phone": "352-4013",
      "country": "Turkey",
      "region": "Florida",
      "email": "maecenas@icloud.com"
    },
    {
      "name": "Aspen Palmer",
      "phone": "215-2583",
      "country": "Pakistan",
      "region": "Xīběi",
      "email": "tincidunt.nibh@hotmail.org"
    },
    {
      "name": "Kane Gould",
      "phone": "148-0371",
      "country": "Ireland",
      "region": "Noord Brabant",
      "email": "pede.ac@aol.ca"
    },
    {
      "name": "Desirae Delgado",
      "phone": "1-359-485-9825",
      "country": "Chile",
      "region": "Minas Gerais",
      "email": "tincidunt.nunc@google.couk"
    },
    {
      "name": "Shaeleigh Mann",
      "phone": "371-6573",
      "country": "United States",
      "region": "Salzburg",
      "email": "elit@protonmail.org"
    },
    {
      "name": "Mercedes Woodard",
      "phone": "1-341-883-7784",
      "country": "Indonesia",
      "region": "Kirov Oblast",
      "email": "fermentum.arcu@protonmail.com"
    },
    {
      "name": "Nyssa Cannon",
      "phone": "316-7025",
      "country": "Russian Federation",
      "region": "Madrid",
      "email": "nulla.ante@protonmail.com"
    },
    {
      "name": "Tate Sweet",
      "phone": "223-7844",
      "country": "Russian Federation",
      "region": "FATA",
      "email": "elementum.dui.quis@yahoo.org"
    },
    {
      "name": "Knox Porter",
      "phone": "418-3192",
      "country": "Peru",
      "region": "Balochistan",
      "email": "ullamcorper.magna.sed@hotmail.com"
    },
    {
      "name": "Lois Hess",
      "phone": "1-277-222-8126",
      "country": "United States",
      "region": "Dadra and Nagar Haveli",
      "email": "justo.eu@hotmail.edu"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'My Contacts',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/flowerforapp.jpeg'),
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Search by name or number',
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recent',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContactDetailsView(
                            contact: Contact(
                                country: 'USA',
                                email: 'alexa.bliss@wwe.com',
                                name: 'Alexa Bliss',
                                phone: '+233 27 87 009',
                                region: 'L.A'));
                      }));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/alexablissapp.jpeg'),
                    ),
                    title: const Text(
                      'Alexa Bliss',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text('+233 27 87 009'),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.more_horiz)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 25,
                    thickness: 2,
                  );
                },
                itemCount: 3),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(groupByValue.substring(0, 1),
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18)),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ContactDetailsView(
                            contact: contact,
                          );
                        }));
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage('assets/alexablissapp.jpeg'),
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${element['phone']}'),
                      trailing: const IconButton(
                          onPressed: null, icon: Icon(Icons.more_horiz)),
                    ),
                    const Divider(
                      indent: 25,
                      thickness: 2,
                    )
                  ],
                );
              },
              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1A4ADA),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
