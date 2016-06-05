class FizzBuzzsController < ApplicationController

  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'
    FizzBuzz.paginate(paginator.offset, paginator.limit).each do |fizz_buzz|
      sse.write(fizz_buzz)
    end
  rescue IOError
  ensure
    sse.close
  end

  def show
    fizz_buzz = FizzBuzz.find(params[:id].to_i)

    render json: fizz_buzz
  end

  private

  def paginator
    @paginator ||= Paginator.new(params)
  end

  def sse
    @sse ||= SSE.new(response.stream)
  end

end