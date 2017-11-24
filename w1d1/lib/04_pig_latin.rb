def translate(sentence)
  words = sentence.split(" ")
  translated_words = words.map { |word| translate_word(word) }
  translated_words.join(" ")
end

def translate_word(word)
  vowels = ['a','e','i','o','u']
  # shift the letters until we find a vowel
  if vowels.include?(word[0])
    "#{word}ay"
  else
    vowels_flag = 0
    until vowels.include?(word[vowels_flag])
      vowels_flag += 1
    end
    vowels_flag += 1 if word[vowels_flag-1] == "q"
    "#{word[vowels_flag..-1]}#{word[0...vowels_flag]}ay"
  end
end
