require 'rake'
require 'spec/rake/spectask'
require 'cucumber/rake/task'
namespace :rcov do
  desc "Run specs with RCov"
  Spec::Rake::SpecTask.new(:rspec) do |t|
    t.spec_files = FileList['spec/lineman/*_spec.rb' ]
    t.rcov = true
    t.rcov_opts = %w{--exclude gems\/,spec\/,features\/,\/Library\/Ruby --aggregate coverage.data}
    t.rcov_opts << lambda do
      IO.readlines("spec/rcov.opts").map {|l| l.chomp.split " "}.flatten
    end
  end
  
  desc "Run Cucumber with RCov"
  Cucumber::Rake::Task.new(:cucumber) do |t|    
    t.rcov = true
    t.rcov_opts = %w{--exclude gems\/,spec\/,features\/,\/Library\/Ruby --aggregate coverage.data}
    t.rcov_opts << %[-o "coverage"]
  end

  desc "Run both specs and features to generate aggregated coverage"
  task :all do |t|
    rm "coverage.data" if File.exist?("coverage.data")
    Rake::Task["rcov:cucumber"].invoke
    Rake::Task["rcov:rspec"].invoke
  end
end
