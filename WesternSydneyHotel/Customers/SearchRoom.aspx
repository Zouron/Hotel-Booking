<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchRoom.aspx.cs" Inherits="WesternSydneyHotel.Customers.SearchRoom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Search Available Rooms</h1>

    <p>
    <asp:Label ID="bedQuantity" runat="server" Text="Please select number of beds:" AssociatedControlID="bedsNumber02"></asp:Label>

    

    <asp:DropDownList ID="bedsNumber02" runat="server">
                    <asp:ListItem Selected="True" Value="1bed"> One Bed </asp:ListItem>
                  <asp:ListItem Value="2beds"> Two beds </asp:ListItem>
                  <asp:ListItem Value="3beds"> Three beds </asp:ListItem>
                </asp:DropDownList> 

            <asp:RequiredFieldValidator ID="reqBedsNumber" runat="server" 
                    
                    ControlToValidate="bedsNumber02" 
                    ErrorMessage="Required" 
                    ForeColor="Red">
                </asp:RequiredFieldValidator><br />
    </p>          

    <p>
    <asp:Label ID="bedOrientation" runat="server" Text="Please select orientation of beds:" AssociatedControlID="bedsOrientation02"></asp:Label>

    

    <asp:DropDownList ID="bedsOrientation02" runat="server">
                    <asp:ListItem Selected="True" Value="North"> North</asp:ListItem>
                  <asp:ListItem Value="South"> South </asp:ListItem>
                  <asp:ListItem Value="East"> East </asp:ListItem>
                  <asp:ListItem Value="West"> West </asp:ListItem>
                </asp:DropDownList>
    </p>

    <p>
    <asp:Label ID="checkIn" runat="server" Text="Please enter the check-in date:" AssociatedControlID="checkIn02"></asp:Label> 
   
     <asp:RequiredFieldValidator ID="reqCheckIn" runat="server" 
                    
                    ControlToValidate="checkIn02" 
                    ErrorMessage="Required" 
                    ForeColor="Red">
                </asp:RequiredFieldValidator><br />
   
    <asp:textbox ID="checkIn02" runat="server"></asp:textbox>

        <asp:CompareValidator ID="checkInDateVal" 
                    runat="server" 
                    ControlToValidate="checkIn02"
                    Operator="GreaterThan"
                    type="Date"
                    ErrorMessage="Check-in date after today"
                    >
                </asp:CompareValidator></br>

        <asp:RegularExpressionValidator ID="reqCheckInDate" 
                    runat="server"
                    ControlToValidate="checkIn02" 
                    ErrorMessage="Format of DD/MM/YYYY"
                    ValidationExpression="^(0[1-9]|[12][0-9]|3[01])\/((0[1-9])|(1[0-2]))\/(\d{4})$"
                    >
                </asp:RegularExpressionValidator><br />

    </p>

    <p>
    <asp:Label ID="checkOut" runat="server" Text="Please enter the check-out date:" AssociatedControlID="checkOut02"></asp:Label>
   
   
   
    <asp:textbox ID="checkOut02" runat="server"></asp:textbox>

    <asp:RequiredFieldValidator ID="reqCheck02" runat="server" 
                    
                    ControlToValidate="checkOut02" 
                    ErrorMessage="Required" 
                    ForeColor="Red">
                </asp:RequiredFieldValidator><br />

        <asp:RegularExpressionValidator ID="regCheckOut" 
                    runat="server"
                    ControlToValidate="checkOut02" 
                    ErrorMessage="Format of DD/MM/YYYY"
                    ValidationExpression="^(0[1-9]|[12][0-9]|3[01])\/((0[1-9])|(1[0-2]))\/(\d{4})$"
                    >
                </asp:RegularExpressionValidator>

        &nbsp;

        <asp:CompareValidator ID="checkOutVal" 
            runat="server"
            ControlToValidate="checkOut02"            
            ControlToCompare="checkIn02"            
            Operator="GreaterThan"
            ErrorMessage="Has to be after check-in date"
            >
        </asp:CompareValidator><br />

    </p>

    <asp:Button ID="submitConfirm" runat="server" Text="Submit" CausesValidation="true" OnClientClick="returnConfirm('Are you sure information is correct.')" />


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:customerConnectionString %>" SelectCommand="SELECT * FROM [rooms]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="rid">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="rid" HeaderText="rid" ReadOnly="True" SortExpression="rid" />
            <asp:BoundField DataField="level" HeaderText="level" SortExpression="level" />
            <asp:BoundField DataField="beds" HeaderText="beds" SortExpression="beds" />
            <asp:BoundField DataField="orientation" HeaderText="orientation" SortExpression="orientation" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
        </Columns>
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
    <br />

    <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                  <asp:Label
                  id="lblResult"
                  Runat="server" />
            </div>
        </div>

</asp:Content>
