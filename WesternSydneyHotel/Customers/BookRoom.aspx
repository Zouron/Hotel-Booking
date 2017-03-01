<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookRoom.aspx.cs" Inherits="WesternSydneyHotel.Customers.BookRoom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="RoomIdList" runat="server" ConnectionString='<%$ ConnectionStrings:customerConnectionString %>' SelectCommand="SELECT [rid] FROM [rooms]"></asp:SqlDataSource>
    <h1>Book Room</h1>
    <p>
        <asp:Label ID="RoomSelectionLabel"  CssClass="labels" AssociatedControlID="RoomSelection" runat="server" Text="Room Number:"></asp:Label>
        <asp:DropDownList ID="RoomSelection" runat="server" DataSourceID="RoomIdList" DataTextField="rid" DataValueField="rid" AppendDataBoundItems="True">
            <asp:ListItem Value="0">Select</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RoomSelectionValidator" ControlToValidate="RoomSelection" runat="server" 
            ErrorMessage="Please select a room"
            Display="Dynamic"
            CssClass="error"
            InitialValue="0">
        </asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="CheckinLabel" AssociatedControlID="CheckinInput" CssClass="labels" runat="server" Text="Check-In Date:"></asp:Label>
        <asp:TextBox ID="CheckinInput" runat="server" TextMode="Date"></asp:TextBox>
        <asp:RequiredFieldValidator ID="CheckinRequired" ControlToValidate="CheckinInput" runat="server" 
            ErrorMessage="Please select a Check-in date"
            Display="Dynamic"
            CssClass="error">
        </asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CheckinValidator" ControlToValidate="CheckinInput" runat="server" 
            ErrorMessage="Must be after today"
            Display="Dynamic"
            CssClass="error"
            Type="String"
            Operator="GreaterThan">
        </asp:CompareValidator>
    </p>
    <p>
        <asp:Label ID="CheckoutLabel" AssociatedControlID="CheckoutInput" CssClass="labels" runat="server" Text="Check-Out Date"></asp:Label>
        <asp:TextBox ID="CheckoutInput" runat="server" TextMode="Date"></asp:TextBox>
        <asp:RequiredFieldValidator ID="CheckoutRequired" ControlToValidate="CheckoutInput" runat="server" 
            ErrorMessage="Please select a Check-out date"
            Display="Dynamic"
            CssClass="error">
        </asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CheckoutValidator" ControlToValidate="CheckoutInput" runat="server" 
            ErrorMessage="Must be after check-in date"
            Display="Dynamic"
            CssClass="error"
            Type="String" ControlToCompare="CheckinInput"            
            Operator="GreaterThan"
            >
        </asp:CompareValidator>
    </p>
    <p>
        <asp:Button ID="Submit" CssClass="btn btn-default" runat="server" Text="Submit" CausesValidation="true"  OnClientClick="returnConfirm('Are you sure information is correct.')" />

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                  <asp:Label
                  id="lblResult"
                  Runat="server" />
            </div>
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="RoomIdList" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </div>

    

    </p>
</asp:Content>
