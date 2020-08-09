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
            redirect 'health_entries/#{@health_entry.id}'
        
        else 
            redirect :'/health_entries/new'
        end

    end
end