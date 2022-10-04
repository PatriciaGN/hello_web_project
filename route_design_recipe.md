{{ METHOD }} {{ PATH}} Route Design Recipe
Copy this design recipe template to test-drive a Sinatra route.

1. Design the Route Signature
You'll need to include:

the HTTP method
the path
any query parameters (passed in the URL)
or body parameters (passed in the request body)

2. Design the Response
The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return 200 OK if the post exists, but 404 Not Found if the post is not found in the database.

Your response might return plain text, JSON, or HTML code.

Replace the below with your own design. Think of all the different possible responses your route will return.

<!-- EXAMPLE -->
<!-- Response when the post is found: 200 OK -->

<html>
  <head></head>
  <body>
    <h1>Designing a web app</h1>
    <div>This is a short post on how to design a web application from scratch!</div>
  </body>
</html>
<!-- EXAMPLE -->
<!-- Response when the post is not found: 404 Not Found -->

<html>
  <head></head>
  <body>
    <h1>I am so sorry!</h1>
    <div>We couldn't find the post you were looking for, have you checked our homepage?</div>
  </body>
</html>
3. Write Examples
Replace these with your own design.

# Request:

GET /names

# Expected response:

Response for 200 OK
# Request:

Julia, Mary, Karim

# Expected response:

Response for 404 Not Found


4. Encode as Tests Examples

# EXAMPLE
# file: spec/integration/application_spec.rb
```ruby
require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /names" do
    it 'returns 200 OK' do
      # Assuming the page exists.
      response = get('/names')
      # If we are using parameters: response = post("/", name: "Leo", cohort_name = "April")

      expect(response.status).to eq(200)
      # expect(response.body).to eq(Julia, Mary, Karim)
    end

    it 'returns 404 Not Found' do
      response = get('/posts?id=276278')

      expect(response.status).to eq(404)
      # expect(response.body).to eq(expected_response)
    end
  end

  context "POST /sort-names" do
    it "returns 200 OK" do
      response = post("/sort-names", names: "Joe,Alice,Zoe,Julia,Kieran")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end
  end
end
```
5. Implement the Route
Write the route and web server code to implement the route behaviour.