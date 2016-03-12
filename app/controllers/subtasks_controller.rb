class SubtasksController < ApplicationController
  before_action :set_subtask, only: [:show, :edit, :update, :destroy] 
  before_action :authenticate_user!
  after_filter :prepare_unobtrusive_flash


  def index
    @subtasks = Subtask.all

  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @subtask = Subtask.new(subtask_params)
    @subtask.user_id = current_user.id

    respond_to do |format|
      if @subtask.save
        format.html { redirect_to @subtask, notice: 'Subtask was successfully created.' }
        format.js {}
      else
        format.html { render :new }
        format.js {render :action => "error"}
      end
    end
  end

  def update
    respond_to do |format|
      if @subtask.update(subtask_params)
        format.html { }
        format.json { }
      else
        format.html { }
        format.json { }
      end
    end
  end

  def destroy
    @subtask.destroy
    respond_to do |format|
      format.html { redirect_to subtasks_url, notice: 'Subtask was successfully destroyed.' }
      format.json { head :no_content }
      format.js {}
    end
  end

  private
    def set_subtask
      @subtask = Subtask.find(params[:id])
    end

    def subtask_params
      params.require(:subtask).permit!
    end
end
