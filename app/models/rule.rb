class Rule < ActiveRecord::Base
  belongs_to :school
  belongs_to :question
end
