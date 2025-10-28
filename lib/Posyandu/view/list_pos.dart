import 'package:belajar_ppkd/Posyandu/database/db_helper.dart';
import 'package:belajar_ppkd/Posyandu/login_pos.dart';
import 'package:belajar_ppkd/Posyandu/model/user_model.dart';
import 'package:belajar_ppkd/preferences/preferences_handler.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListPosyandu extends StatefulWidget {
  const ListPosyandu({super.key});

  @override
  State<ListPosyandu> createState() => _ListPosyanduState();
}

class _ListPosyanduState extends State<ListPosyandu> {
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final domisiliC = TextEditingController();
  final nomorhpC = TextEditingController();
  getData() {
    DbHelper.getALLUser();
    setState(() {});
  }
 
  Future<void> _onEdit(UserModel user) async {
  final editNameC = TextEditingController(text: user.name);
  final editEmailC = TextEditingController(text: user.email);
  final editDomisiliC = TextEditingController(text: user.domisili);
  final editNomorhpC = TextEditingController(text: user.nomorhp);

  // Dialog akan mengembalikan UserModel atau null
  final updatedUser = await showDialog<UserModel>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Edit User"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: editNameC,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: editEmailC,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: editDomisiliC,
                decoration: const InputDecoration(labelText: "Domisili"),
              ),
              TextField(
                controller: editNomorhpC,
                decoration: const InputDecoration(labelText: "Nomor HP"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, null),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () {
              final updated = UserModel(
                id: user.id,
                name: editNameC.text,
                email: editEmailC.text,
                password: user.password,
                domisili: editDomisiliC.text,
                nomorhp: editNomorhpC.text,
              );
              Navigator.pop(context, updated); // kirim hasil
            },
            child: const Text("Simpan"),
          ),
        ],
      );
    },
  );

  // Kalau user menekan "Simpan", updatedUser tidak null
  if (updatedUser != null) {
    await DbHelper.updateUser(updatedUser);
    getData();
    Fluttertoast.showToast(msg: 'User berhasil diupdate');
  }
}

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Daftar Posyandu",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue[700], size: 20),
                const SizedBox(width: 12),
                Text(
                  "Daftar User Posyandu",
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: DbHelper.getALLUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (!snapshot.hasData ||
                    (snapshot.data as List).isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.folder_open, size: 64, color: Colors.grey[300]),
                        const SizedBox(height: 16),
                        Text(
                          "Tidak ada data",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  final data = snapshot.data as List<UserModel>;
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final items = data[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue[100],
                            child: Text(
                              items.name[0].toUpperCase(),
                              style: TextStyle(
                                color: Colors.blue[700],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          title: Text(
                            items.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Row(
                              children: [
                                Icon(Icons.mail, size: 14, color: Colors.grey[600]),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    // maxLines: 1,
                                    items.email,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                         trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => _onEdit(items),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () async {
                                final confirm = await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Hapus User"),
                                    content: Text("Yakin ingin menghapus ${items.name}?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, false),
                                        child: const Text("Batal"),
                                      ),
                                      ElevatedButton(
                                        onPressed: () => Navigator.pop(context, true),
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                        child: const Text("Hapus"),
                                      ),
                                    ],
                                  ),
                                );
                                if (confirm == true) {
                                  await DbHelper.deleteUser(items.id!);
                                  getData();
                                  Fluttertoast.showToast(msg: 'User berhasil dihapus');
                                }
                              },
                            ),
                          ],
                        ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: ElevatedButton(
                onPressed: () async {
                  await PreferenceHandler.removeLogin();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const LoginPosyanduWidget()),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[400],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, size: 20),
                    SizedBox(width: 8),
                    Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}