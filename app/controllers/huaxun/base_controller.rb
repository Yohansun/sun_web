# encoding: utf-8
class Huaxun::BaseController < ApplicationController
  layout 'huaxun'

  before_filter :is_sign
end
