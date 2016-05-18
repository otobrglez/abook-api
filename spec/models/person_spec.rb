require 'spec_helper'

RSpec.describe Person, type: :model do

  subject { build :person }
  it { expect(subject).to be_valid }
  it { expect(subject).to validate_presence_of :first_name }
  it { expect(subject).to validate_presence_of :last_name }
end