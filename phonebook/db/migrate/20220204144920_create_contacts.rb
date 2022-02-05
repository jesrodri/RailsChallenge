class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.date :birthday
      t.belongs_to :user
      t.references :user

      t.timestamps
    end
  end
end
