class TasksController < ApplicationController

  def index
    @tasks = Task.order(:position)
  end

  def show
    @task = Task.find(params[:id])
    flash[:notice] = 'Book was successfully viewed.'

  end

  def new
    @count = Task.count
    @task = Task.new(position: @count + 1)
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to tasks_path
    else
      # The 'new' action is NOT being called here
      # Assign any instance variables needed
      # @count = Task.count
      render('new')
    end
  end

  def edit
    @task = Task.find(params[:id])
    flash[:notice] = 'Book was successfully edited.'
    if @task.changed?
      flash[:notice] = 'Book was successfully created.'
    end

  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to task_path(@task)
    else
      render('edit')
    end
  end

  def delete
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = 'Book was successfully destroyed.'

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(
      :name,
      :position,
      :completed,
      :price,
      :description
    )
  end

end
