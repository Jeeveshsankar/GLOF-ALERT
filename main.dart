import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:intl/intl.dart';


void main() {
  runApp(const GLOFApp());
}

class GLOFApp extends StatelessWidget {
  const GLOFApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GLOF Disaster Management',
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0D47A1), // Deep blue
          elevation: 10,
          centerTitle: true,
        ),
      ),
      home: const PortalSelectionScreen(),
    );

  }
}

class PortalSelectionScreen extends StatefulWidget {
  const PortalSelectionScreen({super.key});

  @override
  State<PortalSelectionScreen> createState() => _PortalSelectionScreenState();
}

class _PortalSelectionScreenState extends State<PortalSelectionScreen> {
  bool _showLoginDialog = false;
  String _selectedPortal = '';
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handlePortalTap(String portalName) {
    setState(() {
      _showLoginDialog = true;
      _selectedPortal = portalName;
    });
  }

  void _handleLogin() {
    if (_usernameController.text == 'test' && _passwordController.text == '123456') {
      Navigator.of(context).pop();
      setState(() {
        _showLoginDialog = false;
      });
      
      // Navigate to the selected portal
      switch (_selectedPortal) {
        case 'Disaster Management Teams':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DisasterManagementPortal(),
            ),
          );
          break;
        case 'Villagers':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FarmersPortal(),
            ),
          );
          break;
        case 'Farmers':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FarmersPortal(),
            ),
          );
          break;
        case 'Government Officials':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GovernmentOfficialsPortal(),
            ),
          );
          break;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid credentials. Use username: test, password: 123456'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GLOF Disaster Management System'),
        backgroundColor: Colors.blue[900],
        elevation: 10,
        shadowColor: Colors.blue.withOpacity(0.6),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background with gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue.shade900,
                  Colors.blue.shade700,
                  Colors.blue.shade500,
                ],
              ),
            ),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select your portal:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      _LinearPortalCard(
                        title: 'Disaster Management Teams',
                        icon: Icons.emergency,
                        color: Colors.red,
                        description: 'Access emergency protocols and team coordination tools',
                        onTap: () => _handlePortalTap('Disaster Management Teams'),
                      ),
                      const SizedBox(height: 15),
                      _LinearPortalCard(
                        title: 'Villagers',
                        icon: Icons.people,
                        color: Colors.green,
                        description: 'Find safety information and evacuation routes',
                        onTap: () => _handlePortalTap('Villagers'),
                      ),
                      const SizedBox(height: 15),
                      _LinearPortalCard(
                        title: 'Farmers',
                        icon: Icons.agriculture,
                        color: Colors.orange,
                        description: 'Crop protection advice and weather alerts',
                        onTap: () => _handlePortalTap('Farmers'),
                      ),
                      const SizedBox(height: 15),
                      _LinearPortalCard(
                        title: 'Government Officials',
                        icon: Icons.business,
                        color: Colors.purple,
                        description: 'Access reports and resource allocation tools',
                        onTap: () => _handlePortalTap('Government Officials'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Additional features section
                const Text(
                  'Quick Actions:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _QuickActionButton(
                        icon: Icons.warning,
                        label: 'Emergency Alert',
                        color: Colors.red,
                        onTap: () {},
                      ),
                      const SizedBox(width: 10),
                      _QuickActionButton(
                        icon: Icons.map,
                        label: 'Evacuation Routes',
                        color: Colors.blue,
                        onTap: () {},
                      ),
                      const SizedBox(width: 10),
                      _QuickActionButton(
                        icon: Icons.cloud,
                        label: 'Weather Forecast',
                        color: Colors.teal,
                        onTap: () {},
                      ),
                      const SizedBox(width: 10),
                      _QuickActionButton(
                        icon: Icons.help,
                        label: 'Help Guide',
                        color: Colors.purple,
                        onTap: () {},
                      ),
                      const SizedBox(width: 10),
                      _QuickActionButton(
                        icon: Icons.phone,
                        label: 'Emergency Contacts',
                        color: Colors.green,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Login Dialog
          if (_showLoginDialog) ...[
            // Blur background
            BackdropFilter(
              filter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            
            // 3D Login Dialog
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // Perspective
                  ..rotateX(_showLoginDialog ? 0 : 0.1) // 3D rotation effect
                  ..rotateY(_showLoginDialog ? 0 : -0.05),
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          blurRadius: 20,
                          spreadRadius: 5,
                          offset: const Offset(0, 10),
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue.shade800,
                          Colors.blue.shade600,
                          Colors.blue.shade800,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 3D Portal Icon
                        Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.002)
                            ..rotateX(0.1)
                            ..rotateY(-0.1),
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.shade900,
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: const Offset(5, 5),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.lock,
                              size: 40,
                              color: Colors.blue[900],
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        Text(
                          'Login to $_selectedPortal',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Username Field
                        TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Username',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 15),
                        
                        // Password Field
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Login Button with 3D effect
                        Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..translate(0.0, 0.0, 10.0), // Slight 3D elevation
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: _handleLogin,
                              borderRadius: BorderRadius.circular(10),
                              child: Ink(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 15),
                        
                        // Close Button
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _showLoginDialog = false;
                            });
                          },
                          child: const Text(
                            'CANCEL',
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 10),
                        
                        // Hint text
                        const Text(
                          'Hint: username: test, password: 123456',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _LinearPortalCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String description;
  final VoidCallback onTap;

  const _LinearPortalCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
    required this.onTap,
  });

  @override
  State<_LinearPortalCard> createState() => _LinearPortalCardState();
}

