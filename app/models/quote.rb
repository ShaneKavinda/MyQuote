class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :philosopher
  has_many :quote_category, dependent: :destroy
  has_many :quote, through: :quote_category
end
