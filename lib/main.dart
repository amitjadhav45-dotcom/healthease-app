import 'package:flutter/material.dart';

void main() => runApp(const HealtheaseApp());

class HealtheaseApp extends StatelessWidget {
  const HealtheaseApp({super.key});
  @override Widget build(BuildContext c) => MaterialApp(
    title: 'Healthease', debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xFF1565C0),
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),
      cardTheme: CardTheme(elevation: 1, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      inputDecorationTheme: InputDecorationTheme(filled: true, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14))),
    home: const LoginPage(),
  );
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final _e = TextEditingController(), _p = TextEditingController();
  bool _h = true;
  void _go() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Dashboard()));
  @override Widget build(BuildContext c) {
    final t = Theme.of(c);
    return Scaffold(body: SafeArea(child: Center(child: SingleChildScrollView(padding: const EdgeInsets.all(28), child: Column(children: [
      Icon(Icons.medical_services_rounded, size: 72, color: t.colorScheme.primary), const SizedBox(height: 12),
      Text('Healthease', style: t.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold, color: t.colorScheme.primary)), const SizedBox(height: 4),
      Text('Healthcare Management System', style: t.textTheme.bodyMedium?.copyWith(color: t.colorScheme.onSurface.withOpacity(0.6))), const SizedBox(height: 36),
      TextField(controller: _e, decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email_outlined), hintText: 'admin@healthease.com')), const SizedBox(height: 14),
      TextField(controller: _p, obscureText: _h, decoration: InputDecoration(labelText: 'Password', prefixIcon: const Icon(Icons.lock_outlined), suffixIcon: IconButton(icon: Icon(_h ? Icons.visibility_off : Icons.visibility), onPressed: () => setState(() => _h = !_h)))), const SizedBox(height: 20),
      SizedBox(height: 50, child: ElevatedButton(onPressed: _go, child: const Text('Sign In', style: TextStyle(fontSize: 16)))),
      const SizedBox(height: 28),
      Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: t.colorScheme.surfaceContainerHighest.withOpacity(0.4), borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Demo Access', style: t.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)), const SizedBox(height: 6),
        _demo(t, 'Admin', 'admin@healthease.com'), _demo(t, 'Doctor', 'priya.sharma@healthease.com'),
        _demo(t, 'Nurse', 'anita.patel@healthease.com'), _demo(t, 'Health Worker', 'sunil.jadhav@healthease.com'),
      ])),
    ]))))));
  }
  Widget _demo(ThemeData t, String r, String e) => Padding(padding: const EdgeInsets.only(bottom: 3), child: Row(children: [SizedBox(width: 95, child: Text(r, style: t.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600))), Expanded(child: Text(e, style: t.textTheme.bodySmall?.copyWith(color: t.colorScheme.onSurface.withOpacity(0.6))))]));
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  @override Widget build(BuildContext c) {
    final t = Theme.of(c);
    return Scaffold(appBar: AppBar(title: const Text('Dashboard')), drawer: _dr(c, t), body: ListView(padding: const EdgeInsets.all(16), children: [
      Text("Today's Summary", style: t.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)), const SizedBox(height: 12),
      Wrap(spacing: 12, runSpacing: 12, children: [_card(c, t, 'OPD Visits', '12', Icons.people_outline, t.colorScheme.primary), _card(c, t, 'New Patients', '5', Icons.person_add_outlined, Colors.green), _card(c, t, 'ANC Visits', '6', Icons.pregnant_woman_outlined, Colors.pink), _card(c, t, 'Pending Lab', '3', Icons.science_outlined, Colors.orange)]),
      const SizedBox(height: 24), Text('Alerts', style: t.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)), const SizedBox(height: 12),
      _alert(t, 'Pending Referrals', '3', Colors.red), _alert(t, 'Low Stock Medicines', '4', Colors.orange), _alert(t, 'High Risk Pregnancies', '2', Colors.pink.shade700),
      const SizedBox(height: 24), Text('Quick Actions', style: t.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)), const SizedBox(height: 10),
      Wrap(spacing: 8, runSpacing: 8, children: [
        ActionChip(avatar: const Icon(Icons.person_add, size: 17), label: const Text('Patients'), onPressed: () => Navigator.push(c, MaterialPageRoute(builder: (_) => const PatientsPage()))),
        ActionChip(avatar: const Icon(Icons.note_add, size: 17), label: const Text('OPD'), onPressed: () => Navigator.push(c, MaterialPageRoute(builder: (_) => const OpdPage()))),
        ActionChip(avatar: const Icon(Icons.monitor_heart, size: 17), label: const Text('Vitals'), onPressed: () => Navigator.push(c, MaterialPageRoute(builder: (_) => const VitalsPage()))),
        ActionChip(avatar: const Icon(Icons.biotech, size: 17), label: const Text('NCD'), onPressed: () => Navigator.push(c, MaterialPageRoute(builder: (_) => const NcdPage()))),
        ActionChip(avatar: const Icon(Icons.medication, size: 17), label: const Text('Inventory'), onPressed: () => Navigator.push(c, MaterialPageRoute(builder: (_) => const InvPage()))),
        ActionChip(avatar: const Icon(Icons.airport_shuttle, size: 17), label: const Text('Referrals'), onPressed: () => Navigator.push(c, MaterialPageRoute(builder: (_) => const RefPage()))),
        ActionChip(avatar: const Icon(Icons.assessment, size: 17), label: const Text('Reports'), onPressed: () => Navigator.push(c, MaterialPageRoute(builder: (_) => const RptPage()))),
      ]),
    ]));
  }
  Widget _card(BuildContext bc, ThemeData t, String title, String val, IconData icon, Color color) => Card(child: Container(width: (MediaQuery.of(bc).size.width - 44) / 2, padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, color: color, size: 28), const SizedBox(height: 12), Text(val, style: t.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)), Text(title, style: t.textTheme.bodySmall?.copyWith(color: t.colorScheme.onSurface.withOpacity(0.6)))])));
  Widget _alert(ThemeData t, String title, String val, Color c) => Card(margin: const EdgeInsets.only(bottom: 8), child: ListTile(leading: CircleAvatar(backgroundColor: c.withOpacity(0.1), child: Icon(Icons.warning_amber_rounded, color: c, size: 22)), title: Text(title, style: t.textTheme.bodyMedium), trailing: Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: c.withOpacity(0.1), borderRadius: BorderRadius.circular(20)), child: Text(val, style: t.textTheme.titleMedium?.copyWith(color: c, fontWeight: FontWeight.bold)))));
  Widget _dr(BuildContext c,