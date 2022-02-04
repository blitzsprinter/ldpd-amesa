# frozen_string_literal: true

namespace :amesa do
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:rspec) do |spec|
    spec.rspec_opts ||= []
    spec.rspec_opts << '--backtrace' if ENV['CI']
  end

  desc 'CI build'
  task ci: ['amesa:setup:config_files', :environment] do
    ENV['RAILS_ENV'] = 'test'
    Rails.env = ENV['RAILS_ENV']

    puts "setting up test db...\n"
    Rake::Task['db:environment:set'].invoke
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['amesa:rspec'].invoke
  end
rescue LoadError => e
  # Be prepared to rescue so that this rake file can exist in environments where RSpec is unavailable (i.e. production environments).
  puts '[Warning] Exception creating ci/rubocop/rspec rake tasks. '\
    'This message can be ignored in environments that intentionally do not pull in certain development/test environment gems (i.e. production environments).'
  puts e
end
