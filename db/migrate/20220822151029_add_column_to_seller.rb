class AddColumnToSeller < ActiveRecord::Migration[7.0]
  def change
    add_column :sellers, :name, :string
    add_column :sellers, :phone, :string
  end
end
