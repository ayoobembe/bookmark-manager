require 'spec_helper'
require 'link'

describe "Link" do 

	context "Demonstration of how datamapper works" do 

			it 'should be created and then retreived from the db' do 
				#in the beginning our database is empty so there are no links
				expect(Link.count).to eq 0
				#this creates it in the database, so it's stored on the disk
				Link.create(:title => 'Makers Academy',
										:url => "http://www.makersacademy.com/")
				#We ask the databse how many links we have. It should be 1
				expect(Link.count).to eq 1
				#Let's get the first and only link from the database,
				link = Link.first
				#Now it has all properties that it was starting with
				expect(Link.url).to eq("http://www.makersacademy.com/")
				expect(Link.title).to eq("Makers Academy")
				#if we want to, we can destroy it
				link.destroy
				#so now we should have no more links in database
				expect(Link.count).to eq(0)

			end
	end

end