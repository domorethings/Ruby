def echo(sentence)
  sentence
end

def shout(sentence)
  sentence.upcase
end

def repeat(string, times=2)
  words = Array.new(times, string)
  words.join(" ")
end

def start_of_word(word, end_of_word)
  # return first letter of word
  word[0...end_of_word]
end

def first_word(sentence)
  words = sentence.split(' ')
  words.first
end

LITTLE_WORDS = ["and", "the", "over"]

def titleize(sentence)
  result = []
  words = sentence.split(' ')
  words.each.with_index do |word, idx|
    # needs to always capitalize the first word
    if LITTLE_WORDS.include?(word) && idx != 0
      result << word.downcase
    else
      result << word.capitalize
    end
  end

  result.join(' ')
end
