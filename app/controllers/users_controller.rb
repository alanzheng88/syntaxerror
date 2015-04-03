# controllers/users_controller.rb

class UsersController < ApplicationController
	
	before_action :get_user, only: [:destroy, :unassign_role]
	# Required because application_controller will redirect to
	# root when user is not authenticated -- should not happen
	# on registration page
	skip_before_action :authenticate_user!, only: [:new, :create]

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
		is_current_role_site_admin = session[:role] == User.site_admin
		is_current_role_vendor_admin = session[:role] == User.vendor_admin
		is_administrator_role = is_current_role_site_admin || is_current_role_vendor_admin
		if is_administrator_role
			@users = User.all.where(role_id: Role.get_user_id)
		end
	end

	# Update the user for the specified username with the corresponding role
	# Information is taken from administration index page
	# PUT /user 			:user_assign_role
	def assign_state
		_username = user_params[:username]
		user = User.where(username: _username).first
		if user.present?
			_role_id = role_params[:role_id]
			user.role_id = _role_id.presence || user.role_id
			_vendor_id = vendor_params[:vendor_id]
			user.vendor_id = _vendor_id
			user.save
			flash[:assignment_status] = "The role and vendor was successfully updated!"
		else
			flash[:assignment_status] = "The username provided does not exist!"
		end
 		redirect_to :administrations
	end

	def role_params
		return params.require(:role).permit(:role_id)
	end

	def vendor_params
		return params.require(:vendor).permit(:vendor_id)
	end

	def get_user
		@user = User.find(params[:id])
		return @user
	end

	def get_role_name
		role_name = self.role.name
		return role_name
	end

	# DELETE /users/:id 		:user
	def destroy
		@user.destroy
		redirect_to :back	
	end

	# Unassign by setting user to have the role 'user'
	# and vendor to null
	# PUT /user/:id 		:user_unassign_role
	def unassign_role
		@user.role_id = Role.get_user_id
		@user.vendor_id = nil
		@user.save
		redirect_to :administrations
	end

	private :user_params, :role_params, :vendor_params, :get_user
end
