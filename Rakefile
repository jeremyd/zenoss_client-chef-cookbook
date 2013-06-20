#!/usr/bin/env rake
require 'chef/knife/cookbook_test'

task :default => 'foodcritic'

desc "Runs foodcritic linter"
task :foodcritic do
  Rake::Task[:prepare_sandbox].execute
  if Gem::Version.new("1.9.2") <= Gem::Version.new(RUBY_VERSION.dup)
    sh "foodcritic --epic-fail any #{File.dirname(sandbox_path)}"
  else
    puts "WARN: foodcritic run is skipped as Ruby #{RUBY_VERSION} is < 1.9.2."
  end
end

desc "Runs knife cookbook test"
task :knife do
  Rake::Task[:prepare_sandbox].execute
  Chef::Config[:syntax_check_cache_path] = ::File.absolute_path(::File.join(sandbox_path, "../", "../"))
  tester = ::Chef::Knife::CookbookTest.new()
  tester.config[:cookbook_path] = ::File.absolute_path(::File.join(sandbox_path, "../"))
  tester.run()

end
task :prepare_sandbox do
  files = %w{*.md *.rb attributes definitions files providers recipes resources templates}

  rm_rf sandbox_path
  mkdir_p sandbox_path
  cp_r Dir.glob("{#{files.join(',')}}"), sandbox_path
end


private
def sandbox_path
  File.join(File.dirname(__FILE__), %w(tmp cookbooks cookbook))
end