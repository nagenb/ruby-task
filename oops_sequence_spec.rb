require 'oops_sequence'
require 'spec_helper'

describe Deck do
  it 'should shuffle Constant' do
    Deck::DECK.should_not eq(Deck.send(:shuffled))
  end

  it 'should slice give number of times' do
    expect(Deck::slice_for(3).count).to eq(3)
    expect(Deck::slice_for(3).first).to be_a Array
  end
end

describe FindSequence do
  context 'FindSequence.count' do
    it 'should return number' do
      expect(FindSequence.new(['a1', 'a2']).count).to eq(2)
    end

    it 'should return max number' do
      expect(FindSequence.new(['a1', 'a2', 'b3']).count).to eq(2)
    end

    it 'should consider card with leter a, b' do
      expect(FindSequence.new(['a1', 'a2', 'b3']).count).to eq(2)
    end
  end
end