class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :name
      t.text :about
      t.string :yearly_revenue
      t.integer :employee_count
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
