class AddItemandmoneyToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :item, :string
    add_column :answers, :money, :integer
  end
end
