class LoginForm extends Form
{
  StringVariable Username;
  StringVariable Password;
  StringVariable LoginAction;
  
  LoginForm(StringVariable username, StringVariable password, StringVariable loginAction)
  {
    Username = username; 
    Password = password;
    LoginAction = loginAction;
  }
  
  void Open()
  {
    Label l = new Label(630, 300, "LOG IN"); 
    l.TextSize(65);
    AddField(l);
    
    AddField(new Label(450, 380, "BRUGERNAVN:"));
    AddField(new Label(450, 440, "PASSWORD:"));
    AddField(new TextBox(840, 340, 250, 55, Username));
    AddField(new TextBox(840, 400, 250, 55, Password));
    AddField(new Button(623, 510, 250, 40, "LOG IN", LoginAction));
    
    Open=true;
  }
  
}
