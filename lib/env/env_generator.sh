#!/bin/bash
# Script to generate environment variables
# bash env_generator.sh > env_<flavor>.dart
# example for all flavors: bash env_generator.sh > env_development.dart > env_staging.dart > env_production.dart

echo "// ignore: always_use_package_imports
import 'env.dart';

const environment = Env(
  baseUrl: 'https://swapi-graphql.netlify.app/.netlify/functions/index',
  /// Hardcoded for the proposed challenge
);"
