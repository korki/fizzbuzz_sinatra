require 'rspec_helper'

describe ApplicationController do
  describe '/' do
    it 'responds success to get' do
      get '/?number=1'
      expect(last_response).to be_ok
    end

    it 'does not respond to post/or eny other' do
      post '/'
      expect(last_response).not_to be_ok
    end

    describe 'parameters for get' do
      it 'takes in Integer' do
        get '/?number=1'
        expect(last_response).to be_ok
      end

      it 'does not take in String' do
        get '/?number=hello'
        expect(last_response).not_to be_ok
      end

      xit 'does not take in Float' do
        get '/?number=1.2'
        expect(last_response).not_to be_ok
      end
    end

    describe 'happy path' do
      it 'returns Fizz when divisible by 3 is passed' do
        get '/?number=3'
        response_body = JSON.parse(last_response.body)
        expect(response_body['text']).to eq 'Fizz'
      end

      it 'returns Buzz when divisible by 5 is passed' do
        get '/?number=5'
        response_body = JSON.parse(last_response.body)
        expect(response_body['text']).to eq 'Buzz'
      end

      it 'returns FizzBuzz when divisible by 3 & 5 is passed' do
        get '/?number=15'
        response_body = JSON.parse(last_response.body)
        expect(response_body['text']).to eq 'FizzBuzz'
      end

      it 'returns input when not divisible by 3 or 5 is passed' do
        get '/?number=2'
        response_body = JSON.parse(last_response.body)
        expect(response_body['text']).to eq '2'
      end
    end
  end

  def app
    ApplicationController.new
  end
end
