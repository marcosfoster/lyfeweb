<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecipeDetail.aspx.cs" Inherits="LYFEWEB.RecipeDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrapper">
        <div class="title">
            <h2>Spaghetti Bolognese</h2>
        </div>
        <div class="detail" id="recipeDetail" runat="server">
        </div>
        <div class="ingredients">
            <asp:GridView ID="gvIngredients" runat="server" AutoGenerateColumns="False" GridLines="None" CellPadding="8" HeaderStyle-BorderStyle="None">
                <Columns>
                    <asp:BoundField HeaderText="R_ID" DataField="R_ID" Visible="False" />
                    <asp:BoundField HeaderText="I_ID" DataField="I_ID" Visible="False" />
                    <asp:BoundField HeaderText="Ingredient" DataField="NAME" Visible="True" />
                    <asp:BoundField HeaderText="Quantity" DataField="QUANTITY" Visible="True" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="method" id="recipeMethod" runat="server">
            <h6>Method</h6>
        </div>
    </div>


    <style type="text/css">
        .ingredients{
            grid-area: sidebar;
            border-right: solid 1px;
        }
        .method{
            grid-area: content;
        }
        .title{
            grid-area: title;
        }
        .detail{
            grid-area: header;
        }
        .wrapper{
            margin-top: 20px;
            display:grid;
            grid-gap:15px;
            grid-template-columns:300px 1fr;
            grid-template-areas: "title header"
                                 "sidebar content";
        }
    </style>
</asp:Content>
