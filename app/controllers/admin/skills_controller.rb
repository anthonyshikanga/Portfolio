class Admin::SkillsController < AdminController
	before_action :find_skill, only: [:show, :edit, :update, :destroy]

	def index
		@skills = Skill.all
	end

	def show; end

	def new
		@skill = Skill.new
	end

	def create
		@skill = Skill.new(skill_params)

		if @skill.save
			redirect_to
			admin_skill_path(@skill)
		else

			render :new, alert: "Something went wrong."
		end
	end

	def edit; end

	def update
		if @skill.update(skill_params)
			redirect_to
			admin_skill_path(@skill)
		else
			render :edit, alert: "Something went wrong."
		end
	end

	def destroy
		@skill.destroy
		redirect_to admin_skill_path, alert: "Succesfully deleted publication."
	end

	private
	def find_skill
		@skill = Skill.find(params[:id])
	end

	def skill_params
		params.require(:skill).permit(:name, :rating)
	end
	

end
