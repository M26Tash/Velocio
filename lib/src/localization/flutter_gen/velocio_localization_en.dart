import 'velocio_localization.dart';

/// The translations for English (`en`).
class VelocioLocalizationEn extends VelocioLocalization {
  VelocioLocalizationEn([String locale = 'en']) : super(locale);

  @override
  String get loginYourAccount => 'Login Your Account';

  @override
  String get phoneNumberOrEmail => 'Phone Number / Email';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot Password ?';

  @override
  String get login => 'Login';

  @override
  String get dontHaveAccount => 'Don’t have account?';

  @override
  String get signUp => 'Sign Up';

  @override
  String get name => 'Name';

  @override
  String get email => 'Email';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get createAccount => 'Create Account';

  @override
  String get doYouHaveAccount => 'Do you have account?';

  @override
  String get enterOtp => 'Enter OTP';

  @override
  String enterOtpDescription(Object email) {
    return 'Please enter your OTP code that we sent on $email';
  }

  @override
  String get enter => 'Enter';

  @override
  String get didntGetOtp => 'Didn’t get OTP?';

  @override
  String get resendOtp => 'Resend OTP';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get resetPasswordDescription => 'Please enter your new password twice to confirm';

  @override
  String get newPassword => 'New Password';

  @override
  String get reEnterNewPassword => 'Re-Enter New Password';

  @override
  String get submit => 'Submit';

  @override
  String get search => 'Search...';

  @override
  String get contacts => 'Contacts';

  @override
  String get savedMessages => 'Saved Messages';

  @override
  String get settings => 'Settings';

  @override
  String version(Object version) {
    return 'Version $version';
  }

  @override
  String get myAccount => 'My Account';

  @override
  String get notification => 'Notification';

  @override
  String get security => 'Security';

  @override
  String get privacy => 'Privacy';

  @override
  String get devices => 'Devices';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get darkTheme => 'Dark Theme';

  @override
  String get lightTheme => 'Light Theme';

  @override
  String get systemTheme => 'System';

  @override
  String get pleaseReEnterPassword => 'Please Re-Enter Password';

  @override
  String get minimumEightCharacter => 'Minimum 8 characters required';

  @override
  String get pleaseEnterYourEmail => 'Please Enter Your Email';

  @override
  String get pleaseEnterYourCorrectEmail => 'Please Enter Correct Email';

  @override
  String get enterEmail => 'Enter email';

  @override
  String get enterYourEmailOtpCode => 'Please enter your email, we will send you OTP code';

  @override
  String get pleaseEnterOtp => 'Please Enter OTP';

  @override
  String get makeSureOtpContainSixDigits => 'Please make sure that OTP contain 6 digits';

  @override
  String get passwordDoesNotMatch => '';

  @override
  String get bio => 'BIO';

  @override
  String get finish => 'Finish';

  @override
  String get username => 'Username';

  @override
  String get pleaseEnterYourUsername => 'Please Enter Your Username';

  @override
  String get fullName => 'Full name';

  @override
  String get pleaseUseOnlyLetters => 'Please use only letters';

  @override
  String get dateOfBirth => 'Date of Birth';

  @override
  String get pleaseEnterYourFullName => 'Please Enter Your Full name';

  @override
  String get location => 'Location';

  @override
  String get pleaseEnterYourLocation => 'Please Enter Your Location';

  @override
  String get pleaseEnterYourBIO => '';

  @override
  String get velocio => 'Velocio';

  @override
  String get signOut => 'Sign Out';

  @override
  String get pickImage => 'Pick Image';

  @override
  String get editFullName => 'Edit Full Name';

  @override
  String get editUsername => 'Edit Username';

  @override
  String get editDateOfBirth => 'Edit Date Of Birth';

  @override
  String get editLocation => 'Edit Location';

  @override
  String get editBIO => 'Edit BIO';

  @override
  String get biometricData => 'Biometric Data';

  @override
  String get changePassword => 'Change Password';

  @override
  String get bellowYouCanSeeAllTheDevices => 'Below you can see all the devices, IP addresses, and login times associated with your account.';

  @override
  String get ip => 'IP';

  @override
  String get dateAndTime => 'Date and Time';

  @override
  String get english => 'English';

  @override
  String get turkish => 'Turkish';

  @override
  String get russian => 'Russian';

  @override
  String get italian => 'Italian';

  @override
  String get passwordChanged => 'Password Changed';
}
