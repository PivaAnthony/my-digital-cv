class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string   :name, null: false, default: ""
      t.string   :surname, null: false, default: ""
      t.string   :email, null: false, default: ""
      t.string   :encrypted_password, null: false, default: ""
      t.string   :phone
      t.datetime :birthdate
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
