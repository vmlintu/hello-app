#!/usr/bin/env ruby
# coding: utf-8

require 'json'
require 'sinatra'
require "sinatra/config_file"

class HelloApp < Sinatra::Base
  register Sinatra::ConfigFile

  config_file '/etc/hello-app/config.yml'

  get '/' do
    if settings.homepage
      return settings.homepage
    else
      return 'Homepage'
    end
  end

  get '/echo' do
    msg = params[:msg]

    msg
  end
end
