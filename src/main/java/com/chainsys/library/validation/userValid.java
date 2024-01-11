package com.chainsys.library.validation;

import java.util.regex.Pattern;

import com.chainsys.library.model.User;

public class userValid {

	public boolean isValid(User user) {
		//get User Details
		String userName  = user.getUserName();
		String email = user.getEmail();
		String password = user.getPassword();
		String confirmPassword = user.getConfirmPassword();
		
		System.out.println(userName+"  "+email+" "+password+" " +confirmPassword );
		
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
		
		if ((pattern.matcher(userName).matches())&&(userName != "")&&(userName != null)&&(userName.length() >= 4)) {
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
		
		if ((pattern.matcher(email).matches())&&(email != "")&&(email != null)) {
			return true;
		} else {
            return false;
		}
	}
	
	
	//Password Validation
	private boolean passwordValid(String password) {
		if ((password != "")&&(password != null)&&((password.length() >= 6))) {
			return true;
		} else {
			return false;
		}
		
	}
	
	//ConfirmPassword Validation
	private boolean confirmPasswordValid(String confirmPassword,String password) {
		if ((confirmPassword != "")&&(confirmPassword != null)&&(confirmPassword.contentEquals(password))) {
			return true;
		} else {
			return false;
		}
		
	}
}
