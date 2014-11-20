class CarsController < ApplicationController
  before_action :find_car, only: [:edit, :update]

  def index
    @cars = Car.all.paginate(:page => params[:page], per_page:10)
  end

  def edit
  end

  def update
    @car.update(car_params)
    redirect_to cars_path,
      notice: "#{@car.year} #{@car.make} #{@car.model} updated"
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.save
    redirect_to cars_path,
      notice: "#{@car.year} #{@car.make} #{@car.model} created"
  end

  # def destroy
  #   @car.destroy
  #   respond_to do |format|
  #     format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end


  private

  def car_params
    params.require(:car).permit(:year, :make, :model, :price)
  end

  def find_car
    @car = Car.find(params[:id])
  end
end
