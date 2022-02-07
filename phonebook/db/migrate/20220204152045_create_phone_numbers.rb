class CreatePhoneNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :phone_numbers do |t|
      t.string :number, null: false
      t.string :num_type
      t.boolean :main_number, null: false
      t.belongs_to :contact
      t.references :contact, foreign_key: true

      t.index :number, unique: true
      t.timestamps
    end
  end
end
