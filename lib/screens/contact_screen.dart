import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  // 🔗 Function to open links
  Future<void> _openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        title: const Text("Contact"),
        backgroundColor: AppColors.navy,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔷 HEADER (icon removed)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0A1F44),
                    Color(0xFF1C3D73),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: const Column(
                children: [
                  Text(
                    "Get in Touch",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "We’d love to hear from you!",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 📞 PHONE
            _contactCard(
              icon: Icons.phone,
              title: "Phone",
              content: "+94 76 566 8168",
            ),

            // 📧 EMAIL
            _contactCard(
              icon: Icons.email,
              title: "Email",
              content: "japuraleos@gmail.com",
            ),

            // 📍 LOCATION
            _contactCard(
              icon: Icons.location_on,
              title: "Location",
              content: "University of Sri Jayewardenepura, Sri Lanka",
            ),

            const SizedBox(height: 15),

            // 🟢 WHATSAPP BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton.icon(
                onPressed: () {
                  _openLink(
                      "https://whatsapp.com/channel/0029VbBl2LbBA1f0ErBjKg1T");
                },
                icon: const Icon(Icons.chat),
                label: const Text("Join our WhatsApp Channel"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // 🌐 SOCIAL MEDIA
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 6),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      "Follow Us",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.facebook,
                              size: 30, color: Colors.blue),
                          onPressed: () {
                            _openLink(
                                "https://www.facebook.com/USJC2?rdid=vs8PVXaDJDqQdmQc&share_url=https%3A%2F%2Fwww.facebook.com%2Fshare%2F1AfXgPY7Fd%2F#");
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.business,
                              size: 30, color: Colors.blueAccent),
                          onPressed: () {
                            _openLink(
                                "https://www.linkedin.com/company/leo-club-of-district-306-d7-university-of-sri-jayewardenepura/");
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.public,
                              size: 30, color: Colors.green),
                          onPressed: () {
                            _openLink("https://jpurad7leos.org.lk/");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  // 🔹 CONTACT CARD
  static Widget _contactCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 28, color: AppColors.gold),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}