<p align="center">
<img src="https://d262ilb51hltx0.cloudfront.net/max/2000/1*ryU77MsLt5tnp3ow8kqELA.png">
<strong>Breacan</strong>: Simple Ruby wrapper for Slack API.
</p>

[![ruby gem](https://img.shields.io/gem/v/breacan.svg?style=flat-square)][gem]
[gem]: https://rubygems.org/gems/breacan

Installation
------------

Add this line to your application's Gemfile:

```ruby
gem 'breacan'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install breacan

Usage
-----

example:

```ruby
require 'breacan'
Breacan.access_token = 'xoxp-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
Breacan.channels
=> [{:id=>"C03QXXXX",
    :name=>"hello",
    :is_channel=>true,
    :created=>1424735886,
    :creator=>"U03PXXXX",
    :is_archived=>false,
    :is_general=>false,
    :is_member=>false,
    :members=> ["U0NLXXXX",...
```

Contributing
------------

1. Fork it ( https://github.com/linyows/breacan/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Authors
-------

- [linyows](https://github.com/linyows)

License
-------

The MIT License (MIT)
