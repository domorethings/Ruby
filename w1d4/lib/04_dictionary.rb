class Dictionary
  attr_reader :entries # setter method

  # constructor
  def initialize 
    @entries = {}
  end 

  # adding a new entry to the dictionary
  def add(newEntry)
    if newEntry.is_a?(String)
      @entries[newEntry] = nil
    elsif newEntry.is_a?(Hash)
      # merge entries hash with newEntries
      @entries.merge!(newEntry)
    end 
  end

  # sorting each key
  def keywords
    @entries.keys.sort { |x,y| x <=> y }
  end

  # find matches
  def find(chunk)
    @entries.select do |word, definition|
      word.match(chunk)
    end
  end

  # search hash for a particular key
  def include?(word)
    @entries.has_key?(word)
  end

  def printable
    # prints each entry on the screen
    # map each entry from @entries
    entries = keywords.map do |keyword|
      %Q{[#{keyword}] "#{@entries[keyword]}"}
    end

    entries.join("\n")
  end
end
