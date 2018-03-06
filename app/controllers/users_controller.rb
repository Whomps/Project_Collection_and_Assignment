class UsersController < ApplicationController
  before_action :logged_in_user, only: 
[:index, :show, :edit, :update, :upload, :destroy,
 :iteration0, :iteration1, :iteration2, :iteration3, :iteration4, :poster, :first_video, :final_video,
 :final_report, :project, :filename]
  before_action :correct_user,   only: [:show, :edit, :update]
  before_action :admin_user,     only: [:index, :destroy]

  def index
    #@users = User.order("lower(name) ASC").all.paginate(page: params[:page])
	#@users = User.order("lower(uin) ASC").all.paginate(page: params[:page])
	@sorting = params[:sort]
	    
			@users = User.all	

		@teams = {}
		
		@users.each do |user|
			res = Relationship.find_by_user_id(user.id)
			if res!=nil
			print(res.inspect)
				@teams[user.id] =  Team.find_by_id(res.team_id)
			else
				@teams[user.id]  = nil
			end
		end

		if !session.key?(:teamorder)
		session[:teamorder] = nil
		end

		if @sorting == "currteam"
			nil_team_users = @users.select{|x| @teams[x.id] == nil}
			other_team_users = @users.select{|x| @teams[x.id] != nil}

			if(session[:teamorder] == false)
							@users = (other_team_users + nil_team_users).paginate(page: params[:page])
							session[:teamorder] = true

			else
							@users = (nil_team_users + other_team_users).paginate(page: params[:page])
							session[:teamorder] = false

			end
		else
			@users = @users.order(@sorting).paginate(page: params[:page])
		end
  end

  def show
		print("Params = " + params.to_s())
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
       log_in @user
       flash[:success] = "Welcome to the ProjectApp"
       redirect_to @user
    else
       render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

	def project

		@user = User.find(params[:user_id])

		if !have_permission? 
			return 
		end
		
		@relationship = Relationship.find_by_user_id(params[:user_id])

		if !have_team?
			return
		end
			
		@team = Team.find(@relationship.team_id)
		@assignment = Assignment.find_by_team_id(@team.id)
	
		if !have_project?
			return
		end

		@project = Project.find(@assignment.project_id)
		redirect_to project_path(@project)
	end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

	def make_admin
		@user = User.find(params[:user_id])

		if(!@user.admin)
			@user.update_attribute(:admin, true)
			flash[:success]  = @user.name  + " is now an Administrator!"
		
		else
			@user.update_attribute(:admin, false)
			flash[:success]  = "This administrator has been removed"
		
		end

		redirect_to @user
	end



	def admin_download
		admin_user
		
		@user = User.find(params[:user_id])
		@relationship = Relationship.find_by_user_id(params[:user_id])
		team_id = @relationship.team_id
		cmd = "tar czf ./public/uploads/"+team_id.to_s+".tar.gz"+" ./public/uploads/"+team_id.to_s
		system(cmd)
		send_file("./public/uploads/"+team_id.to_s+".tar.gz", :filename => team_id.to_s+".tar.gz", :type => "application/x-tar")
	end

  def destroy

		team = Team.find_by_user_id(params[:id])

		if(team.nil?)
				User.find(params[:id]).destroy 
				flash[:success] = "User Deleted Permanently!"

		else	
				flash[:warning] = "This user is a team leader! You need to delete his team first"
		end
				redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:name,:uin, :email, :password,
                                   :password_confirmation, :semester,:year, :course)
    end
end
