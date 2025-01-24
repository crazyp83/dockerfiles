require 'spec_helper'

describe 'crazyp83/norikra' do
  context 'without env' do
    before(:all) do
      start_container({
        'Image' => ENV['DOCKER_IMAGE'] || "crazyp83/#{File.basename(__dir__)}:latest",
      })
    end

    after(:all) do
      stop_container
    end

    #Dir["#{__dir__}/../baseimage/*_spec.rb"].sort.each do |spec|
    #  load spec
    #end

    describe file('/tmp/build') do
      it { should_not be_directory }
    end

    describe package('norikra') do
      let(:path){ '/opt/rbenv/versions/jruby-9.4.2.0/bin:$PATH' }
      it { should be_installed.by('gem') }
    end
  end
end
