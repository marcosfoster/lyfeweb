<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recipes.aspx.cs" Inherits="LYFEWEB.Recipes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="optionBar">
        <h2>Recipes</h2>

        <div class="searchBarContainer">
            <label for="select_recipe">Search</label>
        <select id="select_recipe" class="select_recipe" name="selRecipe" runat="server"></select>
            <a href="#openModal" runat="server">Add</a>
        </div>

        <div class="gv_content">

            <asp:GridView ID="gv_Recipe" runat="server" BorderStyle="None" Width="100%" CellPadding="8" AutoGenerateColumns="False" GridLines="Horizontal" ShowHeader="False" OnRowDataBound="gv_Recipe_RowDataBound">
                <Columns>
                     <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:ImageButton ID="FoodImage" runat="server" ImageUrl='<%# Eval("Picture") %>' ImageAlign="Middle" cssclass="foodImage" />
                        </ItemTemplate> 
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="id_hidden"/>
                    <asp:BoundField HeaderText="Name" DataField="Name"/>
                    <asp:BoundField HeaderText="Serves" DataField="Serves"/>
                    <asp:BoundField HeaderText="Prep Time" DataField="PrepTime"/>

                    <asp:TemplateField HeaderText="" ItemStyle-Width="40">
                        <ItemTemplate>
                            <div class="icon">
                            <asp:Image ID="AddToImage" runat="server" ImageUrl="images/ellipsis.png" ImageAlign="Middle" cssclass="deleteIcon" />
                            </div>
                        </ItemTemplate> 
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" ItemStyle-Width="40">
                        <ItemTemplate>
                            <div class="icon">
                            <asp:Image ID="EditImage" runat="server" ImageUrl="images/edit.png" ImageAlign="Middle" cssclass="deleteIcon" />
                            </div>
                        </ItemTemplate> 
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" ItemStyle-Width="40">
                        <ItemTemplate>
                            <div class="icon">
                            <asp:Image ID="DeleteImage" runat="server" ImageUrl="images/delete.png" ImageAlign="Middle" cssclass="deleteIcon" />
                            </div>
                        </ItemTemplate> 
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>

        </div>
    </div>
</asp:Content>
