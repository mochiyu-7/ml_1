class TaskManagersController < ApplicationController
  before_action :set_task_manager, only: %i[ show edit update destroy ]

  def index
    @task_managers = TaskManager.all
  end

  def show
  end

  def new
    @task_manager = TaskManager.new
  end

  def edit
  end

  def create
    @task_manager = TaskManager.new(task_manager_params)

    respond_to do |format|
      if @task_manager.save
        format.html { redirect_to task_manager_url(@task_manager), notice: "Task manager was successfully created." }
        format.json { render :show, status: :created, location: @task_manager }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task_manager.update(task_manager_params)
        format.html { redirect_to task_manager_url(@task_manager), notice: "Task manager was successfully updated." }
        format.json { render :show, status: :ok, location: @task_manager }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task_manager.destroy

    respond_to do |format|
      format.html { redirect_to task_managers_url, notice: "Task manager was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_task_manager
      @task_manager = TaskManager.find(params[:id])
    end

    def task_manager_params
      params.require(:task_manager).permit(:task, :detail)
    end
end
