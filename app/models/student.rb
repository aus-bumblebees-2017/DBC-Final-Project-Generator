class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable,
  # :recoverable, :rememberable,
  devise :database_authenticatable
end
