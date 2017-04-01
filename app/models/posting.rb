class Posting < ActiveRecord::Base
  belongs_to :industry
  belongs_to :employer
end
