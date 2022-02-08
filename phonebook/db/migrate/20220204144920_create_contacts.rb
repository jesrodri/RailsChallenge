class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.date :birthday
      t.references :user, foreign_key: true

      t.index :name, unique: true
      t.timestamps
    end
  end
end
