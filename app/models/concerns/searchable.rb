module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    
    def self.search(query)
      self.__elasticsearch__.search(query)
    end
  end
end

