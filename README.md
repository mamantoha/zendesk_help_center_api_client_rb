# Zendesk HelpCenter API Client

This gem added support for `Zendesk Help Center` methods under [ZendeskAPI::Client](https://github.com/zendesk/zendesk_api_client_rb) gem.

To experiment with that code, run `bin/console` for an interactive prompt.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zendesk_help_center_api'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install zendesk_help_center_api
```

## Usage

```ruby
require 'zendesk_api/help_center'
```

### Help Center

#### Categories

```ruby
categories = client.hc_categories
category = categories.build(name: 'Test Category')
category.save
category.update(description: 'This is a test')
category.destroy
```

#### Sections

```ruby
sections = category.sections
section = sections.first
category.update(name: 'This is a test')
```

#### Articles

```ruby
articles = section.articles
articles.build(title: 'Test Article')
category.update(description: 'This is a test')
article.destroy
```

### Help Center Translations

```ruby
categories_tr = category.translations
category_tr = categories_tr.build(locale: 'uk', name: 'Тестова Стаття')
category_tr.save

sections_tr = sections.translations
section_tr = article_tr.build(locale: 'uk', name: 'Це тест')
section_tr.save

articles_tr = article.translations
article_tr = article_translations.build(locale: 'uk', title: 'Тестова Стаття')
article_tr.save
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/mamantoha/zendesk_help_center_api_client_rb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
