class LiveNewsController < ApplicationController
  # GET /live_news
  # GET /live_news.xml
  def index
    @live_news = LiveNews.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @live_news }
    end
  end

  # GET /live_news/1
  # GET /live_news/1.xml
  def show
    @live_news = LiveNews.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @live_news }
    end
  end

  # GET /live_news/new
  # GET /live_news/new.xml
  def new
    @live_news = LiveNews.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @live_news }
    end
  end

  # GET /live_news/1/edit
  def edit
    @live_news = LiveNews.find(params[:id])
  end

  # POST /live_news
  # POST /live_news.xml
  def create
    @live_news = LiveNews.new(params[:live_news])

    respond_to do |format|
      if @live_news.save
        format.html { redirect_to(@live_news, :notice => 'Live news was successfully created.') }
        format.xml  { render :xml => @live_news, :status => :created, :location => @live_news }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @live_news.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /live_news/1
  # PUT /live_news/1.xml
  def update
    @live_news = LiveNews.find(params[:id])

    respond_to do |format|
      if @live_news.update_attributes(params[:live_news])
        format.html { redirect_to(@live_news, :notice => 'Live news was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @live_news.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /live_news/1
  # DELETE /live_news/1.xml
  def destroy
    @live_news = LiveNews.find(params[:id])
    @live_news.destroy

    respond_to do |format|
      format.html { redirect_to(live_news_index_url) }
      format.xml  { head :ok }
    end
  end
end
