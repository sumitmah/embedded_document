module EmbeddedDocument
  module EmbedderCombinators
    def sequence_of embedder
      lambda { |array| array.map { |x| embedder.call(x) } }
    end

    def defaulted embedder, default_value
      lambda { |value| value.nil? ? default_value : embedder.call(value) }
    end
  end
end