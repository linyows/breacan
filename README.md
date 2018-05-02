<p align="center">
<img src="https://d262ilb51hltx0.cloudfront.net/max/2000/1*ryU77MsLt5tnp3ow8kqELA.png">
<strong>Breacan</strong>: Simple Ruby wrapper for Slack API.
</p>

<a href="https://rubygems.org/gems/breacan" title="gems"><img src="http://img.shields.io/gem/v/breacan.svg?style=flat-square"></a>
<a href="https://travis-ci.org/linyows/breacan" title="travis"><img src="https://img.shields.io/travis/linyows/breacan.svg?style=flat-square"></a>
<a href="https://github.com/linyows/breacan/blob/master/LICENSE" title="MIT License"><img src="https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square"></a>

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
Breacan.channel_by_name('hello').id
=> "C03QXXXX"
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
