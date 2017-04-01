class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :birthday
      t.text :skills, array: true, default: []
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.text :company_environment, array: true, default: []
      t.text :job_characteristics, array: true, default: []

      t.timestamps null: false
    end
  end
end
