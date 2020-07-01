#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

require 'sinatra'

require_relative 'rendering'

def image_to_blob(image)
  'data:image/jpeg;base64,' + Base64.encode64(image.to_blob)
end

get '*' do
  @character = params[:character]
  @character = "返" if @character.nil?
  @character = @character[0]
  erb :index
end

