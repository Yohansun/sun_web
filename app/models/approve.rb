# -*- encoding : utf-8 -*-
class Approve < ActiveRecord::Base
  ID_TYPE = {
    1 => "身份证",
    2 => "护照",
    3 => "台胞证",
    4 => "军人证"
  }
end
