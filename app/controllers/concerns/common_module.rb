require 'active_support/concern'

module CommonModule
  extend ActiveSupport::Concern

  included do

  end

  def get_page_data
    @designs = IColumnData.show_data(3).limit(5)
    @images = IColumnData.show_data(2).limit 5
    @design_more = IColumnData.where(i_column_type_id: 2, position: 0).first
    @weekly_star_more = IColumnData.where(i_column_type_id: 3, position: 0).first
  end

  module ClassMethods

  end
end
