<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddIngredients.aspx.cs" Inherits="LYFEWEB.AddIngredients" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Add new ingredient</h2>

    <div class="inputPage">
    <form action="/action_page.php" >
        <div class="boxIng">
    <asp:TextBox id="ingredientName" name="ingredientName" placeholder="Name..." runat="server" />
            </div>
        <div class="boxQua">
    <asp:TextBox id="quantity" name="quantity" placeholder="Quantity..." runat="server" />
            <asp:RegularExpressionValidator ControlToValidate="quantity" ValidationExpression="\d+" runat="server" />
            </div>
        <div class="boxQut">
    <asp:TextBox id="quantityType" name="quantity_Type" placeholder="Quantity Type..." runat="server" />
            </div>

        <div class="boxPri">
        <asp:TextBox id="price" name="price" placeholder="Price..." runat="server" />
    <select id="store" name="store" runat="server">

      <option value="Aldi">Aldi</option>
      <option value="Co-Op">Co-Op</option>
      <option value="Tesco">Tesco</option>
    </select>
  </div>
        <div class="boxBut">
    <input type="submit" value="Submit" runat="server" onserverclick="addIngredient_Click"/> 
            </div>
        <div class="message" runat="server" id="messagediv">
            Success!
        </div>
  </form>
</div>




    <style>
input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

.inputPage {
    display:block;
    grid-template-rows: auto auto auto auto;
    grid-template-columns: 25% 75%;
    grid-gap:15px;
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;

    width:50%;
    min-width:400px;
}
.boxIng{
    grid-column: 1 / 3;
    grid-row: 1 / 2;

}
.boxQua{
    grid-column: 1 / 2;
    grid-row: 2 / 3;
}
.message{
    display:none;
    color: #4CAF50;
}

</style>
</asp:Content>


