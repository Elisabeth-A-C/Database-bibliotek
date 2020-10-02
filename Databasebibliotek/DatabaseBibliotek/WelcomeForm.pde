class WelcomeForm extends Form
{
  StringVariable WelcomeAction;
  
  WelcomeForm(StringVariable welcomeAction)
  {
    WelcomeAction = welcomeAction;
  }
  
  void Open()
  {
    Label l = new Label(600, 400, "WELCOME"); 
    l.TextSize(65);
    AddField(l);
    
    AddField(new Button(623, 510, 250, 40, "START", WelcomeAction));
    
    Open=true;
  }
  
}
