require 'rails_helper'

describe Contact do
	it "is valid with first name, last name and email" do
	 contact = Contact.new(
			firstname: 'Michael',
			lastname: 'Holding',
			email: 'michael.h@gmail.com'
			)
		expect(contact).to be_valid
	end

  describe 'Validations' do
  	it "is invalid without first name" do
  		expect(Contact.new(firstname: nil)).to have(1).errors_on(:firstname)
  	end

  	it "is invalid without last name" do
  		expect(Contact.new(lastname: nil)).to have(1).errors_on(:lastname)
  	end

  	it "is invalid with duplicate email address" do
  		Contact.create(firstname:'Allan', lastname:'Solly', email:'test@gmail.com')
  		contact = Contact.new(firstname:'Louis', lastname:'Phillips', email:'test@gmail.com')
  		expect(contact).to have(1).errors_on(:email)
  	end
  end

	it "returns full name as string" do
		contact = Contact.new(
			firstname: 'John',
			lastname: 'Doe',
			email: 'john.doe@gmail.com'
			)
		expect(contact.name).to eq 'John Doe'
	end

  describe ".by_letter" do
  	it "returns an sorted array of  results that match" do
  		Contact.create(firstname:'John', lastname:'Johnson', email:'john.j@gmail.com')
  		Contact.create(firstname:'Mitchell', lastname:'Johnson', email:'mitchell.j@gmail.com')
  		Contact.create(firstname:'Ethan', lastname:'Hunt', email:'ethan.hunt@gmail.com')

  		expect(Contact.by_letter('J')).to eq ['Johnson', 'Johnson']
  	end
  end
end
