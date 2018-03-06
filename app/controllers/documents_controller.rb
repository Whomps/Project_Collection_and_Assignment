class DocumentsController < ApplicationController
  def index
  end

  def new
        print("\n\nHello\n")
        print(params)

        print("\nBye\n\n")
  	        @project = Project.find(params[:project_id])
            @document = Document.new
            @options = [["Link", "link"], ["File Upload", "file"]]
  end

  def create

  d = Document.new
  d.author =  current_user.id;
  d.project_id = params[:curr_project]
  d.name =  params[:document][:name]
  d.is_file = (params[:document][:doc_type] == "link") ? false : true

  if(d.is_file)
    d.filein = params[:document][:filein]
  else
    d.link = params[:document][:link]
  end

  d.save!
  @p = Project.find(params[:curr_project])
  flash[:success] = "Documentation Added"
  redirect_to project_documentation_path(@p)

    #Write code to save into db here
    # create_table "documents", force: :cascade do |t|
    # t.boolean  "is_legacy"
    # t.boolean  "is_file"
    #t.string   "name"
    #t.string   "doc_type"
    #t.integer  "project_id"
    #t.datetime "date"
    #t.string   "author"
    #t.string   "link"
    #t.string   "filein"
  
  end

  def destroy
    print(params)
    Document.find(params[:id]).destroy
    flash[:success] = "Document deleted"
    redirect_to project_documentation_path(params[:project_id])
  end
end
