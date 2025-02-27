class AddTstamps < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :created_at, :datetime, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    add_column :articles, :updated_at, :datetime, null: false, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
