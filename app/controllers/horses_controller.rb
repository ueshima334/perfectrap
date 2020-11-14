class HorsesController < ApplicationController
  before_action :basic_auth,except:[:show]

  def index
  end

  def new
    @horse = Horse.new
  end

  def create
    horse = Horse.new(horse_params)
    if  horse.valid? && Horse.where(name:params[:horse][:name]).empty?
      horse.save
      flash[:notice] = '保存に成功しました'
      redirect_to :action =>  'new'
    else
      flash[:alert] = '保存に失敗しました'
      @horse = Horse.new
      render :new
    end
  
  end

  def show
    @horse = Horse.find(params[:id])

    @race = Race.race_search(@horse.name)
    @rap = Rap.rap_make(@race)

    @target_race = Race.where(name:params[:racename]).order('day DESC')
    @target_rap = Rap.target_rap_make(params[:racename])

    @rank = Race.rank_search(@race)
  end

private

def horse_params
  params.require(:horse).permit(:name,:horsegender_id,:age_id)
end

def basic_auth
  authenticate_or_request_with_http_basic do |username, password|
    username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
  end
end

end
