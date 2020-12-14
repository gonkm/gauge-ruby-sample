# gauge-ruby-sample

## Requirements
- macOS >= Mac OS X v10.6
- [Homebrew](https://brew.sh/index_ja)
- [rbenv](https://github.com/rbenv/rbenv)
- GoogleChrome

## Setup

```
$ brew update
$ brew install rbenv
$ brew install gauge
$ brew cask install chromedriver

$ git clone git@github.com:nkmuum/gauge-ruby-sample.git
$ cd gauge-ruby-sample

$ rbenv install $(cat .ruby-version)
$ rbenv local $(cat .ruby-version)
$ gem install bundler -v 2.1.2
$ bundle install

$ gauge install ruby
$ gauge install html-report
$ gauge install xml-report
```

## Run specs

```
$ gauge run specs
```