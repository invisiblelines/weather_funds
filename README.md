# WeatherFunds

Ruby interface to lottery results from http://weatherfunds.co.uk

## Installation

Add this line to your application's Gemfile:

    gem 'weather_funds'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install weather_funds

## Usage

    require 'weather_funds'

    # Sunshine and Lightning are both supported
    sunshine = WeatherFunds::Sunshine.new

    # Find your lottery
    lottery = sunshine.find(name) 
    # Or find by scheme idenifier
    lottery = sunshine.find_by_scheme(scheme)

    # Get the results. Returns array of date and data
    sunshine.results

    # Get the winners for your lottery. Returns name and prize amount
    lottery.winners

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
