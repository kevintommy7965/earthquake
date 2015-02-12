<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insertEQ.aspx.cs" Inherits="earthquake.backstage.insertEQ" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="refresh" content="5" >
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:EQdbConnectionString %>" DeleteCommand="DELETE FROM [EQ] WHERE [EventId] = @original_EventId AND (([alert_title] = @original_alert_title) OR ([alert_title] IS NULL AND @original_alert_title IS NULL)) AND (([alert_color] = @original_alert_color) OR ([alert_color] IS NULL AND @original_alert_color IS NULL)) AND (([latitude] = @original_latitude) OR ([latitude] IS NULL AND @original_latitude IS NULL)) AND (([longitude] = @original_longitude) OR ([longitude] IS NULL AND @original_longitude IS NULL)) AND (([EventOriginTime] = @original_EventOriginTime) OR ([EventOriginTime] IS NULL AND @original_EventOriginTime IS NULL)) AND (([EventLocationName] = @original_EventLocationName) OR ([EventLocationName] IS NULL AND @original_EventLocationName IS NULL)) AND (([EventDepth] = @original_EventDepth) OR ([EventDepth] IS NULL AND @original_EventDepth IS NULL)) AND (([EventMagnitudeDescription] = @original_EventMagnitudeDescription) OR ([EventMagnitudeDescription] IS NULL AND @original_EventMagnitudeDescription IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))" InsertCommand="INSERT INTO [EQ] ([EventId], [alert_title], [alert_color], [latitude], [longitude], [EventOriginTime], [EventLocationName], [EventDepth], [EventMagnitudeDescription], [Description]) VALUES (@EventId, @alert_title, @alert_color, @latitude, @longitude, @EventOriginTime, @EventLocationName, @EventDepth, @EventMagnitudeDescription, @Description)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [EQ] ORDER BY [EventId] DESC" UpdateCommand="UPDATE [EQ] SET [alert_title] = @alert_title, [alert_color] = @alert_color, [latitude] = @latitude, [longitude] = @longitude, [EventOriginTime] = @EventOriginTime, [EventLocationName] = @EventLocationName, [EventDepth] = @EventDepth, [EventMagnitudeDescription] = @EventMagnitudeDescription, [Description] = @Description WHERE [EventId] = @original_EventId AND (([alert_title] = @original_alert_title) OR ([alert_title] IS NULL AND @original_alert_title IS NULL)) AND (([alert_color] = @original_alert_color) OR ([alert_color] IS NULL AND @original_alert_color IS NULL)) AND (([latitude] = @original_latitude) OR ([latitude] IS NULL AND @original_latitude IS NULL)) AND (([longitude] = @original_longitude) OR ([longitude] IS NULL AND @original_longitude IS NULL)) AND (([EventOriginTime] = @original_EventOriginTime) OR ([EventOriginTime] IS NULL AND @original_EventOriginTime IS NULL)) AND (([EventLocationName] = @original_EventLocationName) OR ([EventLocationName] IS NULL AND @original_EventLocationName IS NULL)) AND (([EventDepth] = @original_EventDepth) OR ([EventDepth] IS NULL AND @original_EventDepth IS NULL)) AND (([EventMagnitudeDescription] = @original_EventMagnitudeDescription) OR ([EventMagnitudeDescription] IS NULL AND @original_EventMagnitudeDescription IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_EventId" Type="Int32" />
                <asp:Parameter Name="original_alert_title" Type="String" />
                <asp:Parameter Name="original_alert_color" Type="String" />
                <asp:Parameter Name="original_latitude" Type="String" />
                <asp:Parameter Name="original_longitude" Type="String" />
                <asp:Parameter Name="original_EventOriginTime" Type="String" />
                <asp:Parameter Name="original_EventLocationName" Type="String" />
                <asp:Parameter Name="original_EventDepth" Type="String" />
                <asp:Parameter Name="original_EventMagnitudeDescription" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EventId" Type="Int32" />
                <asp:Parameter Name="alert_title" Type="String" />
                <asp:Parameter Name="alert_color" Type="String" />
                <asp:Parameter Name="latitude" Type="String" />
                <asp:Parameter Name="longitude" Type="String" />
                <asp:Parameter Name="EventOriginTime" Type="String" />
                <asp:Parameter Name="EventLocationName" Type="String" />
                <asp:Parameter Name="EventDepth" Type="String" />
                <asp:Parameter Name="EventMagnitudeDescription" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="alert_title" Type="String" />
                <asp:Parameter Name="alert_color" Type="String" />
                <asp:Parameter Name="latitude" Type="String" />
                <asp:Parameter Name="longitude" Type="String" />
                <asp:Parameter Name="EventOriginTime" Type="String" />
                <asp:Parameter Name="EventLocationName" Type="String" />
                <asp:Parameter Name="EventDepth" Type="String" />
                <asp:Parameter Name="EventMagnitudeDescription" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="original_EventId" Type="Int32" />
                <asp:Parameter Name="original_alert_title" Type="String" />
                <asp:Parameter Name="original_alert_color" Type="String" />
                <asp:Parameter Name="original_latitude" Type="String" />
                <asp:Parameter Name="original_longitude" Type="String" />
                <asp:Parameter Name="original_EventOriginTime" Type="String" />
                <asp:Parameter Name="original_EventLocationName" Type="String" />
                <asp:Parameter Name="original_EventDepth" Type="String" />
                <asp:Parameter Name="original_EventMagnitudeDescription" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EventId" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="287px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="EventId" HeaderText="EventId" ReadOnly="True" SortExpression="EventId" />
                <asp:BoundField DataField="alert_title" HeaderText="alert_title" SortExpression="alert_title" />
                <asp:BoundField DataField="alert_color" HeaderText="alert_color" SortExpression="alert_color" />
                <asp:BoundField DataField="latitude" HeaderText="latitude" SortExpression="latitude" />
                <asp:BoundField DataField="longitude" HeaderText="longitude" SortExpression="longitude" />
                <asp:BoundField DataField="EventOriginTime" HeaderText="EventOriginTime" SortExpression="EventOriginTime" />
                <asp:BoundField DataField="EventLocationName" HeaderText="EventLocationName" SortExpression="EventLocationName" />
                <asp:BoundField DataField="EventDepth" HeaderText="EventDepth" SortExpression="EventDepth" />
                <asp:BoundField DataField="EventMagnitudeDescription" HeaderText="EventMagnitudeDescription" SortExpression="EventMagnitudeDescription" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <br />
    
    </div>
    </form>
</body>
</html>
