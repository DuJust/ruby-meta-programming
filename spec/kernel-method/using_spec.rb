#require 'using'
require 'spec_helper'

class Resource

	def dispose
		@disposed = true
	end

	def disposed?
		@disposed
	end

end

module KernelMethod

	describe 'using' do

		subject { Resource.new }

		describe 'disposes of resources' do

			before do
				using(subject) {}
			end

			it { should be_disposed }

		end

		describe 'disposes resources in case of exception' do
			
			it 'should disposes of resources' do
				expect { using(subject) {raise Exception} }.to raise_error
				subject.disposed?.should be_true
			end

		end

	end

end


