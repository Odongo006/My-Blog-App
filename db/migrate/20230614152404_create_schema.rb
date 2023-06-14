class CreateSchema < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'plpgsql'
    create_table :comments do |t|
      t.bigint :user_id, null: false
      t.bigint :post_id, null: false
      t.text :text
      t.timestamps null: false
    end
    
    create_table :likes do |t|
      t.bigint :user_id, null: false
      t.bigint :post_id, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    
    create_table :posts do |t|
      t.bigint :author_id, null: false
      t.string :title
      t.text :text
      t.integer :comments_counter, default: 0
      t.integer :likes_counter, default: 0
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :posts_counter, default: 0
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    
    add_foreign_key :comments, :posts
    add_foreign_key :comments, :users
    add_foreign_key :likes, :posts
    add_foreign_key :likes, :users
    add_foreign_key :posts, :users, column: :author_id
    
  end
end
