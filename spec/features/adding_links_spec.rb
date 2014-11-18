require 'spec_helper'
# require './listing_all_links_spec'
#How does this page know where to get link from?

feature "User adds a new link" do 


	scenario "when browsing the homepage" do 
		expect(Link.count).to eq 0
		visit '/'
		add_link("http://www.makersacademy.com/","Makers Academy")
		expect(Link.count).to eq 1
		link = Link.first
		expect(link.url).to eq("http://www.makersacademy.com/")
		expect(link.title).to eq("Makers Academy")
	end

	scenario "with a few tags" do 
		visit "/"
		add_link("http://www.makersacademy.com/",
							"Makers Academy",
							['education', 'ruby'])
		link = Link.first
		expect(link.tags.map(&:text)).to include("education")
		expect(link.tags.map(&:text)).to include("ruby")
	end

	# scenario "filtered by a tag" do 
	# 	visit '/tags/search'
	# 	expect(page).not_to have_content("Makers Academy")
	# 	expect(page).not_to have_content("Code.org")
	# 	expect(page).to have_content("Google")
	# 	expect(page).to have_content("Bing")
	# end


	def add_link(url, title, tags = [])
		within('#new_link') do 
			fill_in 'url', :with => url
			fill_in 'title', :with => title
			fill_in 'tags', :with => tags.join(' ')
			click_button 'Add Link'
		end
	end



end