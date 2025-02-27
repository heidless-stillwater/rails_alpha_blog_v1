class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
    end
  end
end
