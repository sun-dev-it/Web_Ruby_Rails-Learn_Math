class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.integer :grade
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
