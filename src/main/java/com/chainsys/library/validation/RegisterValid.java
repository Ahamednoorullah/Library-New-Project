package com.chainsys.library.validation;

import java.util.regex.Pattern;

import com.chainsys.library.model.UserRegister;

public class RegisterValid {

	public boolean isValid(UserRegister userRegister) {
		//get User Details
		String userName  = userRegister.getUserName();
		String email = userRegister.getEmail();
		String password = userRegister.getPassword();
		String confirmPassword = userRegister.getConfirmPassword();
		
		
		boolean nameValidation = userNameValid(userName);
		boolean emailValidation =emailValid(email);
		boolean passwordValidation = passwordValid(password);
		boolean confirmPasswordValidation = confirmPasswordValid(confirmPassword,password);
		
		if ((nameValidation == true)&&(emailValidation == true)&&
				(passwordValidation == true)&&(confirmPasswordValidation == true)) {
			
			return true;
		} else {
            return false;
		}
		
		
	}

	//UserName Validation
	private boolean userNameValid(String userName) {
		String nameRegex = "[a-z .A-Z]+$";
		Pattern pattern = Pattern.compile(nameRegex,Pattern.MULTILINE);
		
		if ((pattern.matcher(userName).matches())&&(userName != "")&&(userName.length() >= 4)) {
			return true;
		} else {
            return false;
		}
		
	}
	

	//Email validation
	private boolean emailValid(String email) {
		String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+
	                         "[a-zA-Z0-9_+&*-]+)*@"+
	                         "(?:[a-zA-Z0-9-]+\\.)+[a-z" + 
	                         "A-Z]{2,7}$";
		Pattern pattern = Pattern.compile(emailRegex,Pattern.MULTILINE);
		
		if ((pattern.matcher(email).matches())&&(email != "")) {
			return true;
		} else {
            return false;
		}
	}
	
	
	//Password Validation
	private boolean passwordValid(String password) {
		if ((password != "")&&((password.length() >= 6))) {
			return true;
		} else {
			return false;
		}
		
	}
	
	//ConfirmPassword Validation
	private boolean confirmPasswordValid(String confirmPassword,String password) {
		if ((confirmPassword != "")&&(confirmPassword.contentEquals(password))) {
			return true;
		} else {
			return false;
		}
		
	}
}
