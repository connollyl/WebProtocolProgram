﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Prog4/Prog4MasterPage.Master" AutoEventWireup="true" CodeBehind="Updating.aspx.cs" Inherits="WebSite.Prog4.Updating" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 70px;
        }
        .auto-style3 {
            width: 70px;
            height: 63px;
        }
        .auto-style4 {
            width: 158px;
        }
        .auto-style5 {
            width: 158px;
            height: 63px;
        }
        .auto-style6 {
            margin-left: 20px;
        }
        .auto-style7 {
            margin-left: 19px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style4">
                <asp:DetailsView ID="DeVProduct" runat="server" AutoGenerateRows="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="ProductID" DataSourceID="SDSProduct" ForeColor="Black" GridLines="None" Height="50px" Width="125px" AllowPaging="True" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" AutoGenerateInsertButton="True" CssClass="auto-style7" OnItemDeleted="DeVProduct_ItemDeleted" OnItemInserted="DeVProduct_ItemInserted" OnItemUpdated="DeVProduct_ItemUpdated">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <Fields>
                        <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" />
                        <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                        <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    </Fields>
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerSettings Visible="False" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                </asp:DetailsView>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Button ID="btnFirst" runat="server" Text="First" OnClick="btnFirst_Click" />
            </td>
            <td class="auto-style5">
                <asp:Button ID="btnPrevious" runat="server" Text="Previous" OnClick="btnPrevious_Click" />
                <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="auto-style6" OnClick="btnNext_Click" />
            </td>
            <td class="auto-style3">
                <asp:Button ID="btnLast" runat="server" Text="Last" OnClick="btnLast_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtMessage" runat="server" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style4">
                <asp:SqlDataSource ID="SDSProduct" runat="server" ConnectionString="<%$ ConnectionStrings:UWPCS3870ConnectionString %>" SelectCommand="SELECT * FROM [Product]" DeleteCommand="delete from Product where ProductID = @ProductID" InsertCommand="insert into Product(ProductID, ProductName, UnitPrice, Description) values (@ProductID, @ProductName, @UnitPrice, @Description)" UpdateCommand="update Product Set ProductName = @ProductName, UnitPrice = @UnitPrice, Description = @Description where ProductID = @ProductID"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DataSourceHolder" runat="server">
</asp:Content>