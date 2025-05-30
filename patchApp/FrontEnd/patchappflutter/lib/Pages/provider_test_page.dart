import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:patchappflutter/Model/patch_model.dart';
import 'package:patchappflutter/Model/user_model.dart';
import 'package:patchappflutter/Pages/search_page.dart';
import 'package:provider/provider.dart';
import '';

// TODO: ADD YOUR PROVIDER IMPORTS HERE
// Example:
import 'package:patchappflutter/Provider/user_provider.dart';
import 'package:patchappflutter/Provider/Patch_Provider.dart';
import 'package:patchappflutter/Provider/trade_request_provider.dart';
// import 'main_provider.dart';

class ProviderUIScreen extends StatefulWidget {
  const ProviderUIScreen({Key? key}) : super(key: key);

  @override
  State<ProviderUIScreen> createState() => _ProviderUIScreenState();
}

class _ProviderUIScreenState extends State<ProviderUIScreen> {
  bool _isLoading = false;
  String _statusMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Control Panel'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade50,
              Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Status Card
              Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 30),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Icon(
                        _isLoading ? Icons.hourglass_empty : Icons.dashboard,
                        size: 40,
                        color: Colors.deepPurple,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Provider Status',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _statusMessage.isEmpty ? 'Ready' : _statusMessage,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (_isLoading)
                        const Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: LinearProgressIndicator(),
                        ),
                    ],
                  ),
                ),
              ),

              // Provider Buttons
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                  children: [
                    // User Provider Button
                    _buildProviderButton(
                      title: 'User Provider',
                      subtitle: 'Manage Users',
                      icon: Icons.person,
                      color: Colors.blue,
                      onPressed: () => _handleUserProviderAction(),
                    ),

                    // Patch Provider Button
                    _buildProviderButton(
                      title: 'Patch Provider',
                      subtitle: 'Handle Patches',
                      icon: Icons.build_circle,
                      color: Colors.green,
                      onPressed: () => _handlePatchProviderAction(),
                    ),

                    // Trade Provider Button
                    _buildProviderButton(
                      title: 'Trade Provider',
                      subtitle: 'Execute Trades',
                      icon: Icons.trending_up,
                      color: Colors.orange,
                      onPressed: () => _handleTradeProviderAction(),
                    ),

                    // Main Provider Button
                    _buildProviderButton(
                      title: 'Main Provider',
                      subtitle: 'Sync All',
                      icon: Icons.sync,
                      color: Colors.purple,
                      onPressed: () => _handleMainProviderAction(),
                    ),
                  ],
                ),
              ),

              // Action Buttons Row
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _isLoading ? null : _refreshAllProviders,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Refresh All'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _isLoading ? null : _resetAllProviders,
                      icon: const Icon(Icons.restore),
                      label: const Text('Reset All'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProviderButton({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: _isLoading ? null : onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.1),
                color.withOpacity(0.05),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: color,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TODO: REPLACE THESE METHODS WITH YOUR ACTUAL PROVIDER CALLS

  Future<void> _handleUserProviderAction() async {
    setState(() {
      _isLoading = true;
      _statusMessage = 'Processing User Provider action...';
    });

    try {
      // TODO: ADD YOUR USER PROVIDER LOGIC HERE
      // Example:
      // final userProvider = Provider.of<UserProvider>(context, listen: false);
      final userProvider = Provider.of<UserProvider>(context, listen:false);
      // await userProvider.registerUser({'name': 'Test User'});
      UserModel testUser = UserModel(id: null, firstName: "johan", surName: "johansson", kmName: "janne", emailAddress: "Janne@gmail.com", university: 'test', biography: '123', pictureData: null, username: 'asdbdasjb', password: '1234');
      await userProvider.registerUser(testUser);

      // OR
      // await userProvider.searchUser('test query');
      // OR
      // await userProvider.updateUser('userId', {'field': 'value'});
      // OR
      // userProvider.changeOverIndex(1);

      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      setState(() {
        print( 'User Provider action completed successfully!');
      });
    } catch (e) {
      setState(() {
        print( 'User Provider error: $e');
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _handlePatchProviderAction() async {
    setState(() {
      _isLoading = true;
      _statusMessage = 'Processing Patch Provider action...';
    });

    try {
      // TODO: ADD YOUR PATCH PROVIDER LOGIC HERE
      // Example:
      // final patchProvider = Provider.of<PatchProvider>(context, listen: false);
      final patchProvider = Provider.of<PatchProvider>(context, listen: false);
      PatchModel testPatch = PatchModel(description: "Hej", ownerId: 1, isPublic: true, placement: "SKREV", klubbmasteri: "DISK", patchName: "WhatTheFuckÄrDetHär", color: "BLÅ", pictureData: null,);
      await patchProvider.registerPatchTester(testPatch);
      // await patchProvider.applyPatch();
      // OR
      // await patchProvider.createPatch(patchData)
      // OR
      // await patchProvider.deletePatch(patchId);

      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      setState(() {
        print('Patch Provider action completed successfully!');
      });
    } catch (e) {
      setState(() {
        print('Patch Provider error: $e');
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _handleTradeProviderAction() async {
    setState(() {
      _isLoading = true;
      _statusMessage = 'Processing Trade Provider action...';
    });

    try {
      // TODO: ADD YOUR TRADE PROVIDER LOGIC HERE
      // Example:
      // final tradeProvider = Provider.of<TradeProvider>(context, listen: false);
      final tradeProvider = Provider.of<TradeProvider>(context, listen: false);
      // await tradeProvider.executeTrade(tradeData);
      // OR
      // await tradeProvider.cancelTrade(tradeId);
      // OR
      // final trades = await tradeProvider.getActiveTrades();

      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      setState(() {
        _statusMessage = 'Trade Provider action completed successfully!';
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'Trade Provider error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _handleMainProviderAction() async {
    setState(() {
      _isLoading = true;
      _statusMessage = 'Processing Main Provider action...';
    });

    try {
      // TODO: ADD YOUR MAIN PROVIDER LOGIC HERE
      // Example:
      // final mainProvider = Provider.of<MainProvider>(context, listen: false);
      // await mainProvider.registerUserComplete(userData: {'name': 'User'});
      // OR
      // await mainProvider.updateUserComplete(userId: 'id', updates: {});
      // OR
      // await mainProvider.executeComplexOperation(
      //   operationType: 'full_data_refresh',
      //   parameters: {},
      // );

      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      setState(() {
        _statusMessage = 'Main Provider action completed successfully!';
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'Main Provider error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _refreshAllProviders() async {
    setState(() {
      _isLoading = true;
      _statusMessage = 'Refreshing all providers...';
    });

    try {
      // TODO: ADD YOUR REFRESH LOGIC HERE
      // Example:
      // final mainProvider = Provider.of<MainProvider>(context, listen: false);
      // await mainProvider.executeComplexOperation(
      //   operationType: 'full_data_refresh',
      //   parameters: {},
      // );

      await Future.delayed(const Duration(seconds: 3)); // Simulate refresh

      setState(() {
        _statusMessage = 'All providers refreshed successfully!';
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'Refresh error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _resetAllProviders() async {
    setState(() {
      _isLoading = true;
      _statusMessage = 'Resetting all providers...';
    });

    try {
      // TODO: ADD YOUR RESET LOGIC HERE
      // Example:
      // final mainProvider = Provider.of<MainProvider>(context, listen: false);
      // await mainProvider.resetAll();

      await Future.delayed(const Duration(seconds: 2)); // Simulate reset

      setState(() {
        _statusMessage = 'All providers reset successfully!';
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'Reset error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}

// TODO: WRAP THIS WIDGET WITH YOUR PROVIDERS IN YOUR MAIN APP
// Example usage in your main.dart or app.dart:
/*
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => PatchProvider()),
    ChangeNotifierProvider(create: (_) => TradeProvider()),
    ChangeNotifierProxyProvider3<UserProvider, PatchProvider, TradeProvider, MainProvider>(
      create: (_) => MainProvider(
        userProvider: UserProvider(),
        patchProvider: PatchProvider(),
        tradeProvider: TradeProvider(),
      ),
      update: (_, userProvider, patchProvider, tradeProvider, mainProvider) =>
          MainProvider(
            userProvider: userProvider,
            patchProvider: patchProvider,
            tradeProvider: tradeProvider,
          ),
    ),
  ],
  child: MaterialApp(
    home: ProviderUIScreen(),
  ),
)
*/