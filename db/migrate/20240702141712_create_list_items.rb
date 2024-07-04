# frozen_string_literal: true

class CreateListItems < ActiveRecord::Migration[7.1]
  def change
    create_table :list_items do |t|
      t.belongs_to :list, foreign_key: true, null: false, index: false
      t.references :movie, null: true, index: false
      t.integer :position, null: false

      t.timestamps
    end

    add_index :list_items, %i[list_id movie_id], unique: true
  end
end
