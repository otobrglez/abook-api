=begin
  This is the most important part of the app.
=end

# You require Grape::API to get to the Grape DSL
class API < Grape::API

  # Different API versions are required via header.
  # Other options here are via 'path'
  version 'v1', using: :header, vendor: 'abook'

  # API response format and default if no header and/or .json extension
  format :json

  # Default format,... so if someone forgets / omits a header or something...
  # this API will always return JSON.
  default_format :json

  # Main REST resource here are "people"
  resources :people do

    # Each "endpoint" in api can / should have "desc". This is useful for generating docs.
    desc 'All people'

    # DSL supports all standard HTTP verbs,... get, post, put, patch, delete, ...
    get do
      # We get our Person class... and call #all on it... Grape will internally use
      # multi_json to pick best JSON serializer and do serialization.
      # Some other options here are custom "presenters" etc,...
      Person.all
    end

    desc "Get person"
    # URL params can be passed in this fashion. Looks and feels a bit similar to "Sintra".
    get '/:id' do
      # Nothing fancy here. Just find person via param "id"
      # find by default does NOT raise exception. So... Be careful. Usually some error handler has to be present
      Person.find(params[:id])
    end

    # UUU advanced stuff. Posting to API
    desc "Create person"
    # With params you define hash that goes into endpoint.
    params do
      # Hash for hash,...
      group :person, type: Hash do
        # Each required parameter can also have type
        requires :first_name, type: String
        requires :last_name, type: String
        # Parameters can also be optional.
      end
    end
    post do
      # Create record with #create!
      # #create! is different than #create. It will raise exception if something goes wrong.
      Person.create!(params[:person])
    end

    desc "Delete person"
    delete '/:id' do
      # Find it. Destroy it
      Person.find(params[:id]).destroy
    end
  end


  # Now this.
  # This is configuration for swagger gem. You can add many fancy things here.
  # I suggest you check docs for more info,...

  # JSON description of our API
  # => http://localhost:9292/swagger_doc#/people

  # OUR API via swagger UI thing
  # => http://petstore.swagger.io/?url=http://localhost:9292/swagger_doc#/people
  add_swagger_documentation \
    info: {
      title: "abook-api API",
      description: "API for demostration of Grape",
      contact_name: "Oto Brglez",
  }

end