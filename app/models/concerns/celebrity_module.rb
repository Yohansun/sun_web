# -*- encoding : utf-8 -*-
require 'active_support/concern'

module CelebrityModule
  extend ActiveSupport::Concern

  included do
    paginates_per 12
  end

  def _get_attr *args,&block

  end

  module ClassMethods

    def validate_presence_and_uniqueness_of _column
      validates_presence_of _column
      validates_uniqueness_of _column
    end

    def find_by_keyword _column,_keyword
      if self.column_names.include? _column
        where(["#{_column} LIKE ?","%#{_keyword}%"])
      else
        raise "Table #{self.table_name} column: #{_column} not define"
      end
    end

    def desc _column
      order("#{_column.to_s} desc")
    end

    def asc _column
      order("#{_column.to_s} asc")
    end
  end

end
