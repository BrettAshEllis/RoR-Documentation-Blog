class Article < ApplicationRecord
include Visible

  has_many :comments

  # validations are used to ensure that only valid data is saved into your database. For example, it may be important to your application to ensure that every user provides a valid email address and mailing address. Rails makes this easy with validations. Validations are typically defined in your model classes.

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10}
end
