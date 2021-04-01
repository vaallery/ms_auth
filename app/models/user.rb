class User < Sequel::Model
  NAME_FORMAT = %r{\A\w+\z}
  # has_secure_password
  plugin :secure_password, include_validations: false

  # has_many :sessions, class_name: 'UserSession', dependent: :delete_all
  plugin :association_dependencies
  one_to_many :sessions, class: :UserSession
  add_association_dependencies sessions: :delete

  def validate
    super
    validates_presence :name, message: I18n.t(:blank, scope: 'model.errors.user.name')
    validates_format NAME_FORMAT, :name, message: I18n.t(:invalid, scope: 'model.errors.user.name')
    validates_presence :email, message: I18n.t(:blank, scope: 'model.errors.user.email')
    validates_presence :password, message: I18n.t(:blank, scope: 'model.errors.user.password')
  end
end