require 'rake/testtask'

task :default => [:test] do
  puts "Ready for the day!"
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end