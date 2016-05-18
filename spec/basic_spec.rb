require 'spec_helper'

RSpec.describe 'Simple setup test' do
  it { expect(ABOOK_ENV).to eq "test" }
end