class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order('name')

		@new_category = Category.new
  end

  def show
    @training = Training.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category added.'
    else
      flash[:alert] = 'Saving failed.'
    end

    redirect_to categories_path
  end

  def edit
    @categories = Category.all.order('name')
      @edit_category = Category.find(params[:id])

      render 'categories/index'
  end
  
  def update
      @category = Category.find(params[:id])

      if @category.update(category_params)
      flash[:success] = "Category updated."
    else
      flash[:alert] = "Update failed."
    end
    
    redirect_to categories_path
  end
  
  def destroy
      @category = Category.find(params[:id])

      if @category.certificates.size != 0
        flash[:alert] = "Cannot delete category. There are certificates associated to it."
      else
        if @category.destroy
          flash[:success] = "Category deleted."
        else
          flash[:alert] = "Something went wrong."
        end
      end

      redirect_to categories_path
  end
  
  
  private
  
  def category_params
      params.require(:category).permit(:name)
  end

end
