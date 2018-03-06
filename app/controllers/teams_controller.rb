class TeamsController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :create, :destroy]
  before_action :valid_viewer, only: [:show]
  before_action :team_leader_or_admin,   only: [:destroy]
  before_action :team_leader, only: [:preference]

  def preference
    @team = current_user.is_member_of
    if @team
      @title = "Preference Selector"
      @projects = Project.where("approved = ?", true)
      render 'preference'
    else
      flash[:warning] = "You are not yet part of any team"
      redirect_to current_user
    end
  end

  def index
    if current_user.admin?
      @counts = Hash.new
      @leaders = Hash.new
      @status  = Hash.new
      @teams = Team.all

      @teams.each do |team|
        count = (Relationship.where(team_id:team.id).count)  
        @counts[team.id]  =  count
        @leaders[team.id] = team.leader
        @status[team.id] =  ((Assignment.where(:team_id => team.id).blank?) ? "No" : "Yes")
        end #end do

  @sorting = params[:sort]

  	if !session.key?(:assignorder)
		  session[:assignorder] = true
		end

    print(session[:assignorder])
    print("\n\nHello\n\n")

		if @sorting == "assigned"
			unassigned_teams = @teams.select{|x| @status[x.id] == "No"}
			assigned_teams = @teams.select{|x| @status[x.id] != "No"}

			if(session[:assignorder] == false)
							@teams = (unassigned_teams + assigned_teams).paginate(page: params[:page])
							session[:assignorder] = true
			else
							@teams = (assigned_teams + unassigned_teams).paginate(page: params[:page])
							session[:assignorder] = false
			end

		else
			@teams = @teams.order(@sorting).paginate(page: params[:page])
		end



    else
      @team = current_user.is_member_of
      if @team 
        redirect_to @team
      else
        flash[:warning] = "You are not yet part of any team"
        redirect_to current_user
      end
    end
  end

  def new
  	@team = Team.new
  end

  def show
  	@team = Team.find(params[:id])
    @members = @team.members

		@user_names = Array.new

		User.find_each do |user|
  
      if user.admin==false and Relationship.find_by_user_id(user.id)==nil
			  @user_names << user.name 
      end
      @user_names = @user_names.sort_by { |word| word.downcase }
		end

  end

	def remove

    if current_user.admin? && params[:user_id]==Team.find(params[:team_id]).leader.id.to_s()
      flash[:danger]  = "Error . . .  You cannot remove the team leader!"

    else
      @relationship = Relationship.find_by_user_id(params[:user_id])
      @relationship.destroy
      flash[:success] = "Remove successful"
    end

		redirect_to teams_path
	end

	def add_user
		usr = User.find_by_name(params[:user_name].to_s)
		on_team = Relationship.find_by_user_id(usr.id)

    print(params)
		if on_team != nil
			flash[:error] = "This user is already on a team"
			redirect_to teams_path
			

    elsif !current_user.admin? && (Relationship.where(team_id:params[:team_id]).count) >= 6
          flash[:danger]  = "Sorry, this team has already reached the capacity of 6 members. "
          redirect_to teams_path
    
    else
		relationship = Relationship.new
		relationship.team_id = params[:team_id].to_s
		relationship.user_id = User.find_by_name(params[:user_name].to_s).id
		relationship.save
		flash[:success] = "Successfully added user "+ params[:user_name].to_s+" to team"
		redirect_to teams_path
    end
	end
  
  def create
    if current_user.teams.count != 0
      flash[:danger] = "You have already created one team"
      redirect_to teams_path
    elsif current_user.is_member_of.present?
      flash[:danger] = "You are already a member of a team"
      redirect_to root_url
    else
  	  @team = Team.new(team_params)
  	  @team.user_id = current_user.id
  	  @team.code = ('a'..'z').to_a.shuffle.take(4).join()

      if @team.save

        if !current_user.admin?
          current_user.join_team(@team)
        end
        
        
        flash[:success] = "Team created Successfully"
        redirect_to @team
      else
        render 'new'
      end
    end
  end

  def edit
  	@team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      flash[:success] = "Team updated"
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
    Team.find(params[:id]).destroy

    #If this team is deleted, destory its project assginment too!

    assignment = Assignment.find_by_team_id(params[:id])

    if !assignment.nil?
      assignment.destroy
    end

    flash[:success] = "Team deleted"
    redirect_to teams_path
  end
 
 private
    def team_params
      params.require(:team).permit(:name)
    end

    def team_leader
      @team = Team.find(params[:id])
      redirect_to root_url unless @team.is_leader?(current_user)
    end

    def team_leader_or_admin
      @team = Team.find(params[:id])
      redirect_to root_url unless @team.is_leader?(current_user) || current_user.admin?
    end

    def valid_viewer
      @team = Team.find(params[:id])
      redirect_to root_url unless current_user.is_member?(@team) || current_user.admin?
    end
end
