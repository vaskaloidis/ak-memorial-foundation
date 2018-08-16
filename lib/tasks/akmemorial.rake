require 'memorial_rake_commands'

# Usage: rake Jeweler:test
namespace :memorial do
  include MemorialRakeCommands
  task default: [:test]

  desc 'Simple Quick Minitest Suite (Default Tests)'
  task quick_test: :environment do
    MemorialRakeCommands::clear_logs
    MemorialRakeCommands::default_tests
  end

  desc 'Test Request Specs (Controllers)'
  task :test_controllers do
    run MemorialRakeCommands::request_specs
  end

  desc 'Test Model Specs'
  task :test_models do
    run MemorialRakeCommands::model_tests
  end

  desc 'Test Policy Specs'
  task :test_policies do
    MemorialRakeCommands::policy_tests
  end

  desc 'Normal Test Suite: Factory Bot Lint, Rspec, Capybara Feature Tests'
  task :test do
    MemorialRakeCommands::clear_logs
    run { sh 'rspec' }
    # MemorialRakeCommands::default_tests
    # MemorialRakeCommands::system_tests
  end

  desc 'Full Test Suite: Factory-Bot, Minitest, Capybara-System and Coverage'
  task full_test: :environment do
    MemorialRakeCommands::clear_logs
    # MemorialRakeCommands::factory_bot_tests
    run MemorialRakeCommands::default_tests
    # MemorialRakeCommands::system_tests
  end

  desc 'Run Default Minitest Tests Verbose w/ Backtrace'
  task debug_test: :environment do
    puts 'Executing "Rake Test" w/ Verbose + Backtrace Flag + Coverage'
    MemorialRakeCommands::run("rake test TESTOPTS='-vb'")
  end

  desc 'Run a RubyCritic Test:'
  task critic_test: :environment do
    require "rubycritic/rake_task"
    RubyCritic::RakeTask.new do |task|
      # task.name    = 'critic_test'
      # task.options = '--no-browser'
      task.verbose = true
    end
    MemorialRakeCommands::rake('rubycritic')
  end

  desc 'Test FactoryBot Factories are Valid (lint test)'
  task factory_test: :environment do
    MemorialRakeCommands::factory_bot_tests
  end

  desc 'Test Jeweler-Utils Gem'
  task utils_test: :environment do
    MemorialRakeCommands::run('cd ../jeweler-utils/')
    MemorialRakeCommands::run('bin/test')
  end

  desc 'Info'
  task info: :environment do
    MemorialRakeCommands::run 'rails --help | grep jeweler'
  end

end
