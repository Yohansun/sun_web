# -*- encoding : utf-8 -*-
module HomeHelper
  def gsub_body_string(body_str, str_length)
    raw(truncate(strip_tags(body_str), :length => str_length))
  end
end
