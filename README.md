Luigi's Marketplace is a REST API which can return JSON or XML.

**Technology stack**
- Language: Ruby
- Framework: Ruby On Rails

**Library(RubyGems)**
- jsonapi-serializer used to serialize data with fast performance.
- responders used to return both xml and json format.
- validate_url used to validate image url.
- elasticsearch-rails used to search with high performance.
- jwt used to create token for login.
- bcrypt used to hash and salt tokens securely. 
- rspec used to test api endpoint,
- factory bot used to create fake data for testing purpose.
- faker used to create fake information for testing purpose.
- database cleaner used to clean test database.

**Functionality**
- User
	- can register with username, password and author_pseudonym.
	- can login with username (JWT return)
- Book
  - without authentication
	  - can get book list with author pseudonym 
	  - can get book detail
	  - can seach book with query
  - with authentication
	  - can create, update book
	  - can unpublish book
	  - can upload multiple books with csv file

**Additional information**

Below link file name Luigi_marketplace_api.pdf is 
an API Documentation for endpoints include for xml and json. 
https://github.com/htoomyatag/luigi_marketplace_api/blob/main/Luigi_marketplace_api.pdf

**Future Plan**
- Have to develop CRUD and Admin manage for users.
