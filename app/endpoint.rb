require 'sinatra'

class ApplicationController < Sinatra::Base
  get '/' do
    number = params[:number].to_i

    return status 500 if number == 0
    return { text: number.to_s }.to_json if number % 3 != 0 && number % 5 != 0
    return { text: 'FizzBuzz' }.to_json if number % 3 == 0 && number % 5 == 0

    response = { text: 'Fizz' } if number % 3 == 0
    response = { text: 'Buzz' } if number % 5 == 0
    return response.to_json
  end
end
