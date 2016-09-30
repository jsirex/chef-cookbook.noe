# frozen_string_literal: true
require 'spec_helper'

describe '!{name}::default' do
  cached(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'pending your test'
end
