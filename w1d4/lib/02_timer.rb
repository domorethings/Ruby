class Timer
   attr_accessor :seconds

   # constructor for a new timer
   def initialize(seconds = 0)
    @seconds = seconds
   end

   # pad the numbers
   def padded(num)
    if num < 10
      "0#{num}"
    else
      "#{num}"
    end
  end
  
  # convert seconds to hours
  def hours
    Integer(seconds/3600)
  end

  # converts seconds to minutes
  def minutes
    Integer(seconds % 3600) / 60
  end

  def minute_seconds
    Integer(seconds % 60)
  end

  def time_string
    "#{padded(hours)}:#{padded(minutes)}:#{padded(minute_seconds)}"
  end
end
