class ProjectsController < ApplicationController
	before_action :get_user, only: [:create,:new]
	def new
     @project = Project.new
	end

	def create
		
		@project = Project.new(project_params)
		if @project.save
			flash[:notice] = "project saved succesfully"
			redirect_to skill_path(params[:skill_id])
		else

			render :new
		end
	end

	private
	def project_params
		skill = {skill_id:params[:skill_id]}
		params.require(:project).permit(:name, :skill_id).merge(skill)
	end
	def get_user
		@user = current_user
		@skill = Skill.find(params[:skill_id])
	end
end


