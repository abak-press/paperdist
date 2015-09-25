# Paperdist

<a href="http://dolly.railsc.ru/projects/128/builds/latest/?ref=master"><img src="http://dolly.railsc.ru/badges/abak-press/paperdist/master" height="18"></a>

## Installation

Add this line to your application's Gemfile:

    gem 'paperdist'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paperdist

## Usage

TODO: Write usage instructions here

## Gem Releasing

1. должен быть настроен git remote upstream и должны быть права на push
1. git checkout master
2. git pull upstream master
3. правим версию гема в файле VERSION в корне гема. (читаем правила версионирования http://semver.org/)
4. bundle exec rake release

## Contributing

1. Fork it ( https://github.com/abak-press/paperdist/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
