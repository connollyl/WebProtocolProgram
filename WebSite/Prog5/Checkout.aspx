﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Prog5/Prog5MasterPage.master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="WebSite.Prog5.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageContentPlaceHolder" runat="server">
    <asp:GridView ID="GVShoppingBag" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    <asp:Button ID="btnCheckout" runat="server" OnClick="btnCheckout_Click" Text="Checkout" />
</asp:Content>
