# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :followings
  has_many :followers

  def followings
    self.followings
  end

  def followers
    self.followes
  end
end
