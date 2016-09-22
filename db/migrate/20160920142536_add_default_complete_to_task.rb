class AddDefaultCompleteToTask < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :complete, :boolean, default: false
  end
end
