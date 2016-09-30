# frozen_string_literal: true
require_relative 'spec_helper'

# Example for serverspec
describe command('/bin/true') do
  its(:exit_status) { should eq 0 }
end

# # Example for infrataster
# describe server(:public) do
#   describe http('http://host/') do
#     it 'responses with redirect to https' do
#       expect(response.headers['Location']).to eq('https://host/')
#     end
#
#     it 'response code is 301' do
#       expect(response.status).to eq(301)
#     end
#   end
#
#   describe http('https://host/', ssl: { verify: false }) do
#     it 'response code is 200' do
#       expect(response.status).to eq(200)
#     end
#   end
# end
