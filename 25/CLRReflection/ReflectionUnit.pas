unit ReflectionUnit;

interface

uses 
    System.Windows.Forms,
    System.Reflection,
    System.Drawing,
    Borland.Delphi.SysUtils;
    
type

ReflectionForm = class(System.Windows.Forms.Form)
 private
        mainMenu       : System.Windows.Forms.MainMenu;
        fileMenu       : System.Windows.Forms.MenuItem;
        separatorItem  : System.Windows.Forms.MenuItem;
        openItem       : System.Windows.Forms.MenuItem;
        exitItem       : System.Windows.Forms.MenuItem;

        showFileLabel  : System.Windows.Forms.Label;
        typesListBox   : System.Windows.Forms.ListBox;
        openFileDialog : System.WIndows.Forms.OpenFileDialog;
        
 protected
        procedure InitializeMenu;
        procedure InitializeControls;
        procedure PopulateTypes(fileName : String);
        
        { Event Handlers }
        procedure exitItemClick(sender : TObject; Args : System.EventArgs);
        procedure openItemClick(sender : TObject; Args : System.EventArgs);
        

 public
        constructor Create;        
end;
    
implementation


constructor ReflectionForm.Create;
begin
     inherited Create;
     
     SuspendLayout;
     InitializeMenu;
     InitializeControls;
     
     { Initialize the form and other member variables }
     openFileDialog        := System.Windows.Forms.OpenFileDialog.Create;
     openFileDialog.Filter := 'Assemblies (*.dll;*.exe)|*.dll;*.exe';
     openFileDialog.Title  := 'Open an assembly';
     
     AutoScaleBaseSize := System.Drawing.Size.Create(5, 13);
     ClientSize        := System.Drawing.Size.Create(631, 357);
     Menu              := mainMenu;
     Name              := 'reflectionForm';
     Text              := 'Reflection in Delphi for .NET';
     
     { Add the controls to the form's collection. }
     Controls.Add(showFileLabel);
     Controls.Add(typesListBox);
     ResumeLayout;
     
end;


procedure ReflectionForm.InitializeMenu;
var
  menuItemArray : array of System.Windows.Forms.MenuItem;
  
begin
            mainMenu := System.Windows.Forms.MainMenu.Create;
            fileMenu := System.Windows.Forms.MenuItem.Create;
            openItem := System.Windows.Forms.MenuItem.Create;
            separatorItem := System.Windows.Forms.MenuItem.Create;
            exitItem := System.Windows.Forms.MenuItem.Create;
            
            { Initialize mainMenu }
            mainMenu.MenuItems.Add(fileMenu);
            
            { Initialize fileMenu }
            fileMenu.Index := 0;
            SetLength(menuItemArray, 3);
            menuItemArray[0] := openItem;
            menuItemArray[1] := separatorItem;
            menuItemArray[2] := exitItem;
            fileMenu.MenuItems.AddRange(menuItemArray);
            fileMenu.Text := '&File';
            
            
            // openItem
            openItem.Index := 0;
            openItem.Text := '&Open...';
            openItem.add_Click(openItemClick);
             
            // separatorItem
            separatorItem.Index := 1;
            separatorItem.Text := '-';

            // exitItem
            exitItem.Index := 2;
            exitItem.Text := 'E&xit';
            exitItem.add_Click(exitItemClick);
end;


procedure ReflectionForm.InitializeControls;
begin

            { Initialize showFileLabel }
            showFileLabel          := System.Windows.Forms.Label.Create;
            showFileLabel.Location := System.Drawing.Point.Create(5, 6);
            showFileLabel.Name     := 'showFileLabel';
            showFileLabel.Size     := System.Drawing.Size.Create(616, 37);
            showFileLabel.TabIndex := 0;
            showFileLabel.Anchor   := System.Windows.Forms.AnchorStyles.Top or System.Windows.Forms.AnchorStyles.Left or System.Windows.Forms.AnchorStyles.Right;            
            showFileLabel.Text     := 'Showing types in: ';
            
            { Initialize typesListBox }
            typesListBox           := System.Windows.Forms.ListBox.Create;
            typesListBox.Anchor    := System.Windows.Forms.AnchorStyles.Top or System.Windows.Forms.AnchorStyles.Bottom or System.Windows.Forms.AnchorStyles.Left or System.Windows.Forms.AnchorStyles.Right;
            typesListBox.Location  := System.Drawing.Point.Create(8, 46);
            typesListBox.Name      := 'typesListBox';
            typesListBox.Size      := System.Drawing.Size.Create(610, 303);
            typesListBox.Font      := System.Drawing.Font.Create('Lucida Console', 8.25, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, 0);            
            typesListBox.TabIndex  := 1;            
            
     
end;

procedure ReflectionForm.exitItemClick(sender : TObject; Args : System.EventArgs);
begin
    System.Windows.Forms.Application.Exit;
end;

procedure ReflectionForm.openItemClick(sender : TObject; Args : System.EventArgs);
begin
    if openFileDialog.ShowDialog = DialogResult.OK then
      begin 
         showFileLabel.Text := 'Showing types in: ' + openFileDialog.FileName;
         PopulateTypes(openFileDialog.FileName);
      end;
end;

procedure ReflectionForm.PopulateTypes(fileName : String);
var
  assy    : System.Reflection.Assembly;
  modules : array of System.Reflection.Module;
  module  : System.Reflection.Module;
  types   : array of System.Type;
  t       : System.Type;
  members : array of System.Reflection.MemberInfo;
  m       : System.Reflection.MemberInfo;
  i,j,k   : Integer;
  s       : String;
begin
     try
        { Clear the listbox }
        typesListBox.BeginUpdate;
        typesListBox.Items.Clear;
        
        { Load the assembly and get its modules }
        assy    := System.Reflection.Assembly.LoadFrom(fileName);
        modules := assy.GetModules;        
        
        {For every module, get all types }
        for i := 0 to High(modules) do
         begin
           module := modules[i];
           types  := module.GetTypes;
           
           { For every type, get all of its members }
           for j := 0 to High(types) do
            begin
               t := types[j];
               members := t.GetMembers;
               
               { for every member, get type information and add to list box }
               for k := 0 to High(members) do 
                begin
                  m := members[k];
                  s := module.Name + ':' + t.Name + ': ' + m.Name + ' (' + m.MemberType.ToString + ')';
                  typesListBox.Items.Add(s);
               end;
            end;
         end;
         typesListBox.EndUpdate;
     except
        System.Windows.Forms.MessageBox.Show('Could not load the assembly.');
     end;
end;


end.
