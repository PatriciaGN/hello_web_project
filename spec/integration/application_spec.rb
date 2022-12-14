require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /names" do
    it 'returns 200 OK' do
      # Assuming the page exists.
      response = get('/names')

      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end
  end

  context "GET /hello" do
    it 'contains a h1 title' do
      response = get('/hello')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>')
    end

    it 'contains a head' do
      response = get('/hello')

      expect(response.body).to include('<head>')
    end

    it 'returns an html hello message with the given name' do
      response = get('/hello', name: "Patty")
      
      expect(response.body).to include("<h1>Hello Patty!</h1>")
    end
  end

    # it 'returns 404 Not Found' do
    #   response = get('/posts?id=276278')

    #   expect(response.status).to eq(404)
    #   # expect(response.body).to eq(expected_response)
    # end

  context "POST /sort-names" do
      it "returns 200 OK" do
        response = post("/sort-names", names: "Joe,Alice,Zoe,Julia,Kieran")
    
        expect(response.status).to eq(200)
        expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
      end
  end
end