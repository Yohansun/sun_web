# -*- encoding : utf-8 -*-
require "digest/md5"

module Icolor
  module APIEntities
    class User < Grape::Entity
      expose :username, :email
      expose :phone, :as => :mobile
      expose :sex, :as => :gender
      expose (:role){|user,options| user.role_chn_name }
    end

    class DetailUser < Grape::Entity
      expose :id, :username, :phone, :email, :sex, :name_of_company, :date_of_birth, :name, :minisite
      expose (:role){|user,options| user.role_chn_name }
      expose (:auth) do |user,options|
        if user.user_tokens.present?
          user.user_tokens.map {|token| {provider: token.provider, is_binding: token.is_binding?, uid: token.uid}}
        else
          nil
        end
      end
      expose (:location) do |user,options|
        {}.tap do |a|
          a[:province] = user.city.try(:parent).try(:name)
          a[:city] = user.try(:city).try(:name)
          a[:district] = user.try(:area).try(:name)
        end
      end
    end
  end
end