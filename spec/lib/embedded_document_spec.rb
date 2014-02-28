require 'spec_helper'

describe EmbeddedDocument::Document do
  context '.key' do
    class AnyEmbedder < EmbeddedDocument::Document
      key :anykey, identity, :any_key
      key :example_key, identity
    end

    it 'should define instance method with accessor_name' do
      expect { AnyEmbedder.new({}).any_key }.not_to raise_error
    end

    it 'should define instance method key_name if accessor_name is not given' do
      expect { AnyEmbedder.new({}).example_key }.not_to raise_error
    end

    it 'should return value for undefined_key if data contains key' do
      expect(AnyEmbedder.new({'undefined_key' => 'anything'}).undefined_key).to eq('anything')
    end

    it 'should raise no method error if data key is missing' do
      expect { AnyEmbedder.new({}).missing_key }.to raise_error(NoMethodError)
    end
  end
end