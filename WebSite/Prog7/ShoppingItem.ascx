<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShoppingItem.ascx.cs" Inherits="WebSite.Prog7.ShoppingItem" className="ShoppingItem" %>
<asp:TextBox ID="txtID" runat="server" ReadOnly="True" Width="70px"></asp:TextBox>
<asp:TextBox ID="txtName" runat="server" ReadOnly="True" Width="120px"></asp:TextBox>
<asp:TextBox ID="txtPrice" runat="server" ReadOnly="True" Width="70px"></asp:TextBox>
<asp:TextBox ID="txtQuantity" runat="server" OnTextChanged="txtQuantity_TextChanged" Width="50px"></asp:TextBox>
<asp:TextBox ID="txtCost" runat="server" ReadOnly="True" Width="100px"></asp:TextBox>
<asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>

