require 'spec_helper'

describe 'Embedder' do
  class AnyEmbedder < EmbeddedDocument::Document
    key :anyKey, identity, :any_key
  end

  class NestedEmbedderExample < EmbeddedDocument::Document
    key :anyEmbedder, AnyEmbedder, :any_embedder
  end

  class NestedSequenceEmbedderExample < EmbeddedDocument::Document
    key :anyEmbedders, sequence_of(AnyEmbedder), :any_embedders
  end

  it 'should return any_key value' do
    subject = AnyEmbedder.new({'anyKey' => 'anything'})

    expect(subject.any_key).to eq('anything')
  end

  it 'should return any_embedder' do
    subject = NestedEmbedderExample.new({'anyEmbedder' => {'anyKey' => 'anything'}})

    expect(subject.any_embedder).to be_a AnyEmbedder
    expect(subject.any_embedder.any_key).to eq('anything')
  end

  it 'should return sequence of any_embedder' do
    subject = NestedSequenceEmbedderExample.new({'anyEmbedders' => [{'anyKey' => 'anything'}]})

    expect(subject.any_embedders).to be_a Array
    expect(subject.any_embedders.first).to be_a AnyEmbedder
  end
end