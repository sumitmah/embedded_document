require "embedded_document/version"

module EmbeddedDocument
  class Document < Struct.new(:data)
    def self.key(name, embedder, accessor_name = nil)
      name = name.to_s
      accessor_name ||= name
      define_method(accessor_name) do
        embedder.call(self.data[name])
      end
    end

    def self.sequence_of embedder
      lambda { |array| array.map {|x| embedder.call(x)} }
    end

    def self.identity
      lambda {|x| x}
    end

    def self.call(value)
      self.new(value)
    end

    def method_missing name
      return self.data[name.to_s] if self.data[name.to_s]
      super name
    end
  end
end
