class ProblemsController < ApplicationController
  before_action :set_problem, only: %i[show edit update destroy]

  # GET /problems
  # GET /problems.json
  def index
    if params[:query].present?
      @problems = Problem.global_search(params[:query])
    else
      @problems = Problem.all
    end
  end

  # GET /problems/1
  # GET /problems/1.json
  def show
    @problem = Problem.find(params[:id])
  end

  # GET /problems/new
  def new
    @problem = Problem.new
  end

  # GET /problems/1/edit
  def edit
  end

  def upvote
    set_problem
    if current_user.voted_for? @problem
      current_user.unvote_for @problem
    else
      current_user.up_votes @problem
    end
  end

  def downvote
    set_problem
    if current_user.voted_for? @problem
      current_user.unvote_for @problem
    else
      current_user.down_votes @problem
    end
   end

  # POST /problems
  # POST /problems.json
  def create
    @problem = Problem.new(problem_params)

    @problem.tag_list = @problem.tag_list[0].to_s.scan(/\w+/)
    @problem.status = "Open"
    @problem.user = current_user

    respond_to do |format|
      if @problem.save
        format.html { redirect_to @problem, notice: 'Problem was successfully created.' }
        format.json { render :show, status: :created, location: @problem }
      else
        format.html { render :new }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /problems/1
  # PATCH/PUT /problems/1.json
  def update
    new_tags = params[:problem].to_unsafe_h["tag_list"].scan(/\w+/)
    new_tags.each do |tag|
      @problem.tag_list.add(tag)
    end
    respond_to do |format|
      if @problem.save
        format.html { redirect_to @problem, notice: 'Problem was successfully updated.' }
        format.json { render :show, status: :ok, location: @problem }
      else
        format.html { render :edit }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.json
  def destroy
    @problem.destroy
    respond_to do |format|
      format.html { redirect_to problems_url, notice: 'Problem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_problem
    @problem = Problem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def problem_params
    params.require(:problem).permit(:status, :category_id, :title, :description, :user_id, :status, :tag_list)
  end
end
