class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy] 
  before_action :authenticate_user!
  after_filter :prepare_unobtrusive_flash


  def index
    myTasks = Task.where(:user_id => current_user.id)
    publicTasks = Task.where(:public => true)
    
    allTasks = myTasks + publicTasks
    @tasks = allTasks.sort_by{|e| e[:created_at]}

    @newTask = Task.new
    6.times do
      @newTask.subtasks.build
    end

  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.js {}
      else
        format.html { render :new }
        format.js {render :action => "error"}
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
      format.js {}
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit!
    end
end
