# reverser - reverses the string returned by the default block
def reverser(&prc)
  sentence = prc.call
  words = sentence.split(' ')
  reversed_words_arr = words.map { |word| word.reverse }
  reversed_words_arr.join(' ')
end

# adds one to the current value
def adder(surplus=1, &prc)
  value = prc.call
  value + surplus
end

# repeats the default block a certain amount of times
def repeater(times=1, &prc)
  times.times do
    prc.call
  end
end
