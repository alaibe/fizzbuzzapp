class FizzBuzz

  attr_reader :offset

  def initialize(offset)
    @offset = offset
  end

  class << self

    def paginate(offset, limit)
      (offset..limit).lazy.map { |i| find(i) }
    end

    def find(offset)
      self.new(offset)
    end
  end

  def value
    if (offset % 15).zero?
      'FizzBuzz'
    elsif (offset % 5).zero?
      'Buzz'
    elsif (offset % 3).zero?
      'Fizz'
    else
      offset
    end
  end

  def to_hash
    { offset: @offset, value: value }
  end

end