class _LinearPortalCardState extends State<_LinearPortalCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovered = true),
      onExit: (event) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: widget.color.withOpacity(_isHovered ? 0.4 : 0.2),
                blurRadius: _isHovered ? 15 : 8,
                spreadRadius: _isHovered ? 2 : 1,
                offset: const Offset(0, 3),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                widget.color.withOpacity(0.1),
                Colors.white,
              ],
            ),
            border: Border.all(
              color: widget.color.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              // Icon with background
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.icon,
                  size: 28,
                  color: widget.color,
                ),
              ),
              const SizedBox(width: 16),
              // Text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              // Arrow indicator
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                transform: Matrix4.translationValues(
                  _isHovered ? 5 : 0,
                  0,
                  0,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: widget.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Disaster Management Teams Portal
class DisasterManagementPortal extends StatefulWidget {
  const DisasterManagementPortal({super.key});

  @override
  _DisasterManagementPortalState createState() => _DisasterManagementPortalState();
}

class _DisasterManagementPortalState extends State<DisasterManagementPortal> {
  int _selectedIndex = 0;
  final List<Alert> _alerts = [];
  final List<EvacuationPlan> _evacuationPlans = [];

  static final List<Widget> _widgetOptions = <Widget>[];

  @override
  void initState() {
    super.initState();
    // Initialize with dummy data
    _alerts.addAll([
      Alert(
        title: 'GLOF Warning - Sector B',
        message: 'Rising water levels detected in Sector B. Potential GLOF event expected within 24 hours.',
        severity: Severity.high,
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        location: 'Sector B, Valley 4',
      ),
      Alert(
        title: 'Heavy Rainfall Alert',
        message: 'Heavy rainfall expected in the northern regions. Possible flooding in low-lying areas.',
        severity: Severity.medium,
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        location: 'Northern Valleys',
      ),
    ]);

    _evacuationPlans.addAll([
      EvacuationPlan(
        name: 'Valley 4 Emergency Plan',
        description: 'Covers 3 villages, 200 families',
        lastUpdated: DateTime.now().subtract(const Duration(days: 30)),
        zones: ['Village A', 'Village B', 'Village C'],
        shelters: 5,
        estimatedTime: '2 hours',
      ),
      EvacuationPlan(
        name: 'Sector B Contingency',
        description: 'High-risk zone evacuation protocol',
        lastUpdated: DateTime.now().subtract(const Duration(days: 45)),
        zones: ['Sector B Central', 'Sector B East'],
        shelters: 3,
        estimatedTime: '1.5 hours',
      ),
    ]);

    // Initialize widget options with actual data
    _widgetOptions.addAll([
      RiskDashboard(alerts: _alerts),
      AlertManagementScreen(alerts: _alerts, onAlertUpdate: _updateAlerts),
      EvacuationPlanScreen(plans: _evacuationPlans, onPlanUpdate: _updatePlans),
      const CoordinationToolsScreen(),
    ]);
  }

  void _updateAlerts(List<Alert> updatedAlerts) {
    setState(() {
      _alerts.clear();
      _alerts.addAll(updatedAlerts);
    });
  }

  void _updatePlans(List<EvacuationPlan> updatedPlans) {
    setState(() {
      _evacuationPlans.clear();
      _evacuationPlans.addAll(updatedPlans);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disaster Management Portal'),
        backgroundColor: Colors.red[700],
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Show notifications
              _showNotifications(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Show user profile
              _showUserProfile(context);
            },
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      floatingActionButton: _selectedIndex == 1 
          ? FloatingActionButton(
              onPressed: () {
                _showAddAlertDialog(context);
              },
              backgroundColor: Colors.red,
              child: const Icon(Icons.warning),
            )
          : _selectedIndex == 2
              ? FloatingActionButton(
                  onPressed: () {
                    _showAddEvacuationPlanDialog(context);
                  },
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.add),
                )
              : null,
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage('assets/disaster_management_header.jpg'), // Add your own asset
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.red.withOpacity(0.7), BlendMode.darken),
              ),
            ),
            child: Text(
              'Disaster Management',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard, color: Colors.red),
            title: const Text('Risk Dashboard'),
            selected: _selectedIndex == 0,
            onTap: () {
              _onItemTapped(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.warning, color: Colors.orange),
            title: const Text('Alert Management'),
            selected: _selectedIndex == 1,
            onTap: () {
              _onItemTapped(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.blue),
            title: const Text('Evacuation Plans'),
            selected: _selectedIndex == 2,
            onTap: () {
              _onItemTapped(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.group, color: Colors.green),
            title: const Text('Coordination Tools'),
            selected: _selectedIndex == 3,
            onTap: () {
              _onItemTapped(3);
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('GIS Overlay'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to GIS screen
              _showComingSoonSnackbar(context, 'GIS Overlay');
            },
          ),
          ListTile(
            leading: const Icon(Icons.analytics),
            title: const Text('AI Analytics'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Analytics screen
              _showComingSoonSnackbar(context, 'AI Analytics');
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_phone),
            title: const Text('Authority Contacts'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Contacts screen
              _showContactsDialog(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Settings screen
              _showComingSoonSnackbar(context, 'Settings');
            },
          ),
        ],
      ),
    );
  }

  void _showAddAlertDialog(BuildContext context) {
    final titleController = TextEditingController();
    final messageController = TextEditingController();
    final locationController = TextEditingController();
    Severity selectedSeverity = Severity.medium;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Create New Alert'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Alert Title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: messageController,
                      decoration: const InputDecoration(
                        labelText: 'Alert Message',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: locationController,
                      decoration: const InputDecoration(
                        labelText: 'Location',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Select Severity:'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoiceChip(
                          label: const Text('Low'),
                          selected: selectedSeverity == Severity.low,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedSeverity = Severity.low;
                            });
                          },
                          selectedColor: Colors.green,
                        ),
                        ChoiceChip(
                          label: const Text('Medium'),
                          selected: selectedSeverity == Severity.medium,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedSeverity = Severity.medium;
                            });
                          },
                          selectedColor: Colors.orange,
                        ),
                        ChoiceChip(
                          label: const Text('High'),
                          selected: selectedSeverity == Severity.high,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedSeverity = Severity.high;
                            });
                          },
                          selectedColor: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty && messageController.text.isNotEmpty) {
                      final newAlert = Alert(
                        title: titleController.text,
                        message: messageController.text,
                        severity: selectedSeverity,
                        timestamp: DateTime.now(),
                        location: locationController.text,
                      );
                      
                      setState(() {
                        _alerts.insert(0, newAlert);
                      });
                      
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Alert created successfully')),
                      );
                    }
                  },
                  child: const Text('Create Alert'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showAddEvacuationPlanDialog(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    final zonesController = TextEditingController();
    final sheltersController = TextEditingController();
    final timeController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create New Evacuation Plan'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Plan Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: zonesController,
                  decoration: const InputDecoration(
                    labelText: 'Zones (comma separated)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: sheltersController,
                  decoration: const InputDecoration(
                    labelText: 'Number of Shelters',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: timeController,
                  decoration: const InputDecoration(
                    labelText: 'Estimated Evacuation Time',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
                  final newPlan = EvacuationPlan(
                    name: nameController.text,
                    description: descriptionController.text,
                    lastUpdated: DateTime.now(),
                    zones: zonesController.text.split(',').map((zone) => zone.trim()).toList(),
                    shelters: int.tryParse(sheltersController.text) ?? 0,
                    estimatedTime: timeController.text,
                  );
                  
                  setState(() {
                    _evacuationPlans.add(newPlan);
                  });
                  
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Evacuation plan created successfully')),
                  );
                }
              },
              child: const Text('Create Plan'),
            ),
          ],
        );
      },
    );
  }

  void _showNotifications(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notifications'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _alerts.length,
              itemBuilder: (context, index) {
                final alert = _alerts[index];
                return ListTile(
                  leading: Icon(
                    Icons.warning,
                    color: _getSeverityColor(alert.severity),
                  ),
                  title: Text(alert.title),
                  subtitle: Text(DateFormat('MMM d, y - h:mm a').format(alert.timestamp)),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showUserProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User Profile'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/user_profile.jpg'), // Add your asset
              ),
              SizedBox(height: 16),
              Text('John Doe', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Disaster Management Officer'),
              SizedBox(height: 8),
              Text('Region: Northern Valleys'),
              Text('Last login: Today, 09:42 AM'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _showComingSoonSnackbar(context, 'Edit Profile');
              },
              child: const Text('Edit Profile'),
            ),
          ],
        );
      },
    );
  }

  void _showContactsDialog(BuildContext context) {
    final List<Map<String, String>> contacts = [
      {'name': 'Emergency Services', 'phone': '911'},
      {'name': 'Local Police', 'phone': '100'},
      {'name': 'Fire Department', 'phone': '101'},
      {'name': 'Medical Emergency', 'phone': '102'},
      {'name': 'Disaster Management HQ', 'phone': '+1-555-1234'},
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Authority Contacts'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  leading: const Icon(Icons.contact_phone),
                  title: Text(contact['name']!),
                  subtitle: Text(contact['phone']!),
                  trailing: IconButton(
                    icon: const Icon(Icons.phone),
                    onPressed: () {
                      // Implement phone call functionality
                      _showComingSoonSnackbar(context, 'Calling ${contact['name']}');
                    },
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showComingSoonSnackbar(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$feature feature coming soon!')),
    );
  }

  Color _getSeverityColor(Severity severity) {
    switch (severity) {
      case Severity.low:
        return Colors.green;
      case Severity.medium:
        return Colors.orange;
      case Severity.high:
        return Colors.red;
    }
  }
}

enum Severity { low, medium, high }

class Alert {
  final String title;
  final String message;
  final Severity severity;
  final DateTime timestamp;
  final String location;

  Alert({
    required this.title,
    required this.message,
    required this.severity,
    required this.timestamp,
    required this.location,
  });
}

class EvacuationPlan {
  final String name;
  final String description;
  final DateTime lastUpdated;
  final List<String> zones;
  final int shelters;
  final String estimatedTime;

  EvacuationPlan({
    required this.name,
    required this.description,
    required this.lastUpdated,
    required this.zones,
    required this.shelters,
    required this.estimatedTime,
  });
}

class RiskDashboard extends StatelessWidget {
  final List<Alert> alerts;

  const RiskDashboard({super.key, required this.alerts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Live GLOF Risk Dashboard',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // Risk indicators
          Row(
            children: [
              _RiskIndicator(
                title: 'High Risk Zones',
                value: '12',
                color: Colors.red,
              ),
              const SizedBox(width: 16),
              _RiskIndicator(
                title: 'Medium Risk Zones',
                value: '8',
                color: Colors.orange,
              ),
              const SizedBox(width: 16),
              _RiskIndicator(
                title: 'Low Risk Zones',
                value: '15',
                color: Colors.green,
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Weather alert
          Card(
            color: Colors.orange[50],
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  const Icon(Icons.warning_amber, color: Colors.orange),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Weather Advisory',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Heavy rainfall expected in next 48 hours',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Recent events
          const Text(
            'Recent Alerts',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: alerts.length,
              itemBuilder: (context, index) {
                final alert = alerts[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Icon(Icons.warning, color: _getSeverityColor(alert.severity)),
                    title: Text(alert.title),
                    subtitle: Text('${alert.location} • ${DateFormat('MMM d, h:mm a').format(alert.timestamp)}'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Navigate to alert details
                      _showAlertDetails(context, alert);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color _getSeverityColor(Severity severity) {
    switch (severity) {
      case Severity.low:
        return Colors.green;
      case Severity.medium:
        return Colors.orange;
      case Severity.high:
        return Colors.red;
    }
  }

  void _showAlertDetails(BuildContext context, Alert alert) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(alert.title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(alert.message),
              const SizedBox(height: 16),
              Text('Location: ${alert.location}'),
              Text('Time: ${DateFormat('MMM d, y - h:mm a').format(alert.timestamp)}'),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('Severity: '),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getSeverityColor(alert.severity).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      alert.severity.toString().split('.').last.toUpperCase(),
                      style: TextStyle(
                        color: _getSeverityColor(alert.severity),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                // Implement action button
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Action initiated')),
                );
                Navigator.pop(context);
              },
              child: const Text('Take Action'),
            ),
          ],
        );
      },
    );
  }
}

class _RiskIndicator extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _RiskIndicator({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: color.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                value,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: color, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlertManagementScreen extends StatefulWidget {
  final List<Alert> alerts;
  final Function(List<Alert>) onAlertUpdate;

  const AlertManagementScreen({super.key, required this.alerts, required this.onAlertUpdate});

  @override
  _AlertManagementScreenState createState() => _AlertManagementScreenState();
}

class _AlertManagementScreenState extends State<AlertManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Alert Management',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: widget.alerts.isEmpty
                ? const Center(
                    child: Text('No alerts found. Create your first alert!'),
                  )
                : ListView.builder(
                    itemCount: widget.alerts.length,
                    itemBuilder: (context, index) {
                      final alert = widget.alerts[index];
                      return Dismissible(
                        key: Key(alert.timestamp.toString()),
                        background: Container(color: Colors.red),
                        onDismissed: (direction) {
                          setState(() {
                            widget.alerts.removeAt(index);
                            widget.onAlertUpdate(widget.alerts);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Dismissed ${alert.title}')),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            leading: Icon(Icons.warning, color: _getSeverityColor(alert.severity)),
                            title: Text(alert.title),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(alert.message),
                                const SizedBox(height: 4),
                                Text(
                                  '${alert.location} • ${DateFormat('MMM d, h:mm a').format(alert.timestamp)}',
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                            trailing: PopupMenuButton(
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: 'edit',
                                  child: Text('Edit'),
                                ),
                                const PopupMenuItem(
                                  value: 'delete',
                                  child: Text('Delete'),
                                ),
                              ],
                              onSelected: (value) {
                                if (value == 'delete') {
                                  setState(() {
                                    widget.alerts.removeAt(index);
                                    widget.onAlertUpdate(widget.alerts);
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Deleted ${alert.title}')),
                                  );
                                } else if (value == 'edit') {
                                  _editAlert(context, alert, index);
                                }
                              },
                            ),
                            onTap: () {
                              // View alert details
                              _showAlertDetails(context, alert);
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Color _getSeverityColor(Severity severity) {
    switch (severity) {
      case Severity.low:
        return Colors.green;
      case Severity.medium:
        return Colors.orange;
      case Severity.high:
        return Colors.red;
    }
  }

  void _showAlertDetails(BuildContext context, Alert alert) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(alert.title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(alert.message),
              const SizedBox(height: 16),
              Text('Location: ${alert.location}'),
              Text('Time: ${DateFormat('MMM d, y - h:mm a').format(alert.timestamp)}'),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('Severity: '),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getSeverityColor(alert.severity).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      alert.severity.toString().split('.').last.toUpperCase(),
                      style: TextStyle(
                        color: _getSeverityColor(alert.severity),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                // Implement action button
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Action initiated')),
                );
                Navigator.pop(context);
              },
              child: const Text('Take Action'),
            ),
          ],
        );
      },
    );
  }

  void _editAlert(BuildContext context, Alert alert, int index) {
    final titleController = TextEditingController(text: alert.title);
    final messageController = TextEditingController(text: alert.message);
    final locationController = TextEditingController(text: alert.location);
    Severity selectedSeverity = alert.severity;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Edit Alert'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Alert Title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: messageController,
                      decoration: const InputDecoration(
                        labelText: 'Alert Message',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: locationController,
                      decoration: const InputDecoration(
                        labelText: 'Location',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Select Severity:'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoiceChip(
                          label: const Text('Low'),
                          selected: selectedSeverity == Severity.low,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedSeverity = Severity.low;
                            });
                          },
                          selectedColor: Colors.green,
                        ),
                        ChoiceChip(
                          label: const Text('Medium'),
                          selected: selectedSeverity == Severity.medium,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedSeverity = Severity.medium;
                            });
                          },
                          selectedColor: Colors.orange,
                        ),
                        ChoiceChip(
                          label: const Text('High'),
                          selected: selectedSeverity == Severity.high,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedSeverity = Severity.high;
                            });
                          },
                          selectedColor: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty && messageController.text.isNotEmpty) {
                      final updatedAlert = Alert(
                        title: titleController.text,
                        message: messageController.text,
                        severity: selectedSeverity,
                        timestamp: alert.timestamp,
                        location: locationController.text,
                      );
                      
                      setState(() {
                        widget.alerts[index] = updatedAlert;
                        widget.onAlertUpdate(widget.alerts);
                      });
                      
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Alert updated successfully')),
                      );
                    }
                  },
                  child: const Text('Update Alert'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class EvacuationPlanScreen extends StatefulWidget {
  final List<EvacuationPlan> plans;
  final Function(List<EvacuationPlan>) onPlanUpdate;

  const EvacuationPlanScreen({super.key, required this.plans, required this.onPlanUpdate});

  @override
  _EvacuationPlanScreenState createState() => _EvacuationPlanScreenState();
}

class _EvacuationPlanScreenState extends State<EvacuationPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Evacuation Plan Management',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: widget.plans.isEmpty
                ? const Center(
                    child: Text('No evacuation plans found. Create your first plan!'),
                  )
                : ListView.builder(
                    itemCount: widget.plans.length,
                    itemBuilder: (context, index) {
                      final plan = widget.plans[index];
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.exit_to_app, color: Colors.blue),
                          title: Text(plan.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(plan.description),
                              const SizedBox(height: 4),
                              Text(
                                'Last updated: ${DateFormat('MMM d, y').format(plan.lastUpdated)}',
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                          trailing: PopupMenuButton(
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'edit',
                                child: Text('Edit'),
                              ),
                              const PopupMenuItem(
                                value: 'delete',
                                child: Text('Delete'),
                              ),
                            ],
                            onSelected: (value) {
                              if (value == 'delete') {
                                setState(() {
                                  widget.plans.removeAt(index);
                                  widget.onPlanUpdate(widget.plans);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Deleted ${plan.name}')),
                                );
                              } else if (value == 'edit') {
                                _editPlan(context, plan, index);
                              }
                            },
                          ),
                          onTap: () {
                            // View evacuation plan details
                            _showPlanDetails(context, plan);
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _showPlanDetails(BuildContext context, EvacuationPlan plan) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(plan.name),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(plan.description),
                const SizedBox(height: 16),
                const Text('Covered Zones:', style: TextStyle(fontWeight: FontWeight.bold)),
                ...plan.zones.map((zone) => Text('• $zone')).toList(),
                const SizedBox(height: 16),
                Text('Number of Shelters: ${plan.shelters}'),
                Text('Estimated Evacuation Time: ${plan.estimatedTime}'),
                Text('Last Updated: ${DateFormat('MMM d, y').format(plan.lastUpdated)}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                // Implement action button
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Evacuation plan activated')),
                );
                Navigator.pop(context);
              },
              child: const Text('Activate Plan'),
            ),
          ],
        );
      },
    );
  }

  void _editPlan(BuildContext context, EvacuationPlan plan, int index) {
    final nameController = TextEditingController(text: plan.name);
    final descriptionController = TextEditingController(text: plan.description);
    final zonesController = TextEditingController(text: plan.zones.join(', '));
    final sheltersController = TextEditingController(text: plan.shelters.toString());
    final timeController = TextEditingController(text: plan.estimatedTime);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Evacuation Plan'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Plan Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: zonesController,
                  decoration: const InputDecoration(
                    labelText: 'Zones (comma separated)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: sheltersController,
                  decoration: const InputDecoration(
                    labelText: 'Number of Shelters',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: timeController,
                  decoration: const InputDecoration(
                    labelText: 'Estimated Evacuation Time',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
                  final updatedPlan = EvacuationPlan(
                    name: nameController.text,
                    description: descriptionController.text,
                    lastUpdated: DateTime.now(),
                    zones: zonesController.text.split(',').map((zone) => zone.trim()).toList(),
                    shelters: int.tryParse(sheltersController.text) ?? 0,
                    estimatedTime: timeController.text,
                  );
                  
                  setState(() {
                    widget.plans[index] = updatedPlan;
                    widget.onPlanUpdate(widget.plans);
                  });
                  
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Evacuation plan updated successfully')),
                  );
                }
              },
              child: const Text('Update Plan'),
            ),
          ],
        );
      },
    );
  }
}

