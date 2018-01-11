<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Options_Display.aspx.cs" Inherits="Options_Display" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Table runat="server" SkinID="skiFrame">
        <asp:TableRow>
            <asp:TableCell VerticalAlign="Top">
                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:SiteMapDataSource runat="server" ID="smdSiteMapDataSource" SiteMapProvider="SiteMapAdministrator" />
                            <asp:Menu runat="server" DataSourceID="smdSiteMapDataSource" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>

