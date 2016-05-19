require 'spec_helper'

# Now this. This are specs.
RSpec.describe API do

  # We are using rack-test
  # To use it you have to create "app" variable
  # let() will create "app" when needed.
  let(:app) { API }

  # This should be a bit more advanced. "database_cleaner" comes in mind.
  before :all do
    Person.delete_all
    create :person # Using factory_girl here to create new Person
  end

  # Now tests,...
  # I belive they are self explenatory :D

  describe 'GET /people' do
    before { get '/people' }
    it { expect(last_response.status).to eq 200 }
  end

  describe 'POST /people' do
    before { post '/people', person: attributes_for(:person) }
    it { expect(last_response.status).to eq 201 }
  end

  describe 'GET /people/:id' do
    let(:person) { Person.last }
    before { get '/people/%d' % person.id }
    it { expect(last_response.status).to eq 200 }
  end

  describe 'DELETE /people/:id' do
    let!(:person_to_delete) { create(:person) }
    it {
      expect {
        delete '/people/%d' % person_to_delete.id
        expect(last_response.status).to eq 200
      }.to change(Person, :count).by(-1)
    }
  end


end