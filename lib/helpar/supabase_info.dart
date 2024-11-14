import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String supabaseUrl = 'https://gererfkziezpevizhnwr.supabase.co';
  static const String supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdlcmVyZmt6aWV6cGV2aXpobndyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjY3MzQ2NTgsImV4cCI6MjA0MjMxMDY1OH0.U1LgigMQAj52QRQ7VETMArLNUzAsAaBUuuzL3EvC_o4';

  static void initialize() {
    Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  }
}
