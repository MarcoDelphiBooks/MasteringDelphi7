<html>
<body>

<h1>ASP.NET with Delphi</h1>

<script language="Delphi" runat="server">

  procedure ButtonClick(Sender: System.Object; E: EventArgs);
  begin
    Message.Text := Edit1.Text;
  end;

</script>

<form runat="server">
   <asp:textbox id="Edit1" runat="server"/>
   <asp:button text="Click Me!" OnClick="ButtonClick" runat="server"/>
</form>

<p><b><asp:label id="Message" runat="server" text="message"/></b></p>

</body>
</html>
