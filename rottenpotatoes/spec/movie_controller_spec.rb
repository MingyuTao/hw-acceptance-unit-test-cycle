require 'rails_helper'
require 'action_controller_workaround'
require 'simplecov'
SimpleCov.start 'rails'


describe MoviesController, type: :controller do
    describe ":same_director" do
        before(:each) do
            allow(Movie).to receive(:find).and_return(
                double(:movie, id:1, title:'The Alien', director:'Ridley Scott')
               
                )
        end
        
        it 'is a valid action' do
           get :same_director, id: 1
           get :same_director, id: 2
        end
        
        it 'gets a movie' do
           expect(Movie).to receive(:find)
           get :same_director, id: 1
        end    
        
        it 'searches by director' do
            expect(Movie).to receive(:where).with(director:'Ridley Scott')
            get :same_director, id: 1
        end
        
        
        
        
    end
    
    context 'does not have valid director' do
        before(:each) do
            allow(Movie).to receive(:find).and_return(
                double(:movie, id:1, title:'Alien', director:'')
                )
        end
        it 'does not search by director' do
           expect(Movie).to_not receive(:where)
           get :same_director, id: 1
        end
        
        it 'shows flash warning message' do
            get :same_director, id: 1
            expect(flash[:warning]).to match "'Alien' has no director info"
        end
       
        
    end    

end