# Monday.com Ruby API Explorer

[![Coverage Status](https://github.com/bencgreenberg/monday_ruby_api_explorer/workflows/CI/badge.svg)

This ia a Ruby application to use the Monday.com GraphQL API (v2).

## Installation

To install this application:

* Clone the repository locally
* Run `bundle install`

## Usage

### Authentication

Monday.com requires users to authenticate using a JSON Web Token generated through the dashboard. Once you have your token, copy the `.env.example` file in the root folder of this application to `.env` and add your token as the value for the `MONDAY_TOKEN` key.

### Client Instantiation

You can instantiate a Monday Client by providing your Monday JWT as an argument to `Monday::Client.new`:

```ruby
client = Monday::Client.new(token: ENV['MONDAY_TOKEN'])
```

### Query the API

To query the Monday.com API do the following:

* Build a request query either using the [Monday.com API Playground](https://israelrb.monday.com/apps/playground) or Postman.
* You can submit a request query to the Explorer method in a Hash format, and the library will convert it for you before sending to the API.
* Once you have a query you can execute the following:

```ruby
query = {
  query: "{query { me { name } } }"
}

client.query.search(query)
```

### Making Updates with the API

You can update your Monday.com environment through the library by accessing methods on `client.update`:

### Updating Boards

* To create a board:

```ruby
client.update.boards.create_board(
  board_name: 'example new board',
  board_kind: 'public'
  )
```

* To archive a board:

```ruby
client.update.archive_board(board_id: 12345)
```

* To add subscribers to a board:

```ruby
client.update.boards.add_subscribers(
  board_id: 123456,
  user_ids: [1223, 34567, 1234],
  kind: 'owner'
)
```

* To delete subcribers from a board:

```ruby
client.update.boards.delete_subscribers(
  board_id: 123456,
  user_ids: [12345]
)
```

## Contributing

Please feel free to offer contributions to this explorer! I try to follow the GitHub flow, which means please make a feature branch from the main branch, and when you are ready open up a pull request against the main branch with the work in your feature branch.

## License

This explorer is under the [MIT License](LICENSE.txt)
