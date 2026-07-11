import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JT Soluções e Comércio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade800),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('JT Soluções e Comércio'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(32.0),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Column(
                children: [
                  const Icon(Icons.business_center, size: 64, color: Colors.blue),
                  const SizedBox(height: 16),
                  Text(
                    'Bem-vindo à JT Soluções e Comércio',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Oferecemos as melhores soluções e produtos para o seu negócio.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Nossos Destaques',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Wrap(
                    spacing: 16.0,
                    runSpacing: 16.0,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildFeatureCard(
                        context,
                        icon: Icons.computer,
                        title: 'Soluções em TI',
                        description: 'Infraestrutura, desenvolvimento e suporte técnico especializado.',
                        width: constraints.maxWidth > 600 ? 280 : constraints.maxWidth,
                      ),
                      _buildFeatureCard(
                        context,
                        icon: Icons.storefront,
                        title: 'Comércio de Equipamentos',
                        description: 'Venda de produtos de alta qualidade com as melhores marcas.',
                        width: constraints.maxWidth > 600 ? 280 : constraints.maxWidth,
                      ),
                      _buildFeatureCard(
                        context,
                        icon: Icons.handshake,
                        title: 'Consultoria',
                        description: 'Orientação estratégica para alavancar os seus resultados.',
                        width: constraints.maxWidth > 600 ? 280 : constraints.maxWidth,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Em breve: Formulário de Contato!')),
          );
        },
        icon: const Icon(Icons.chat),
        label: const Text('Fale Conosco'),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, {required IconData icon, required String title, required String description, required double width}) {
    return SizedBox(
      width: width,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Icon(icon, size: 48, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
