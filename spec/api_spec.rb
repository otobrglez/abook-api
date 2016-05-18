require 'spec_helper'

RSpec.describe API do

  let(:app) { API }

  before :all do
    Person.delete_all
    create :person
  end

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