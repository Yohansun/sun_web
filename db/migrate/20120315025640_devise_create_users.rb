class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email, :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      t.integer :role_id #角色ID
      t.string :username #用户名

                                               #头像字段没有添加

      t.boolean :des_status, :default => true  #设计师注册页面‘目前状态’
      t.string :inauguration_company           #设计师注册页面‘就职公司’
      t.string :inauguration_address           #设计师注册页面‘就职地址’
      t.string :current_school                 #设计师注册页面‘在读学校’
      t.string :school_address                 #设计师注册页面‘学校地址’

      t.boolean :recommended, :default => true #设计师和公司用户‘是否有推荐人’
      t.integer :recommended_id                #推荐人用户名
      t.string :name                           #真实姓名
      t.string :name_of_company                #公司名称
      t.string :sex                            #性别

      t.date :date_of_birth                    #出生日期
      t.date :founded_of_company               #公司创立日期
      t.string :location                       #所在地

      t.string :recipient_address              #收件地址
      t.string :company_address                #公司地址
      t.string :zip_code                       #邮政编码

      t.string :phone                          #联系电话

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      t.timestamps
    end

    add_index :users, :email, :unique => true
    add_index :users, :reset_password_token, :unique => true

  end
end
