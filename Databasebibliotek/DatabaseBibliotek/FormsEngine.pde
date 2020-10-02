// ----------------------------------------------------------
class StringVariable
{
  String StringVar;
  
  StringVariable(String var)
  {
    StringVar = var;
  }
  
  String Get()
  {
    return(StringVar);
  }
  
  void Set(String var)
  {
    StringVar = var;
  }
}

class FormsEngine
{
  ArrayList<Form> Forms;
  
  void AddForm(Form f)
  {
    Forms.add(f);
  }
  
  void Draw()
  {
    background(255);
    fill(0);
    
    for (int i=0 ; i<Forms.size() ; i++)
    {
      Form f = Forms.get(i);
      if (f.Open)
        f.Draw();
    }
  }

  void MouseClicked(int x, int y)
  {
    for (int i=0 ; i<Forms.size() ; i++)
    {
      Form f = Forms.get(i);
      if (f.Open)
        f.MouseClicked(x, y);
    }
  }

  void KeyPressed(char Key, boolean Back)
  {
    for (int i=0 ; i<Forms.size() ; i++)
    {
      Form f = Forms.get(i);
      if (f.Open)
        f.KeyPressed(Key,Back);
    }
  }
  
  FormsEngine()
  {
    Forms = new ArrayList<Form>();
  }
}

// ----------------------------------------------------------
class Form
{
  ArrayList<Field> FormFields;
  boolean Open;
  
  void AddField(Field f)
  {
    FormFields.add(f);
  }
   
  void Draw()
  {
    background(255);
    fill(0);

    for (int i=0 ; i<FormFields.size() ; i++)
    {
      Field f = FormFields.get(i);
      f.Draw();
    }
  }
  
  void MouseClicked(int x, int y)
  {
    for (int i=0 ; i<FormFields.size() ; i++)
    {
      Field f = FormFields.get(i);
      f.MouseClicked(x, y);
    }
  }  
  
  void KeyPressed(char Key, boolean Back)
  {
    for (int i=0 ; i<FormFields.size() ; i++)
    {
      Field f = FormFields.get(i);
      if (f.Editing)
      {
        f.KeyPressed(Key,Back);
      }
    }
  }
  
  void Close()
  {
    while (FormFields.size()>0)
      FormFields.remove(0);
      
    Open=false;
  }
  
  Form()
  {
    FormFields = new ArrayList<Field>();
    Open=false;
  }
  
}


// ----------------------------------------------------------
class Field
{
  boolean Editing;
  int FieldX;
  int FieldY;
  int FieldLen;
  int FieldTextSize;
    
  void TextSize(int Size)
  {
    FieldTextSize = Size;
  }
    
  void Draw()
  {
  }
  
  void MouseClicked(int x, int y)
  {
  }
  
  void KeyPressed(char Key, boolean Back)
  {
  }
}

// ----------------------------------------------------------
class Label extends Field
{
  String LabelText;
  
  
  Label(int x, int y, String Text)
  {
    FieldX = x;
    FieldY = y;
    LabelText = Text;
    TextSize(50);
  }
  
  @ Override void Draw()
  {
    textSize(FieldTextSize);
    text(LabelText,FieldX,FieldY);
 
  }
}

// ----------------------------------------------------------
class TextBox extends Field
{
  StringVariable TextBoxVariable;
  
  int TextBoxWidth;
  int TextBoxHeight;

  TextBox(int x, int y, int Width, int Height, StringVariable var)
  {
    FieldX = x;
    FieldY = y;
    TextBoxWidth = Width;
    TextBoxHeight = Height;
    TextBoxVariable = var;
    TextSize(50);
    Editing=false;
  }
  
  @ Override void Draw()
  {
    textSize(FieldTextSize);
    text(TextBoxVariable.Get(),FieldX,FieldY+TextBoxHeight-7);
    if (Editing)
      fill(255, 0);
    else
      fill(205, 50);
    rect(FieldX, FieldY, TextBoxWidth, TextBoxHeight, 8);
    fill(0);
  }
  
  @ Override void MouseClicked(int x, int y)
  {
 
    if (x>FieldX && x<FieldX+TextBoxWidth && y>FieldY && y<FieldY+TextBoxHeight)
      Editing = true;
    else
      Editing=false;
  }

  @ Override void KeyPressed(char Key, boolean Back)
  {
    String s = TextBoxVariable.Get();
    if (Back)
    {
      if (s.length()>0)
      {
        TextBoxVariable.Set(s.substring(0,s.length()-1));
      }
    }
    else
    {
      if ((Key >= 'A' && Key <= 'Z') || (Key >= 'a' && Key <= 'z'))
      {
        TextBoxVariable.Set(s+Key);
      } 
    }
  }

}

// ----------------------------------------------------------
class Button extends Field
{
  StringVariable ButtonAction;
  
  String ButtonText;
  int ButtonWidth;
  int ButtonHeight;
  
  Button(int x, int y, int Width, int Height, String Text, StringVariable Action)
  {
    FieldX = x;
    FieldY = y;
    ButtonWidth = Width;
    ButtonHeight = Height;
    ButtonText = Text;
    ButtonAction=Action;
    TextSize(30);
  }
  
  
  @ Override void Draw()
  {
    fill(125);
    rect(FieldX, FieldY, ButtonWidth, ButtonHeight, 8);
    fill(255);
    textSize(FieldTextSize);
    textAlign(CENTER);
    text(ButtonText,FieldX,FieldY,ButtonWidth, ButtonHeight);

    textAlign(LEFT);
    
    fill(0);
  }
  
  @ Override void MouseClicked(int x, int y)
  {
     if (x>FieldX && x<FieldX+ButtonWidth && y>FieldY && y<FieldY+ButtonHeight)
       ButtonAction.Set("OK");
  }

}



// ----------------------------------------------------------
