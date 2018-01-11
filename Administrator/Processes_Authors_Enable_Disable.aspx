<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Processes_Authors_Enable_Disable.aspx.cs" Inherits="Processes_Authors_Enable_Disable" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Table runat="server" SkinID="skiFrame">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button runat="server" ID="btnMenu" CausesValidation="false" OnClick="btnMenu_Click" Text="Menu" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button runat="server" ID="btnEnable" OnClick="btnEnable_Click" Text="Enable" />&nbsp
                            <asp:Button runat="server" ID="btnDisable" OnClick="btnDisable_Click" Text="Disable" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" Text=" Enable or disable the website for authors." />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Table runat="server" ID="objTable" SkinID="skiTableReport"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>