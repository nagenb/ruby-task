class Deck
  DECK = %W(A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 A12 A13 
  B1 B2 B3 B4 B5 B6 B7 B8 B9 B10 B11 B12 B13 
  C1 C2 C3 C4 C5 C6 C7 C8 C9 C10 C11 C12 C13 
  D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 D12 D13) 
  
  def self.slice_for(number)
    shuffled.each_slice(13).take(number)
  end

  private

  def self.shuffled
    DECK.shuffle    
  end
end

class GerPersons
  def initialize
    begin 
      puts "Enter number of person: "
      @number = gets.chomp.to_i
      puts 'Please enter 1..4' if @number > 4
    end while @number > 4
  end

  def count
    @number
  end
end

class FindSequence
  def initialize(arr)
    @cards = arr
  end

  def count
    seq = []
    count = 1

    @cards.each_with_index do |e, i|
      e.match(/(\w)(\d+)/)
      first_letter, first_dig = $1, $2.to_i
      
      if @cards[i+1].nil?
        sec_letter, sec_dig = [nil, nil]
      else
        @cards[i+1].match(/(\w)(\d+)/)
        sec_letter, sec_dig = $1, $2.to_i
      end

      if(first_letter==sec_letter && (first_dig+1)==sec_dig)
        count += 1
      else
        seq << count
        count = 1
      end
    end

    seq.max
  end
end

class PlayCards
  def self.start
    count_arr = []
    number_of_person = GerPersons.new.count
    Deck.slice_for(number_of_person).each_with_index do |person, i|
      count_arr << FindSequence.new(person).count
      puts "person #{i+1} => #{person.inspect}"
    end

    puts "# #{count_arr.index(count_arr.max) + 1} having #{count_arr.max} sequence"    
  end
end

# PlayCards.start