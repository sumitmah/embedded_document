module EmbeddedDocument
  module Embedders
    def identity
      lambda { |x| x }
    end

    def datetime
      lambda { |x| DateTime.parse x }
    end
  end
end