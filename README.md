# EmbeddedDocument

A small utility with light-weight and composable abstractions, to ease the use of [Embedded Document](http://martinfowler.com/bliki/EmbeddedDocument.html) pattern in Ruby.

The project currently only makes ideas from [`@missingfaktor`](https://github.com/missingfaktor/)'s [blog post on the subject](http://missingfaktor.blogspot.in/2013/07/easing-use-of-embedded-document-pattern.html) available as a gem. We plan to build upon that work and add more features as we go forward.

## Installation

Add this line to your application's Gemfile:

    gem 'embedded_document'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install embedded_document

## Example Usage

```ruby
class Item < EmbeddedDocument::Document
end
 
class Delivery < EmbeddedDocument::Document
  key :shipDate, date, :ship_date
  key :items, sequence_of(Item)
end
 
class Order < EmbeddedDocument::Document
  key :deliveries, sequence_of(Delivery)
  key :items, sequence_of(Item)
 
  def quantity_for(a_product)
    item = items.detect{|i| a_product == i.product}
    item ? item.quantity : 0
  end
end
 
order_hash = JSON.parse(
  '{ "id": 1234,
    "customer": "martin",
    "items": [
      {"product": "talisker", "quantity": 500},
      {"product": "macallan", "quantity": 800},
      {"product": "ledaig",   "quantity": 1100}
    ],
    "deliveries": [
      { "id": 7722,
        "shipDate": "2013-04-19",
        "items": [
          {"product": "talisker", "quantity": 300},
          {"product": "ledaig",   "quantity": 500}
        ]
      },
      { "id": 6533,
        "shipDate": "2013-04-18",
        "items": [
          {"product": "talisker", "quantity": 200},
          {"product": "ledaig",   "quantity": 300},
          {"product": "macallan", "quantity": 300}
        ]
      }
    ]
  }'
)
 
order = Order.new(order_hash)
p order.deliveries
p order.quantity_for('talisker')
```

## Contributing

1. Fork it (http://github.com/sumitmah/embedded_document/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
