class API < Grape::API
  # Different API versions are required via header
  version 'v1', using: :header, vendor: 'abook'

  # API response format and default if no header and/or .json extension
  format :json
  default_format :json

  helpers do
    def declared_params
      declared(params, include_missing: false)
    end
  end

  # Main REST resource here are people
  resources :people do
    desc "All people"
    get do
      Person.all
    end

    desc "Get person"
    get '/:id' do
      Person.find(params[:id])
    end

    desc "Create person"
    params do
      group :person, type: Hash do
        requires :first_name, type: String
        requires :last_name, type: String
      end
    end
    post do
      Person.create!(params[:person])
    end

    desc "Delete person"
    delete '/:id' do
      Person.find(params[:id]).destroy
    end
  end


  add_swagger_documentation \
    info: {
      title: "abook-api API",
      description: "API for demostration of Grape",
      contact_name: "Oto Brglez",
  }
end