class CoordinationToolsScreen extends StatelessWidget {
  const CoordinationToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Coordination Tools',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.0,
              ),
              children: [
                _CoordinationTool(
                  icon: Icons.group,
                  title: 'Team Status',
                  color: Colors.blue,
                  onTap: () {
                    _showTeamStatus(context);
                  },
                ),
                _CoordinationTool(
                  icon: Icons.comment,
                  title: 'Team Chat',
                  color: Colors.green,
                  onTap: () {
                    _showTeamChat(context);
                  },
                ),
                _CoordinationTool(
                  icon: Icons.assignment,
                  title: 'Task Assignment',
                  color: Colors.orange,
                  onTap: () {
                    _showTaskAssignment(context);
                  },
                ),
                _CoordinationTool(
                  icon: Icons.place,
                  title: 'Resource Map',
                  color: Colors.purple,
                  onTap: () {
                    _showResourceMap(context);
                  },
                ),
                _CoordinationTool(
                  icon: Icons.emergency,
                  title: 'Emergency Protocols',
                  color: Colors.red,
                  onTap: () {
                    _showEmergencyProtocols(context);
                  },
                ),
                _CoordinationTool(
                  icon: Icons.history,
                  title: 'Activity Log',
                  color: Colors.teal,
                  onTap: () {
                    _showActivityLog(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showTeamStatus(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Team Status'),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _TeamMemberStatus(name: 'John Doe', status: 'Available', role: 'Team Lead'),
                _TeamMemberStatus(name: 'Jane Smith', status: 'On Assignment', role: 'Field Officer'),
                _TeamMemberStatus(name: 'Robert Johnson', status: 'Available', role: 'Logistics'),
                _TeamMemberStatus(name: 'Sarah Williams', status: 'Off Duty', role: 'Medical Officer'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showTeamChat(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Team Chat'),
          content: SizedBox(
            width: double.maxFinite,
            height: 300,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: const [
                      _ChatMessage(
                        sender: 'John Doe',
                        message: 'Has everyone checked the latest weather advisory?',
                        time: '10:15 AM',
                      ),
                      _ChatMessage(
                        sender: 'Jane Smith',
                        message: 'Yes, we might need to activate Plan B if conditions worsen',
                        time: '10:17 AM',
                        isMe: true,
                      ),
                      _ChatMessage(
                        sender: 'Robert Johnson',
                        message: 'I\'ve prepared the emergency kits and they\'re ready for distribution',
                        time: '10:20 AM',
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Type a message...',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          ),
                          onSubmitted: (value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Message sent')),
                            );
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Message sent')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showTaskAssignment(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Task Assignment'),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _TaskItem(
                  task: 'Distribute emergency kits',
                  assignedTo: 'Robert Johnson',
                  status: 'In Progress',
                ),
                _TaskItem(
                  task: 'Monitor water levels',
                  assignedTo: 'Jane Smith',
                  status: 'Completed',
                ),
                _TaskItem(
                  task: 'Coordinate with local authorities',
                  assignedTo: 'John Doe',
                  status: 'Not Started',
                ),
                _TaskItem(
                  task: 'Prepare evacuation routes',
                  assignedTo: 'Team',
                  status: 'In Progress',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('New task dialog would open here')),
                );
              },
              child: const Text('Add Task'),
            ),
          ],
        );
      },
    );
  }

  void _showResourceMap(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resource Map'),
          content: SizedBox(
            width: double.maxFinite,
            height: 300,
            child: Column(
              children: [
                Image.asset(
                  'assets/map_placeholder.jpg', // Add your own asset
                  fit: BoxFit.cover,
                  height: 200,
                ),
                const SizedBox(height: 16),
                const Text('Emergency Resources Distribution'),
                const SizedBox(height: 8),
                const Wrap(
                  spacing: 8,
                  children: [
                    Chip(
                      label: Text('Shelters: 5'),
                      backgroundColor: Colors.blue,
                    ),
                    Chip(
                      label: Text('Medical: 3'),
                      backgroundColor: Colors.green,
                    ),
                    Chip(
                      label: Text('Food: 2'),
                      backgroundColor: Colors.orange,
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showEmergencyProtocols(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Emergency Protocols'),
          content: SizedBox(
            width: double.maxFinite,
            height: 300,
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.medical_services),
                  title: Text('Medical Emergency'),
                  subtitle: Text('Protocol for medical emergencies and first aid'),
                ),
                ListTile(
                  leading: Icon(Icons.fire_extinguisher),
                  title: Text('Fire Response'),
                  subtitle: Text('Procedures for fire incidents'),
                ),
                ListTile(
                  leading: Icon(Icons.flood),
                  title: Text('Flood Response'),
                  subtitle: Text('Protocol for flood situations and water rescue'),
                ),
                ListTile(
                  leading: Icon(Icons.warning),
                  title: Text('Evacuation Procedures'),
                  subtitle: Text('Step-by-step evacuation guidelines'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showActivityLog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Activity Log'),
          content: SizedBox(
            width: double.maxFinite,
            height: 300,
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.warning, color: Colors.orange),
                  title: Text('Alert created'),
                  subtitle: Text('GLOF Warning - Sector B • 2 hours ago'),
                ),
                ListTile(
                  leading: Icon(Icons.update, color: Colors.blue),
                  title: Text('Evacuation plan updated'),
                  subtitle: Text('Valley 4 Emergency Plan • 5 hours ago'),
                ),
                ListTile(
                  leading: Icon(Icons.assignment_turned_in, color: Colors.green),
                  title: Text('Task completed'),
                  subtitle: Text('Monitor water levels • Yesterday'),
                ),
                ListTile(
                  leading: Icon(Icons.group_add, color: Colors.purple),
                  title: Text('Team member added'),
                  subtitle: Text('Sarah Williams joined • 2 days ago'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class _CoordinationTool extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _CoordinationTool({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TeamMemberStatus extends StatelessWidget {
  final String name;
  final String status;
  final String role;

  const _TeamMemberStatus({
    required this.name,
    required this.status,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.grey;
    if (status == 'Available') statusColor = Colors.green;
    if (status == 'On Assignment') statusColor = Colors.orange;
    if (status == 'Off Duty') statusColor = Colors.grey;

    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(name),
      subtitle: Text(role),
      trailing: Chip(
        label: Text(
          status,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
        backgroundColor: statusColor,
        padding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}

class _ChatMessage extends StatelessWidget {
  final String sender;
  final String message;
  final String time;
  final bool isMe;

  const _ChatMessage({
    required this.sender,
    required this.message,
    required this.time,
    this.isMe = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe)
            const CircleAvatar(
              radius: 16,
              child: Icon(Icons.person, size: 16),
            ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isMe ? Colors.blue[100] : Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isMe)
                    Text(
                      sender,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  Text(message),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ),
          if (isMe)
            const CircleAvatar(
              radius: 16,
              child: Icon(Icons.person, size: 16),
            ),
        ],
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  final String task;
  final String assignedTo;
  final String status;

  const _TaskItem({
    required this.task,
    required this.assignedTo,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.grey;
    if (status == 'Completed') statusColor = Colors.green;
    if (status == 'In Progress') statusColor = Colors.orange;
    if (status == 'Not Started') statusColor = Colors.grey;

    return ListTile(
      leading: const Icon(Icons.assignment),
      title: Text(task),
      subtitle: Text('Assigned to: $assignedTo'),
      trailing: Chip(
        label: Text(
          status,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
        backgroundColor: statusColor,
      ),
    );
  }
}




// Farmers Portal
class FarmersPortal extends StatefulWidget {
  const FarmersPortal({super.key});

  @override
  _FarmersPortalState createState() => _FarmersPortalState();
}

class _FarmersPortalState extends State<FarmersPortal> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const FarmRiskScreen(),
    const CropSafetyScreen(),
    const LivestockAlertsScreen(),
    const AdvisoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmers Portal'),
        backgroundColor: Colors.orange[700],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text(
                'Farmers Portal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.agriculture),
              title: const Text('Farm Risk Assessment'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.spa),
              title: const Text('Crop Safety Guidance'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.pets),
              title: const Text('Livestock Alerts'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.lightbulb),
              title: const Text('Advisory Services'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.water_drop),
              title: const Text('Water Source Safety'),
              onTap: () {
                // Navigate to water safety
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Request Rescue'),
              onTap: () {
                // Navigate to rescue request
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Early Warnings'),
              onTap: () {
                // Navigate to warnings
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Request rescue action
          _showRescueRequestDialog(context);
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.help),
      ),
    );
  }

  void _showRescueRequestDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Request Rescue'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextField(
                decoration: InputDecoration(labelText: 'Location'),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Number of People'),
                keyboardType: TextInputType.number,
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Special Needs'),
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Urgency:'),
                  const SizedBox(width: 10),
                  // Add urgency selection here
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle rescue request
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Rescue request submitted')),
                );
              },
              child: const Text('Request Help'),
            ),
          ],
        );
      },
    );
  }
}

class FarmRiskScreen extends StatelessWidget {
  const FarmRiskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Farm Risk Assessment',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Your Farm Risk Level:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const LinearProgressIndicator(
                    value: 0.7,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                  const SizedBox(height: 8),
                  const Text('High Risk - Prepare for possible evacuation',
                      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.red)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // View detailed assessment
                    },
                    child: const Text('View Detailed Assessment'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Nearby Risk Factors:'),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.water, color: Colors.blue),
                  title: Text('River 500m from property'),
                  subtitle: Text('Potential flooding risk'),
                ),
                ListTile(
                  leading: Icon(Icons.terrain, color: Colors.brown),
                  title: Text('Low-lying area'),
                  subtitle: Text('Water may accumulate during floods'),
                ),
                ListTile(
                  leading: Icon(Icons.warning, color: Colors.orange),
                  title: Text('Previous flood event in 2022'),
                  subtitle: Text('Area has experienced flooding before'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CropSafetyScreen extends StatelessWidget {
  const CropSafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Crop Safety Guidance',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: const [
                Card(
                  child: ListTile(
                    leading: Icon(Icons.agriculture, color: Colors.green),
                    title: Text('Harvest early maturing crops'),
                    subtitle: Text('Priority action for flood preparedness'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.inventory, color: Colors.blue),
                    title: Text('Secure seed stocks in elevated storage'),
                    subtitle: Text('Protect future planting materials'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.grass, color: Colors.brown),
                    title: Text('Relocate vulnerable crops if possible'),
                    subtitle: Text('Move potted plants to higher ground'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.clean_hands, color: Colors.purple),
                    title: Text('Post-flood crop cleaning procedures'),
                    subtitle: Text('Remove silt and debris from plants'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.health_and_safety, color: Colors.red),
                    title: Text('Food safety after flooding'),
                    subtitle: Text('Test crops for contamination before consumption'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LivestockAlertsScreen extends StatelessWidget {
  const LivestockAlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Livestock Alerts',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Card(
            color: Colors.orange[100],
            child: const ListTile(
              leading: Icon(Icons.warning, color: Colors.orange),
              title: Text('Livestock Evacuation Advisory'),
              subtitle: Text('Move animals to higher ground by tomorrow'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Recent Alerts:'),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.pets),
                    title: Text('Livestock Alert ${index + 1}'),
                    subtitle: const Text('Important information for animal safety'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // View alert details
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AdvisoryScreen extends StatelessWidget {
  const AdvisoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Advisory Services',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text('Select your district:'),
          DropdownButton<String>(
            value: 'District 1',
            items: <String>['District 1', 'District 2', 'District 3']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle district change
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: const [
                Card(
                  child: ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text('Flood Preparedness Timeline'),
                    subtitle: Text('Step-by-step guide for the next 72 hours'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.contact_phone),
                    title: Text('Agricultural Extension Contacts'),
                    subtitle: Text('Local experts available for consultation'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Financial Assistance Programs'),
                    subtitle: Text('Support available for affected farmers'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.book),
                    title: Text('Post-Flood Recovery Guide'),
                    subtitle: Text('Restoring your farm after flood waters recede'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Government Officials Portal
class GovernmentOfficialsPortal extends StatefulWidget {
  const GovernmentOfficialsPortal({super.key});

  @override
  _GovernmentOfficialsPortalState createState() => _GovernmentOfficialsPortalState();
}

class _GovernmentOfficialsPortalState extends State<GovernmentOfficialsPortal> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const AnalyticsScreen(),
    const NotificationScreen(),
    const ResourceManagementScreen(),
    const PolicyScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Government Officials Portal'),
        backgroundColor: Colors.purple[700],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Text(
                'Government Portal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('Macro Analytics'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Bulk Notifications'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.inventory),
              title: const Text('Resource Management'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.policy),
              title: const Text('Policy Communication'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.monitor),
              title: const Text('Team Monitoring'),
              onTap: () {
                // Navigate to team monitoring
              },
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('GLOF Event Tracker'),
              onTap: () {
                // Navigate to event tracker
              },
            ),
            ListTile(
              leading: const Icon(Icons.assessment),
              title: const Text('Compliance Monitoring'),
              onTap: () {
                // Navigate to compliance
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Broadcast message action
          _showBroadcastDialog(context);
        },
        backgroundColor: Colors.purple,
        child: const Icon(Icons.broadcast_on_home),
      ),
    );
  }

  void _showBroadcastDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Broadcast Message'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Select target audience:'),
              Wrap(
                children: [
                  FilterChip(
                    label: const Text('All Villagers'),
                    selected: true,
                    onSelected: (bool value) {},
                  ),
                  const SizedBox(width: 5),
                  FilterChip(
                    label: const Text('Farmers'),
                    selected: false,
                    onSelected: (bool value) {},
                  ),
                  const SizedBox(width: 5),
                  FilterChip(
                    label: const Text('Specific District'),
                    selected: false,
                    onSelected: (bool value) {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(labelText: 'Message Title'),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Message Content'),
                maxLines: 4,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle broadcast
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Message broadcasted successfully')),
                );
              },
              child: const Text('Broadcast'),
            ),
          ],
        );
      },
    );
  }
}

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Macro-Level Analytics',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _AnalyticsCard(
                title: 'At-Risk Population',
                value: '12,450',
                color: Colors.red,
              ),
              const SizedBox(width: 16),
              _AnalyticsCard(
                title: 'Evacuation Readiness',
                value: '68%',
                color: Colors.orange,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _AnalyticsCard(
                title: 'Active Teams',
                value: '24',
                color: Colors.blue,
              ),
              const SizedBox(width: 16),
              _AnalyticsCard(
                title: 'Resources Deployed',
                value: '87%',
                color: Colors.green,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Regional Risk Distribution:'),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text('Risk Distribution Chart',
                  style: TextStyle(color: Colors.grey)),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnalyticsCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _AnalyticsCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: color.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                value,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bulk Notification System',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Send emergency alert to:'),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      FilterChip(
                        label: const Text('All Users'),
                        selected: true,
                        onSelected: (bool value) {},
                      ),
                      FilterChip(
                        label: const Text('Villagers'),
                        selected: false,
                        onSelected: (bool value) {},
                      ),
                      FilterChip(
                        label: const Text('Farmers'),
                        selected: false,
                        onSelected: (bool value) {},
                      ),
                      FilterChip(
                        label: const Text('Specific District'),
                        selected: false,
                        onSelected: (bool value) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Notification Message',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Send notification
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Notification sent successfully')),
                      );
                    },
                    child: const Text('Send Notification'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Recent Notifications:'),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.notification_important),
                    title: Text('Official Alert ${index + 1}'),
                    subtitle: const Text('Emergency notification for all residents'),
                    trailing: Text('${5 - index}h ago'),
                    onTap: () {
                      // View notification details
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ResourceManagementScreen extends StatelessWidget {
  const ResourceManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Emergency Resource Management',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _ResourceCard(
                  title: 'Relief Kits',
                  count: '1,245',
                  color: Colors.blue,
                ),
                _ResourceCard(
                  title: 'Boats Available',
                  count: '42',
                  color: Colors.green,
                ),
                _ResourceCard(
                  title: 'Emergency Shelters',
                  count: '18',
                  color: Colors.orange,
                ),
                _ResourceCard(
                  title: 'Medical Teams',
                  count: '27',
                  color: Colors.red,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              // View resource distribution map
            },
            icon: const Icon(Icons.map),
            label: const Text('View Resource Distribution Map'),
          ),
        ],
      ),
    );
  }
}

class _ResourceCard extends StatelessWidget {
  final String title;
  final String count;
  final Color color;

  const _ResourceCard({
    required this.title,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }
}

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Policy Communication',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              // Upload new policy
              _showUploadPolicyDialog(context);
            },
            icon: const Icon(Icons.upload),
            label: const Text('Upload New Policy Document'),
          ),
          const SizedBox(height: 16),
          const Text('Recent Policy Documents:'),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.description),
                    title: Text('Policy Document ${index + 1}'),
                    subtitle: const Text('GLOF preparedness guidelines'),
                    trailing: const Icon(Icons.download),
                    onTap: () {
                      // Download policy document
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showUploadPolicyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Upload Policy Document'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextField(
                decoration: InputDecoration(labelText: 'Document Title'),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  // Select file
                },
                icon: const Icon(Icons.attach_file),
                label: const Text('Select File'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle policy upload
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Policy document uploaded successfully')),
                );
              },
              child: const Text('Upload'),
            ),
          ],
        );
      },
    );
  }
}