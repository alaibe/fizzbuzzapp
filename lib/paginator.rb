class Paginator

  def initialize(options)
    @options = options
  end

  def offset
    Integer(@options[:offset])
  rescue TypeError, ArgumentError
    1
  end

  def limit
    Integer(@options[:limit])
  rescue TypeError, ArgumentError
    100
  end

end