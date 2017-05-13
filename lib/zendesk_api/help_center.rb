require 'zendesk_api'

module ZendeskAPI
  module HelpCenter
    include DataNamespace

    class Article < Resource; end
    class Section < Resource; end

    class Article < Resource
      class << self
        def singular_resource_name
          'article'
        end
      end
    end

    class Section < Resource
      class << self
        def singular_resource_name
          'section'
        end
      end
    end

    class HcCategory < Resource
      class << self
        def singular_resource_name
          'category'
        end
      end
    end

    class HcCategory < Resource
      class Translation < DataResource
        extend Read
        include Create
        include Update
        include Destroy

        def initialize(client, attributes = {})
          attributes["category_id"] ||= attributes.delete('source_id')
          super
        end

        def destroy!
          super do |req|
            req.path = @client.config.url + "/help_center/translations/" + id.to_s
          end
        end

        has HcCategory
      end

      has_many Translation
    end

    class Section < Resource
      class Translation < DataResource
        extend Read
        include Create
        include Update
        include Destroy

        def initialize(client, attributes = {})
          attributes["section_id"] ||= attributes.delete('source_id')
          super
        end

        def destroy!
          super do |req|
            req.path = @client.config.url + "/help_center/translations/" + id.to_s
          end
        end

        has Section
      end

      has_many Translation
    end

    class Article < Resource
      class Translation < DataResource
        extend Read
        include Create
        include Update
        include Destroy

        def initialize(client, attributes = {})
          attributes["article_id"] ||= attributes.delete('source_id')
          super
        end

        def destroy!
          super do |req|
            req.path = @client.config.url + "/help_center/translations/" + id.to_s
          end
        end

        has Article
      end

      has_many Translation
    end

    class HcCategory < Resource
      namespace "help_center"

      has_many Section
      has_many Article
    end

    class Section < Resource
      namespace "help_center"

      has HcCategory
      has_many Article

      def save!(*)
        category = @association.options.parent
        super do |req|
          req.path = "help_center/categories/#{category.id}/sections"
        end
      end
    end

    class Article < Resource
      namespace "help_center"

      has HcCategory
      has Section

      def save!(*)
        super do |req|
          req.path = "help_center/sections/#{section.id}/articles"
        end
      end
    end
  end
end
