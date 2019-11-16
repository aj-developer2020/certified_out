class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :role
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.text :picture_url
      t.string :phone
      t.boolean :is_active

      t.timestamps
    end
  end
end
