# -*- encoding : utf-8 -*-
class PagesController < ApplicationController

  # GET /pages
  # GET /pages.xml
  def index
    @pages = Page.all
    render :layout => 'admin'
    # respond_to do |format|
    #       format.html # index.html.erb
    #       format.xml  { render :xml => @pages }
    #     end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.xml  { render :xml => @page }
    # end
  end
  def view
    @page = Page.find_by_label(params[:label])
    if @page.program_type!=""
      @programs=Program.find_all_by_program_type(@page.program_type,:order=>["position ASC"])    
    end
    @title=@page.name
    render :action=>"show"
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new
    render :layout => 'admin'
    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.xml  { render :xml => @page }
    # end
  end

  # GET /pages/1/edit
  def edit

    @page = Page.find(params[:id])
    render :layout => 'admin'    
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to(@page, :notice => 'Page was successfully created.') }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to(@page, :notice => 'Page was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
    end
  end
end
