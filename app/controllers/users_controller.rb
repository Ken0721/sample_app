class UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
	before_action :admine_user, only: :destroy

	def index
		@users = User.paginate(page: params[:page])
	end	

	def show
		@user = User.find(params[:id])
		@projects = @user.projects.paginate(page: params[:page])
	end
  def new
		@user = User.new
  end
	
	def edit
		@user = User.find(params[:id])
	end
		
	def projects
		@user = User.find(params[:id])
		@projects = @user.projects.paginate(page: params[:page])
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			flash[:success] = "Welcome to the Sample App!"
			redirect_to user_url(@user)
		else
			render 'new'
		end
	end
	
	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted"
		redirect_to users_url
	end
	
	def following
		@title = "Following"
		@user = User.find(params[:id])
		@users = @user.following.paginate(page: params[:page])
		render 'show_follow'
	end

	def followers
		@title = "Followers"
		@user = User.find(params[:id])
		@users = @user.followers.paginate(page: params[:page])
		render 'show_follow'
	end
	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
	
		def admin_user
			redirect_to(root_url) unless current_user.admin?
		end
end
