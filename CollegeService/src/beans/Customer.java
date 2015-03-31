package beans;

import java.sql.Date;
import java.util.Set;

public class Customer {

	private int id;
	private String userName, password, firstName, lastName;
	private Date dateOfBirth;
	private String email;
	private String billingMethod;

	private Set addresses;
	private Set<School> savedSchools;

	public Customer() {
	}

	public int getId() {
		return id;
	}

	public String getUserName() {
		return userName;
	}

	public String getPassword() {
		return password;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getEmail() {
		return email;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public Set getAddress() {
		return addresses;
	}

	public Set getSavedSchools() {
		return savedSchools;
	}

	public String getBillingMethod() {
		return billingMethod;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setEmailAddress(String email) {
		this.email = email;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public void setAddresses(Set addresses) {
		this.addresses = addresses;
	}

	public void setSavedSchools(Set savedSchools) {
		this.savedSchools = savedSchools;
	}

	public void setBillingmethod(String billingMethod) {
		this.billingMethod = billingMethod;
	}

}
