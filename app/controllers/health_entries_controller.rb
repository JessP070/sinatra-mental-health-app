class HealthEntriesController < ApplicationController
    
    get '/health_entries/new' do
        erb :'/health_entries/new'
    end

    post '/health_entries' do
        if !logged_in?
            redirect '/'
        end
        
        if params[:content] != ""
            
            @health_entry = HealthEntry.create(content: params[:content], user_id: current_user.id)
            redirect "/health_entries/#{@health_entry.id}"

        else 
            redirect '/health_entries/new'
        end
    end

    get '/health_entries/:id' do
        set_health_entry   
        erb :'/health_entries/show'
    end


    get '/health_entries/:id/edit' do
        set_health_entry
        
        erb :'/health_entries/edit'
    end

    patch '/health_entries/:id' do
        set_health_entry
        @health_entry.update(content: params[:content])

        redirect "/health_entries/#{@health_entry.id}"
    end
        

    private 

    def set_health_entry
        @health_entry = HealthEntry.find(params[:id])
    end
end