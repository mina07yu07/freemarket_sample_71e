# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname,                    null: false, unique: true
      t.string :email,                       null: false, default: ""
      t.string :encrypted_password,          null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.string :first_name,                  null:false
      t.string :family_name,                 null:false
      t.string :first_name_kana,             null:false
      t.string :family_name_kana,            null:false
      t.integer :birth_year,                 null:false
      t.integer :birth_month,                null:false
      t.integer :birth_day,                  null:false
      t.string :post_code,                   null:false
      t.string :prefecture_code,             null:false
      t.string :city,                        null:false
      t.string :house_number,                null:false
      t.string :building_name
      t.string :phone_number
      t.timestamps null: false


      t.string :destination_family_name,                 null:false
      t.string :destination_first_name,                  null:false
      t.string :destination_family_name_kana,            null:false
      t.string :destination_first_name_kana,             null:false
    end
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
