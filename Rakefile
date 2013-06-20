#!/usr/bin/env rake


task :default => 'foodcritic'

desc "Runs foodcritic linter"
task :foodcritic do
  if Gem::Version.new("1.9.2") <= Gem::Version.new(RUBY_VERSION.dup)
    sandbox_path = File.join(File.dirname(__FILE__), %w{tmp foodcritic cookbook})
    prepare_foodcritic_sandbox(sandbox_path)

    sh "foodcritic --epic-fail any #{File.dirname(sandbox_path)}"
  else
    puts "WARN: foodcritic run is skipped as Ruby #{RUBY_VERSION} is < 1.9.2."
  end
end

desc "Runs knife cookbook test"
task :knife do
  Rake::Task[:prepare_sandbox].execute

  sh "bundle exec knife cookbook test cookbook -o #{sandbox_path}/../"
end



private
def prepare_foodcritic_sandbox(sandbox_path)
  files = %w{*.md *.rb attributes definitions files libraries providers
recipes resources templates}

  rm_rf sandbox_path
  mkdir_p sandbox_path
  cp_r Dir.glob("{#{files.join(',')}}"), sandbox_path
  puts "\n\n"
end
def sandbox_path
  File.join(File.dirname(__FILE__), %w(tmp cookbooks cookbook))
end