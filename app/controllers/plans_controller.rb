class PlansController < ApplicationController

  def index
    @plan = Plan.all.order('day DESC')
  
  end
  
  def new
    @plan = Plan.new
  end
  
  def create
  
    data = params.require(:plan).permit(:url)
    
    xml = Nokogiri::XML(open(data[:url]).read)
  
    plan = Plan.plan_save(xml)
  
    if plan.valid?
      flash[:notice] = '保存に成功しました'
      redirect_to :action =>  'new' and return
    else
      flash[:alert] = '保存に失敗しました'
      @plan = Plan.new
      render :new and return
    end
  
  end
  
  # def destroy
  #   @plan = Plan.find(params[:id])
  #   @plan.destroy
  #   redirect_to :action =>  'index' and return
  # end
  
  def show
    # 選択されたレースを取得
    @plan = Plan.find(params[:id])
    # レースに出走予定の馬を@horsesへ配列として取得
    @horses = []
    n = 1
    while @plan.send("horse#{n}") != "" do
      @horses << @plan.send("horse#{n}")
      n += 1
      if n == 18
        break
      end
     end
  end
  
  end
  