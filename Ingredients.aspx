<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ingredients.aspx.cs" Inherits="LYFEWEB.Ingredients" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .modalDialog {
	        position: fixed;
	        font-family: Arial, Helvetica, sans-serif;
	        top: 0;
	        right: 0;
	        bottom: 0;
	        left: 0;
	        background: rgba(0,0,0,0.8);
	        z-index: 99999;
	        opacity:0;
	        -webkit-transition: opacity 400ms ease-in;
	        -moz-transition: opacity 400ms ease-in;
	        transition: opacity 400ms ease-in;
	        pointer-events: none;
        }
        .modalDialog:target {
	        opacity:1;
	        pointer-events: auto;
        }

        .modalDialog > div {
	        width: 443px;
	        position: relative;
	        margin: 10% auto;
	        padding: 5px 20px 13px 20px;
	        background: #fff;

        }   
        .close {
	        background: #606061;
	        color: #FFFFFF;
	        line-height: 25px;
	        position: absolute;
	        right: -12px;
	        text-align: center;
	        top: -10px;
	        width: 24px;
	        text-decoration: none;
	        font-weight: bold;
	        -webkit-border-radius: 12px;
	        -moz-border-radius: 12px;
	        border-radius: 12px;
	        -moz-box-shadow: 1px 1px 3px #000;
	        -webkit-box-shadow: 1px 1px 3px #000;
	        box-shadow: 1px 1px 3px #000;
        }

.close:hover { background: #00d9ff; }

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

    width:90%;
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

    <div class="optionBar">
        
        <h2>Ingredients</h2>

        <div class="searchBarContainer">
            <label for="select_ingredient">Search</label>
        <select id="select_ingredient" class="select_ingredient" name="selIngredient" runat="server" OnSelectedIndexChanged="selIngChange"></select>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            <a href="#openModal" runat="server">Add</a>
            <select id="select_list" class="select_list" name="selList" runat="server" ></select>
        </div>
    </div>

    <div class="gv_content">
        <asp:GridView ID="gv_ingredients" runat="server" GridLines="Horizontal" Width="100%" CellPadding="8" OnRowUpdating="gv_ingredients_RowUpdating" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="#F0F0F0" />
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="ID" Visible="True" />
                <asp:BoundField HeaderText="Name" DataField="Name"/>
                <asp:BoundField HeaderText="Quantity" DataField="Quantity"/>
                <asp:BoundField HeaderText="Price" DataField="Price"/>
                <asp:BoundField HeaderText="Price Store" DataField="PriceStore" />

                <asp:TemplateField HeaderText="" ItemStyle-Width="40">
                        <ItemTemplate>
                            <div class="icon">
                                <asp:ImageButton ID="ibAddTo" runat="server" ImageUrl="images/ellipsis.png" ImageAlign="Middle" CssClass="deleteIcon" OnClick="IbAddTo_Click" />
                            </div>
                        </ItemTemplate> 

<ItemStyle Width="40px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" ItemStyle-Width="40">
                        <ItemTemplate>
                            <div class="icon">
                                <asp:ImageButton ID="ibEditIngredient" runat="server" ImageUrl="images/edit.png" ImageAlign="Middle" CssClass="deleteIcon" OnClick="IbEditIngredient_Click" />
                            </div>
                        </ItemTemplate> 

<ItemStyle Width="40px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" ItemStyle-Width="40">
                        <ItemTemplate>
                            <div class="icon">
                                <asp:ImageButton ID="ibDeleteIngredient" runat="server" ImageUrl="images/delete.png" ImageAlign="Middle" CssClass="deleteIcon" OnClick="IbDeleteIngredient_Click" />
                            </div>
                        </ItemTemplate> 

<ItemStyle Width="40px"></ItemStyle>
                    </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#D8D8D8" />


            <HeaderStyle BorderWidth="0px" />


        </asp:GridView>
    </div>

    <div id="openModal" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
		<h3>Add new ingredient</h3>

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
    <input type="submit" value="Submit" runat="server" /> 
            </div>
        <div class="message" runat="server" id="messagediv">
            Success!
        </div>
  </form>
</div>
	</div>
</div>

</asp:Content>
