class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :industry, index: true, foreign_key: true
      t.text :question

      t.timestamps null: false
    end
  end
end
