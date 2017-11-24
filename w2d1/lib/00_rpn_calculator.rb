class RPNCalculator
  OPERATORS = [:+, :-, :/, :*]

  def initialize
    @stack = []
  end

  def minus
    perform_op(:-)
  end

  def plus
    perform_op(:+)
  end

  def times
    perform_op(:*)
  end

  def divide
    perform_op(:/)
  end

  # evaluates what to do with the next token
  def evaluate(string)
    tokens(string).each do |token|
      # switch statement for token. helps decide what to do
      # with the token
      case token
      when Integer
        push(token)
      when Symbol 
        perform_op(token)
      end
    end

    value # returns the last element in stack
  end

  def value
    @stack.last
  end

  def push(int)
    @stack << int
  end

  def tokens(string)
    chars = string.split(" ")
    chars.map { |char| operator?(char) ? char.to_sym : Integer(char) }
  end
  
  private
  def operator?(char)
    return true if OPERATORS.include?(char.to_sym)
    return false
  end

  # evaluates an operation
  def perform_op(operation_symbol)
    raise "calculator is empty" unless @stack.size >= 2
    # collect the right operand and left operand
    right_operand = @stack.pop
    left_operand = @stack.pop
    # add back to the stack, the value after
    case operation_symbol
    when :+
      @stack << left_operand + right_operand
    when :-
      @stack << left_operand - right_operand
    when :*
      @stack << left_operand * right_operand
    when :/
      @stack << left_operand.fdiv(right_operand) #fdiv to round down
    else
      @stack << left_op << right_op
      raise ArgumentError.new("No operation #{operation_symbol}")
    end
    
    self
  end
end
