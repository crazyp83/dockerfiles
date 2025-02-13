require 'bundler/setup'
require 'rake'
require 'rspec/core/rake_task'

task :default => "crazyp83:all"

namespace :crazyp83 do
  desc 'create all images'
  task :all => [:debian]

  desc 'build crazyp83/debian image'
  task :debian do
    tag = ->(env, default){
      env ? (!env.empty? ? "TAG=#{env}" : "") : "TAG=#{default}"
    }[ENV['TAG_DEBIAN'], 'crazyp83/debian:latest']
    env = ENV.select{|k,v| %w[http_proxy].include?(k)}.map{|k,v| "#{k}=#{v}"}.join(" ")
    sh "cd debian && rake clobber mkimage README.md #{tag} #{env}"
  end

  desc 'build crazyp83/debian-bookworm image'
  task :debian_bookworm do
    tag = ->(env, default){
      env ? (!env.empty? ? "TAG=#{env}" : "") : "TAG=#{default}"
    }[ENV['TAG_DEBIAN'], 'crazyp83/debian-bookworm:latest']
    env = ENV.select{|k,v| %w[http_proxy].include?(k)}.map{|k,v| "#{k}=#{v}"}.join(" ")
    sh "cd debian-bookworm && rake clobber mkimage README.md #{tag} #{env}"
  end

  desc 'build crazyp83/debian-bullseye image'
  task :debian_bullseye do
    tag = ->(env, default){
      env ? (!env.empty? ? "TAG=#{env}" : "") : "TAG=#{default}"
    }[ENV['TAG_DEBIAN'], 'crazyp83/debian-bullseye:latest']
    env = ENV.select{|k,v| %w[http_proxy].include?(k)}.map{|k,v| "#{k}=#{v}"}.join(" ")
    sh "cd debian-bullseye && rake clobber mkimage README.md #{tag} #{env}"
  end

  desc 'build crazyp83/debian-buster image'
  task :debian_buster do
    tag = ->(env, default){
      env ? (!env.empty? ? "TAG=#{env}" : "") : "TAG=#{default}"
    }[ENV['TAG_DEBIAN'], 'crazyp83/debian-buster:latest']
    env = ENV.select{|k,v| %w[http_proxy].include?(k)}.map{|k,v| "#{k}=#{v}"}.join(" ")
    sh "cd debian-buster && rake clobber mkimage README.md #{tag} #{env}"
  end

  desc 'build crazyp83/debian-stretch image'
  task :debian_stretch do
    tag = ->(env, default){
      env ? (!env.empty? ? "TAG=#{env}" : "") : "TAG=#{default}"
    }[ENV['TAG_DEBIAN'], 'crazyp83/debian-stretch:latest']
    env = ENV.select{|k,v| %w[http_proxy].include?(k)}.map{|k,v| "#{k}=#{v}"}.join(" ")
    sh "cd debian-stretch && rake clobber mkimage README.md #{tag} #{env}"
  end

  desc "create deps.svg from deps.dot (visualize dependencies)"
  file "deps.svg" => "deps.dot" do
    sh "dot -T svg -o deps.svg deps.dot"
  end

  %w[check-update ci].each do |name|
    desc "create .github/workflows/#{name}.yml"
    file ".github/workflows/#{name}.yml" => ".github/workflows/#{name}.yml.erb" do |t,args|
      sh "erb -T - #{t.prerequisites[0]} > #{t.name}"
    end
  end
end

namespace :spec do
  targets = []
  Dir.glob('./spec/*').each do |dir|
    next unless File.directory?(dir)
    targets << File.basename(dir)
  end

  task :all     => targets
  task :default => :all

  targets.each do |target|
    desc "Run serverspec tests to #{target}"
    RSpec::Core::RakeTask.new(target.to_sym) do |t|
      t.pattern = "spec/#{target}/*_spec.rb"
    end
  end
end

