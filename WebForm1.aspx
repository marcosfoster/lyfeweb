        <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="LYFEWEB.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    
    <div class="container">
        <form runat="server">
        <asp:TextBox id="ingredientName" name="ingredientName" placeholder="Name..." runat="server" />
    <<asp:TextBox id="quantityIn" name="quantity" placeholder="Quantity..." runat="server" />
    <<asp:TextBox type="text" id="quantityTypeIn" name="quantity_Type" placeholder="Quantity Type..." runat="server" />
        <<asp:TextBox type="text" id="priceIn" name="price" placeholder="Price..." runat="server" />
    <select id="store" name="store" runat="server">
      <option value="Aldi">Aldi</option>
      <option value="Co-Op">Co-Op</option>
      <option value="Tesco">Tesco</option>
    </select>
            </form>
    </div>
        
        <style>
            .container{
                display:grid;
                grid-template-rows: auto auto auto;
                grid-template-columns: 25% 75%;
            }

</style>


</body>
</html>
