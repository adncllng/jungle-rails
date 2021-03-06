class Rating < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product_id, presence: true
  validates :rating, presence: true
  validates :user, presence: true

end


# Is a review without a product (parent) valid?
# Is a review without a user (reviewer) valid?
# Is a review with no description valid?
# Is a review with no rating valid?
