class Book
  LOWER_CASE = [
    "a",
    "an",
    "and",
    "the",
    "of",
    "in"
  ]
  
  attr_reader :title

  def title=(title) # titleizes a string book
    # iterate through every word in the sentence
    words = title.split(' ').map(&:downcase)
    capitalized_title = words.map.with_index do |word, i|
      # if the word is included in LOWER_CASE and it is not the first word, don't capitalize
      if LOWER_CASE.include?(word) && i != 0
        word.downcase
      else
        word.capitalize
      end
    end

    @title = capitalized_title.join(" ")
  end 
end
