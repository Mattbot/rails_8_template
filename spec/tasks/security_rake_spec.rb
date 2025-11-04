require 'rails_helper'
require_relative './task_helper'

describe 'security' do
    let(:dummy_success) { Proc.new { system('exit 0 ') } }
    let(:dummy_failure) { Proc.new { system('exit 1 ') } }

  describe 'security:update' do
    context 'on success' do
      before(:each) do
        allow_any_instance_of(Object).to receive(:`)
          .with('bundle exec bundle-audit update')
          .and_return(true)
        dummy_success.call
      end

      it 'executes bundle-audit update command without error' do
        expect(TaskHelper.run(task_name: "security:update"))
          .to include("✅ bundle-audit database updated!")
      end
    end

    context 'on failure' do
      before(:each) do
        allow_any_instance_of(Object).to receive(:`)
          .with('bundle exec bundle-audit update')
          .and_return(false)
        dummy_failure.call
      end

      it 'executes bundle-audit update command and exits with an error' do
        begin
          output = TaskHelper.run(task_name: "security:update")
          expect(output).to include("⚠️ bundle-audit database update failed!")
        rescue SystemExit => e
          expect(e.status).to eq(1)
        end
      end
    end
  end

  describe 'security:audit' do
    context 'on success' do
      before(:each) do
        allow_any_instance_of(Object).to receive(:`)
          .with('bundle exec bundle-audit check')
          .and_return(true)
        dummy_success.call
      end
      it 'executes bundle-audit check successfully' do
        expect(TaskHelper.run(task_name: "security:audit"))
          .to include("✅ No security vulnerabilities found!")
      end
    end

    context 'on failure' do
      before(:each) do
        allow_any_instance_of(Object).to receive(:`)
          .with('bundle exec bundle-audit check')
          .and_return(false)
        dummy_failure.call
      end
      it 'reports vulnerabilities when bundle-audit fails and exits with an error' do
        begin
          output = TaskHelper.run(task_name: "security:audit")
          expect(output).to include("⚠️  Security vulnerabilities detected!")
        rescue SystemExit => e
          expect(e.status).to eq(1)
        end
      end
    end
  end
end
