<%@ Page Title="" Language="C#" MasterPageFile="~/Prog7/Prog7MasterPage.master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="WebSite.Prog7.Member.Checkout" %>

<%@ Register Src="~/Prog7/ShoppingItem.ascx" TagPrefix="uc1" TagName="ShoppingItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>

    <asp:TextBox ID="txtTotal" runat="server" ReadOnly="True"></asp:TextBox>
    <asp:Button ID="btnCheckout" runat="server" OnClick="btnCheckout_Click" Text="Checkout" />

</asp:Content>

