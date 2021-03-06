class CreateTasks < ActiveRecord::Migration[6.1]
  enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
  def change
    create_table :tasks, id: :uuid do |t|
      t.text :name
      t.text :details
      t.date :deadline
      t.references :category, type: :uuid
      t.timestamps
    end
  end
end
