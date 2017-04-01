class CreateEmployeeResponses < ActiveRecord::Migration
  def change
    create_table :employee_responses do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.text :answer
      t.boolean :correct

      t.timestamps null: false
    end
  end
end
