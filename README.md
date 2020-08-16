# Monday.com Ruby API Explorer

This ia a Ruby application to query the Monday.com GraphQL API.

## Installation

To install this application:

* Clone the repository locally
* Run `bundle install`

## Usage

### Authentication

Monday.com requires users to authenticate using a JSON Web Token generated through the dashboard. Once you have your token, copy the `.env.example` file in the root folder of this application to `.env` and add your token as the value for the `MONDAY_TOKEN` key.

### Query the API

To query the Monday.com API do the following:

* Build a request query either using the [Monday.com API Playground](https://israelrb.monday.com/apps/playground) or Postman.
* Once you have a query you can execute the following from the command line, replacing the "QUERY" string with your query:

```ruby
bundle exec ruby query.rb "QUERY"
```

## Contributing

Please feel free to offer contributions to this explorer! I try to follow the GitHub flow, which means please make a feature branch from the main branch, and when you are ready open up a pull request against the main branch with the work in your feature branch.

## License

This explorer is under the [MIT License](LICENSE.txt)
