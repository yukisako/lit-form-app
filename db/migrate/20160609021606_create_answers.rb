class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :name
      t.string :email
      t.string :gender
      t.string :color
      t.text   :free_text
      t.timestamps null: false
    end
  end
end
