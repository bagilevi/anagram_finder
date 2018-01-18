class AnagramsController < ApplicationController
  def find
    results = ::GetAnagramsForWords.new(params[:words].split(',')).call
    render json: results
  end
end
