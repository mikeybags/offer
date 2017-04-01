class EmployeeResponse < ActiveRecord::Base
  belongs_to :employee
  belongs_to :question
end
