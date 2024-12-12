<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEmp.aspx.cs" Inherits="Newsletter.AddEmp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Additional Custom Styles */
        .form-container {
            max-width: 600px;
            margin: 50px auto;
        }

        .card-header {
            background-color: #007bff;
            color: white;
        }

        .btn-save {
            width: 100%;
            margin-top: 10px;
        }

        .btn-update {
            width: 100%;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container form-container">
            <div class="card shadow">
                <div class="card-header text-center">
                    <h4>Add Employee</h4>
                </div>
                <div class="card-body">
                    <!-- Employee Name -->
                    <div class="mb-3">
                        <label for="txtname" class="form-label">Employee Name</label>
                        <asp:TextBox ID="txtname" runat="server" CssClass="form-control" placeholder="Enter employee name"></asp:TextBox>
                    </div>

                    <!-- Email ID -->
                    <div class="mb-3">
                        <label for="txtemail" class="form-label">Email ID</label>
                        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Enter email"></asp:TextBox>
                    </div>

                    <!-- Department -->
                    <div class="mb-3">
                        <label for="txtdept" class="form-label">Department</label>
                        <asp:TextBox ID="txtdept" runat="server" CssClass="form-control" placeholder="Enter department"></asp:TextBox>
                    </div>

                    <!-- Designation -->
                    <div class="mb-3">
                        <label for="txtdesignation" class="form-label">Designation</label>
                        <asp:TextBox ID="txtdesignation" runat="server" CssClass="form-control" placeholder="Enter designation"></asp:TextBox>
                    </div>

                    <!-- Regions -->
                    <div class="mb-3">
                        <label for="ddlRegions" class="form-label">Regions</label>
                        <asp:DropDownList ID="ddlRegions" runat="server" CssClass="form-select">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Africa</asp:ListItem>
                            <asp:ListItem>Asia</asp:ListItem>
                            <asp:ListItem>Europe</asp:ListItem>
                            <asp:ListItem>Americas</asp:ListItem>
                            <asp:ListItem>Oceania</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- Countries -->
                    <div class="mb-3">
                        <label for="txtcountries" class="form-label">Countries</label>
                        <asp:TextBox ID="txtcountries" runat="server" CssClass="form-control" placeholder="Enter countries"></asp:TextBox>
                    </div>

                    <!-- Location -->
                    <div class="mb-3">
                        <label for="txtlocation" class="form-label">Location</label>
                        <asp:TextBox ID="txtlocation" runat="server" CssClass="form-control" placeholder="Enter location"></asp:TextBox>
                    </div>

                    <!-- Buttons -->
                    <asp:Button ID="btInsert" runat="server" CssClass="btn btn-primary btn-save" Text="Save" OnClick="btInsert_Click" Visible="false" />
                    <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-success btn-update" Text="Update Employee" OnClick="btnUpdate_Click" Visible="false" />
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
