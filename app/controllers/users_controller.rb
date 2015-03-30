# controllers/users_controller.rb

class UsersController < ApplicationController
	
	before_action :get_user, only: [:destroy, :unassign_role]
	# Required because application_controller will redirect to
	# root when user is not authenticated -- should not happen
	# on registration page
	skip_before_action :authenticate_user!, only: [:new, :create]

	def get_role_id(role_name)
		_role = Role.where(role: role_name).first
		return _role.id
	end

	# GET /users/registration 		:registration
	def new
		@user = User.new
	end

	# POST /users/registration
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:homepage_status] = "You signed up successfully"
			redirect_to root_path
		else
			render :new
		end
	end

	def user_params
		params.require(:user).permit(:username, :firstname, 
			:lastname, :password, :password_confirmation, :email,
			:role_id, :created_at, :updated_at)
	end

	# Displaying list of unassigned users on administration page
	# GET /users 			:users
	def index
		all_users = User.all
		is_administrator_role = session[:role] == 'Site Administrator' || session[:role] == 'Vendor Administrator'
		if is_administrator_role
			@users = all_users.where(role_id: get_role_id('User'))
		end
	end

	# Update the user for the specified username with the corresponding role
	# Information is taken from administration index page
	# PUT /user 			:user_assign_role
	def assign_role
		_username = user_params[:username]
		_role_id = role_params[:role_id]
		user = User.where(username: _username).first
		if user.present?
			user.role_id = _role_id.presence || user.role_id
			user.save
		else
			flash[:assign_role_status] = "The username provided does not exist!"
		end
 		redirect_to :administrations 
	end

	def role_params
		params.require(:role).permit(:role_id)
	end

	def get_user
		@user = User.find(params[:id])
	end

	# DELETE /users/:id 		:user
	def destroy
		@user.destroy
		redirect_to :back	
	end

	# Unassign by setting user to have the role 'user'
	# PUT /user/:id 		:user_unassign_role
	def unassign_role
		@user.role_id = get_role_id('User')
		@user.save
		redirect_to :administrations
	end

end
