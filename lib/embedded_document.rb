require 'embedded_document/version'
require 'embedded_document/embedders'
require 'embedded_document/embedder_combinators'

module EmbeddedDocument
  class Document < Struct.new(:data)
    extend Embedders
    extend EmbedderCombinators

    def self.key(name, embedder, accessor_name = nil)
      name = name.to_s
      accessor_name ||= name
      define_method(accessor_name) do
        embedder.call(self.data[name])
      end
    end

    def self.call(value)
      self.new(value)
    end

    def method_missing name
      value = self.data[name.to_s]
      return value unless value.nil?
      super name
    end
  end
end
