class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :title
      t.string :description
      t.text :qualifications, array: true, default: []
      t.text :responsibilities, array: true, default: []
      t.string :job_type
      t.string :required_education
      t.string :required_experience
      t.string :job_characteristics
      t.references :industry, index: true, foreign_key: true
      t.references :employer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
