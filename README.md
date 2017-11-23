# Zendesk HelpCenter API Client

This gem added support for [Zendesk Help Center](https://developer.zendesk.com/rest_api/docs/help_center/introduction) methods under [ZendeskAPI::Client](https://github.com/zendesk/zendesk_api_client_rb) gem.

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
### Zendesk CLient

```ruby
client = ZendeskAPI::Client.new do |config|
  config.url = "<- your-zendesk-url ->" # e.g. https://mydesk.zendesk.com/api/v2
  config.username = "login.email@zendesk.com"
  config.password = "your zendesk password"
end
```

### Help Center

#### Categories

These endpoints only update category-level metadata such as the sorting position.
They don't update category translations.

```ruby
categories = client.hc_categories
category = categories.build(name: 'Test Category')
category.save
category.destroy
```

#### Sections

These endpoints only update section-level metadata such as the sorting position.
They don't update section translations.
See Translations.

```ruby
sections = category.sections
section = sections.first
```

#### Articles

Create Article:

```ruby
articles = section.articles
articles.build(title: 'Test Article')
```

Update Article:

These endpoints update article-level metadata such as its promotion status or sorting position.
The endpoints do not update translation properties such as the article's title, body, locale, or draft.
See Translations section.

```ruby
article = section.articles.first
article.update(position: 42)
article.save
```

### Help Center Translations

Translations represent the content in all supported languages of a `Help Center` item such as an `article` or a `section`. The default language is also included in the translations.

```ruby
categories_tr = category.translations
category_tr = categories_tr.build(locale: 'uk', title: 'Тестова Стаття', body: '')
category_tr.save

sections_tr = sections.translations
section_tr = article_tr.build(locale: 'uk', title: 'Це тест', body: '')
section_tr.save

articles_tr = article.translations
article_tr = article_translations.build(locale: 'uk', title: 'Тестова Стаття', body: '')
article_tr.save

article_tr = article.translations.select { |tr| tr.locale == "en-us" }.first
artile_tr.update(title: "New Title", body: "New Body")
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

## License and Author

Copyright: 2015-2017 [Anton Maminov](anton.maminov@gmail.com)

This project is licensed under the Apache License, a copy of which can be found in the LICENSE file.
