require "rails_helper"

describe Phone do 
	it "does not allow duplicate phone number per contact" do
		contact = Contact.create(firstname: 'Adam', lastname:'Gilchrist', email:'adam.g@gmail.com')
		home_phone = contact.phones.create(phone_type: 'home', phone:'123-456-789')
		mobile_phone = contact.phones.build(phone_type: 'mobile', phone: '123-456-789')

		expect(mobile_phone).to have(1).errors_on(:phone)
	end

	it "allow duplicate phone number per contact" do
		first_contact = Contact.create( firstname: 'Adam', lastname: 'Smith', email: 'adam.s@gmail.com')
		first_contact.phones.create(phone_type: 'home', phone:'123-456')

		other_contact = Contact.new( firstname: 'Andy', lastname: 'bitchell', email: 'andy.b@gmail.com')
		other_contact.phones.build(phone_type: 'home', phone:'123-456')

		expect(other_contact).to be_valid
	end
end