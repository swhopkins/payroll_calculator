require "bundler/gem_tasks"
require 'rake/clean'

desc 'Build the libpayroll C extension'
task :build_ext do
  Dir.chdir("ext/") do
    sh "swig -ruby libpayroll.i"
    ruby "extconf.rb"
    sh "make"
  end
  cp "ext/libpayroll.bundle", "lib/"
end

CLEAN.include('ext/**/*{.o,.log,.so,.bundle}')
CLEAN.include('ext/**/Makefile')
CLOBBER.include('lib/*{.so,.bundle}')
