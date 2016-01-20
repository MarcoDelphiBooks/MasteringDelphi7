<html>

<body>

<h1>ASP.NET with Delphi</h1>

<script language="Delphi" runat="server">
procedure HelloMessage(msg: string);
var
  i: Integer;
begin
  for i := 2 to 7 do
    Response.Write ('<font size=' + inttostr (i) +
      '>' + msg + '</font> <br>')
end;

</script>

<% HelloMessage('Delphi for .NET Preview made this'); %>

</body>

</html>
