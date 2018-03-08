# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_id, null: false
      t.string :firebase_token

      t.timestamps
    end
    add_index :users, :user_id, unique: true
  end
end
