# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

def define_schema
  ActiveRecord::Schema.define(version: 20_231_108_083_850) do
    enable_extension
    define_comments_table
    define_likes_table
    define_posts_table
    define_users_table
    define_foreign_keys
  end
end

def enable_extension
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'
end

def define_comments_table
  create_table 'comments', force: :cascade do |t|
    t.text 'text'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'address'
    t.bigint 'user_id', null: false
    t.bigint 'post_id', null: false
    t.index ['address'], name: 'index_comments_on_address'
    t.index ['post_id'], name: 'index_comments_on_post_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end
end

def define_likes_table
  create_table 'likes', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'address'
    t.bigint 'user_id', null: false
    t.bigint 'post_id', null: false
    t.index ['address'], name: 'index_likes_on_address'
    t.index ['post_id'], name: 'index_likes_on_post_id'
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end
end

def define_posts_table
  create_table 'posts', force: :cascade do |t|
    t.string 'title'
    t.text 'text'
    t.bigint 'comments_count'
    t.bigint 'likes_count'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'address'
    t.bigint 'author_id', null: false
    t.index ['address'], name: 'index_posts_on_address'
    t.index ['author_id'], name: 'index_posts_on_author_id'
  end
end

def define_users_table
  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'photo'
    t.text 'bio'
    t.bigint 'posts_count', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'address'
    t.index ['address'], name: 'index_users_on_address'
  end
end

def define_foreign_keys
  add_foreign_key 'comments', 'posts'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'likes', 'posts'
  add_foreign_key 'likes', 'users'
  add_foreign_key 'posts', 'users', column: 'author_id'
end
