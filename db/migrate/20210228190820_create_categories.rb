class CreateCategories < ActiveRecord::Migration[6.1]
  enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
  def change
    create_table :categories, id: :uuid do |t|
      t.text :name
      t.text :details
      t.references :user, type: :uuid 
      t.timestamps
    end
  end
end
